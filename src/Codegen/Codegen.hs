{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE TupleSections #-}
module Codegen.Codegen where

import Debug.Trace
import qualified Data.Map as M
import Data.Text (Text)
import Control.Monad.State (State, gets, modify, get, MonadState, evalState)

import qualified LLVM.IRBuilder.Module as LModule
import qualified LLVM.IRBuilder.Monad  as LMonad
import qualified LLVM.IRBuilder.Instruction as LInstruction
import qualified LLVM.IRBuilder.Constant as LConstant
import qualified LLVM.AST.Type as LTypes
import qualified LLVM.AST as LAST
import qualified LLVM.AST.IntegerPredicate as IP

import qualified Necklace.AST as N
import StandardLib.StandardLib (builtInFunctions)
import qualified Control.Monad.ST as N
import qualified Data.ByteString.Short (toShort, ShortByteString)
import Control.Monad.State.Lazy ()
import Control.Monad (void, unless)
import Data.ByteString.UTF8 (fromString)
import Data.ByteString.Short (toShort)
import LLVM.Pretty (ppllvm)
import Data.Text.Lazy (toStrict)
import qualified Control.Lens as LMonad
import qualified ContextAnalysis.AnalyzerTypes as AN 
import Control.Lens ((^.))

newtype CodegenEnv = CodegenEnv {
                    operands :: M.Map String LAST.Operand }
    deriving (Eq, Show)


type Generator =  LMonad.IRBuilderT ( LModule.ModuleBuilderT (State CodegenEnv) )

registerOperand :: String -> LAST.Operand -> Generator ()
registerOperand name op =
  modify $ \env -> env { operands = M.insert name op (operands env) }

registerOperandM :: String -> LAST.Operand -> LModule.ModuleBuilderT (State CodegenEnv) ()
registerOperandM name op =
  modify $ \env -> env { operands = M.insert name op (operands env) }


toName :: String -> Data.ByteString.Short.ShortByteString
toName  = toShort . fromString


toAstType:: N.Type -> LAST.Type
toAstType N.Int = LTypes.i32
toAstType N.Bool = LTypes.i1
toAstType (N.Pointer N.Int) = LTypes.ptr LTypes.i32 
toAstType (N.Pointer N.Bool) = LTypes.ptr LTypes.i1 
toAstType (N.Pointer tp) = LTypes.ptr $ toAstType tp

returnTypeToAstType:: N.ReturnType -> LAST.Type
returnTypeToAstType (N.ReturnType t) = toAstType t
returnTypeToAstType N.Void = LTypes.void

-- we probably want to remove it and provide way to extern in the ast
expressionTypeToAST:: AN.ExpressionType -> LAST.Type
expressionTypeToAST AN.Int = LTypes.i32  
expressionTypeToAST AN.Bool = LTypes.i1  
expressionTypeToAST (AN.Pointer AN.Int) = LTypes.ptr LTypes.i32  
expressionTypeToAST (AN.Pointer AN.Bool) = LTypes.ptr LTypes.i1 
expressionTypeToAST (AN.Pointer AN.Any) = LTypes.ptr LTypes.i8 

-- This one either..., TODO clean it
returnExpressionTypeToAstType:: Maybe AN.ExpressionType -> LAST.Type
returnExpressionTypeToAstType mex = case mex of 
                                        Just a -> expressionTypeToAST a
                                        Nothing -> LTypes.ptr LTypes.i8 

genUnaryOperator:: N.Expression -> (LAST.Operand -> Generator LAST.Operand) -> Generator LAST.Operand
genUnaryOperator expr genFunc = do
  op <- genExpression expr
  genFunc op

genBinaryOperator:: N.Expression -> N.Expression ->
   (LAST.Operand -> LAST.Operand -> Generator LAST.Operand) ->
      Generator LAST.Operand
genBinaryOperator exprL exprR genFunc = do
  lhs <- genExpression exprL
  rhs <- genExpression exprR
  genFunc lhs rhs

genOperator:: N.Operator -> Generator LAST.Operand
genOperator (N.UnwrapPointer expr) = do
  genUnaryOperator expr (`LInstruction.load` 0)
genOperator (N.MinusUnary expr) = do
  genUnaryOperator expr (LInstruction.sub (LConstant.int32 0))
genOperator (N.Negation expr) = do
  genUnaryOperator expr (`LInstruction.xor` LConstant.bit 1)

genOperator (N.Plus exprL exprR) = do
  genBinaryOperator exprL exprR LInstruction.add
genOperator (N.Minus exprL exprR) = do
  genBinaryOperator exprL exprR LInstruction.sub
genOperator (N.Multiply exprL exprR) = do
  genBinaryOperator exprL exprR LInstruction.mul
genOperator (N.Divide exprL exprR) = do
  genBinaryOperator exprL exprR LInstruction.sdiv
genOperator (N.Modulo exprL exprR) = do
  -- Maybe we should get real modulus here?
  genBinaryOperator exprL exprR LInstruction.srem
genOperator (N.Less exprL exprR) = do
  genBinaryOperator exprL exprR (LInstruction.icmp IP.SLT)
genOperator (N.LessEq exprL exprR) = do
  genBinaryOperator exprL exprR (LInstruction.icmp IP.SLE)
genOperator (N.Greater exprL exprR) = do
  genBinaryOperator exprL exprR (LInstruction.icmp IP.SGT)
genOperator (N.GreaterEq exprL exprR) = do
  genBinaryOperator exprL exprR (LInstruction.icmp IP.SGE)
genOperator (N.Equal exprL exprR) = do
  genBinaryOperator exprL exprR (LInstruction.icmp IP.EQ)
genOperator (N.NotEqual exprL exprR) = do
  genBinaryOperator exprL exprR (LInstruction.icmp IP.NE)
genOperator (N.And exprL exprR) = do
  genBinaryOperator exprL exprR LInstruction.and
genOperator (N.Or exprL exprR) = do
  genBinaryOperator exprL exprR LInstruction.or
genOperator (N.Assign name expr) = do
  lOp <- gets ((M.! name) . operands)
  rOp <- genExpression expr
  LInstruction.store lOp 0 rOp
  return rOp


genExpression:: N.Expression  -> Generator LAST.Operand
genExpression (N.Operation oper) = genOperator oper
genExpression (N.SubExpression expr) = genExpression expr
genExpression (N.LiteralExpression lit) = do
  case lit of
    N.IntLiteral x -> return $ LConstant.int32 (fromIntegral x)
    N.BoolLiteral x -> return $ LConstant.bit (if x then 1 else 0)

genExpression (N.FunctionCall name exprs) = do
  funcOp <- gets ((M.! name) . operands)
  args <- mapM (fmap (, []) . genExpression) exprs
  LInstruction.call funcOp args
-- genExpression (N.ArrayIndex name exprs) = do
genExpression (N.Variable name) = do
  op <- gets ((M.! name) . operands)
  LInstruction.load op 0

genBody :: N.Body -> Generator ()
genBody (N.Body sts) = mapM_ genStatement sts

skipIfReturn :: LMonad.MonadIRBuilder m => m () -> m ()
skipIfReturn gen = do
  z <- LMonad.hasTerminator
  unless z gen

genStatement :: N.Statement -> Generator ()
genStatement (N.IfElseStatement expr bdt bdf) = mdo
  bool <- genExpression expr
  LInstruction.condBr bool trueBody falseBody

  trueBody <- LMonad.block `LMonad.named` toName "true"
  genBody bdt
  skipIfReturn $ LInstruction.br nextBlock

  falseBody <- LMonad.block `LMonad.named` toName "false"
  genBody bdf
  skipIfReturn $ LInstruction.br nextBlock

  nextBlock <- LMonad.block `LMonad.named` toName "next"
  return ()

genStatement (N.WhileStatement expr bd) = mdo
  LInstruction.br condBody

  condBody <- LMonad.block `LMonad.named` toName "cond"
  bool <- genExpression expr
  LInstruction.condBr bool whileBody next

  whileBody <- LMonad.block `LMonad.named` toName "whilebody"
  genBody bd
  LInstruction.br condBody

  next <- LMonad.block `LMonad.named` toName "next"
  return ()


genStatement (N.ExpressionStatement st) = void $ genExpression st
genStatement (N.ReturnStatement expr) = do
  exprOp <- genExpression expr
  void $ LInstruction.ret exprOp
genStatement N.VoidReturnStatement = void LInstruction.retVoid


genDeclaration:: N.Declaration -> Generator ()
genDeclaration (N.Declaration name tp) = do
  op <- LInstruction.alloca (toAstType tp) Nothing 0
  registerOperand name op


genFunction :: N.Function -> (LModule.ModuleBuilderT (State CodegenEnv)) ()
genFunction (N.Function name params ret (N.FunctionBody dec sts)) = mdo
    registerOperandM name function
    function <- do
      let paramsList = map (\(N.Declaration nm tp) -> ((toAstType tp),(LModule.ParameterName $ toName nm))) params
      let astRet = returnTypeToAstType ret
      LModule.function (LAST.mkName name) paramsList astRet bodyGenerator
    return ()
      where
        bodyGenerator :: [LAST.Operand] -> Generator ()
        bodyGenerator _ = do
          _entry <- LMonad.block `LMonad.named` toName "entry"
          mapM_ genDeclaration dec
          mapM_ genStatement sts


genBuiltIn :: (String, AN.FunctionType) -> (LModule.ModuleBuilderT (State CodegenEnv)) ()
genBuiltIn (nm, ft) = do
  let name = LAST.mkName nm 
  let args = map expressionTypeToAST . (^. AN.arguments) $ ft 
  let ret = returnExpressionTypeToAstType . (^. AN.returned) $ ft 
  funcOp <- LModule.extern name args ret
  registerOperandM nm funcOp

codegenProgram :: N.AST -> LAST.Module
codegenProgram (N.AST funcs) =
  flip evalState (CodegenEnv { operands = M.empty })
    $ LModule.buildModuleT (toName "necklace")
    $ do { mapM_ genBuiltIn builtInFunctions
         ; mapM_ genFunction funcs }

