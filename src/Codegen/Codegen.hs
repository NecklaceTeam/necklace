{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE TupleSections #-}
module Codegen.Codegen where

import qualified Data.Map as M
import Data.Text (Text)
import Control.Monad.State (State, gets, modify, get, MonadState, evalState)

import qualified LLVM.IRBuilder.Module as LModule
import qualified LLVM.IRBuilder.Monad  as LMonad
import qualified LLVM.IRBuilder.Instruction as LInstruction
import qualified LLVM.IRBuilder.Constant as LConstant
import qualified LLVM.AST.Type as LTypes
import qualified LLVM.AST as LAST

import qualified Necklace.AST as N
import qualified Control.Monad.ST as N
import qualified Data.ByteString.Short (toShort, ShortByteString)
import Control.Monad.State.Lazy ()
import Control.Monad (void)
import Data.ByteString.UTF8 (fromString)
import Data.ByteString.Short (toShort)
import LLVM.Pretty (ppllvm)
import Data.Text.Lazy (toStrict)

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


returnTypeToAstType:: N.ReturnType -> LAST.Type
returnTypeToAstType (N.ReturnType t) = toAstType t
returnTypeToAstType N.Void = LTypes.void 


genOperator:: N.Operator -> Generator LAST.Operand
genOperator (N.Plus exprL exprR) = do
  lhs <- genExpression exprL
  rhs <- genExpression exprR
  LInstruction.add lhs rhs

genOperator (N.Minus exprL exprR) = do
  lhs <- genExpression exprL
  rhs <- genExpression exprR
  LInstruction.sub lhs rhs

genOperator (N.Multiply exprL exprR) = do
  lhs <- genExpression exprL
  rhs <- genExpression exprR
  LInstruction.mul lhs rhs

genOperator (N.Divide exprL exprR) = do
  lhs <- genExpression exprL
  rhs <- genExpression exprR
  LInstruction.sdiv lhs rhs

genOperator (N.Modulo exprL exprR) = do
  lhs <- genExpression exprL
  rhs <- genExpression exprR
-- Maybe we should get real modulus here?
  LInstruction.srem lhs rhs

genOperator (N.Assign name expr) = do
  lOp <- gets ((M.! name) . operands)
  rOp <- genExpression expr
  LInstruction.store lOp 0 rOp
  return rOp




genExpression:: N.Expression  -> Generator LAST.Operand
genExpression (N.LiteralExpression (N.IntLiteral x)) = do
  return $ LConstant.int32 (fromIntegral x)

genExpression (N.LiteralExpression (N.BoolLiteral x)) = do
  return $ LConstant.bit (if x then 1 else 0)

genExpression (N.Operation oper) = genOperator oper
genExpression (N.SubExpression expr) = genExpression expr 
genExpression (N.FunctionCall name exprs) = do
  funcOp <- gets ((M.! name) . operands)
  args <- mapM_ (genExpression exprs)
  LInstruction.call 12


-- genExpression (Variable name) =


genStatement :: N.Statement -> Generator ()
genStatement (N.ExpressionStatement st) = void $ genExpression st
genStatement (N.ReturnStatement expr) = do
  exprOp <- genExpression expr
  void $ LInstruction.ret exprOp
  
genStatement (N.VoidReturnStatement) = void $ LInstruction.retVoid


genStatements:: [N.Statement] -> Generator ()
genStatements = mapM_ genStatement


genFunction :: N.Function -> (LModule.ModuleBuilderT (State CodegenEnv)) ()
genFunction (N.Function name _ ret (N.FunctionBody _ sts)) = mdo
    registerOperandM name function
    function <- do
      let astRet = returnTypeToAstType ret
      LModule.function (LAST.mkName name) [] astRet bodyGenerator
    return ()
      where 
        bodyGenerator :: [LAST.Operand] -> Generator ()
        bodyGenerator _ = do
          _entry <- LMonad.block `LMonad.named` toName "entry"
          genStatements sts


codegenProgram :: N.AST -> LAST.Module
codegenProgram (N.AST funcs) =
  flip evalState (CodegenEnv { operands = M.empty })
    $ LModule.buildModuleT (toName "necklace")
    $ do
        mapM_ genFunction funcs
  

codegen ::  N.AST -> Text
codegen = toStrict .ppllvm . codegenProgram 

