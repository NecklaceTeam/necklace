{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -Wno-deprecations #-}
{-# LANGUAGE TemplateHaskell #-}
module ContextAnalysis.Analyzer where
import qualified Necklace.AST as AST
import qualified Data.Map as M
import Control.Monad.State (StateT (runStateT), gets, modify, void)
import Control.Monad.Identity (Identity (runIdentity))
import Control.Monad.Error (ErrorT, MonadError (throwError), runErrorT)
import Control.Lens (makeLenses, view, over, (^.), set)



data ExpressionType = Int | Bool | Array ExpressionType | Pointer ExpressionType | Any
    deriving (Show)
instance Eq ExpressionType where
  (==) Any _ = True
  (==) _ Any = True
  (==) Int Int = True
  (==) Bool Bool = True
  (==) (Array a) (Array b) = a == b
  (==) (Pointer a) (Pointer b) = a == b 
  (==) _ _ = False


data FunctionType = FunctionType {_arguments::[ExpressionType], _returned::ExpressionType}
    deriving (Eq, Show)
makeLenses ''FunctionType


data FunctionContext = FunctionContext { _returnType:: ExpressionType
                                       , _registeredVariables:: M.Map String ExpressionType
                                       }
    deriving (Eq, Show)
makeLenses ''FunctionContext

data Context = Context { _registeredFunctions:: M.Map String FunctionType
                       , _currentFContext:: FunctionContext
                       }

    deriving (Eq, Show)
makeLenses ''Context

type Analyzer = (ErrorT String (StateT Context Identity))

emptyFunctionContext:: ExpressionType -> FunctionContext
emptyFunctionContext rType = FunctionContext {
        _returnType=rType,
        _registeredVariables=M.empty
    }

emptyContext:: Context
emptyContext = Context {
        _registeredFunctions=M.empty,
        _currentFContext=emptyFunctionContext Any
    }


analyze:: Context -> Analyzer ExpressionType -> (Either String ExpressionType, Context)
analyze ctx m = runIdentity (runStateT (runErrorT m) ctx)


toExpressionType:: AST.Type -> ExpressionType
toExpressionType AST.Int = Int
toExpressionType AST.Bool = Int
toExpressionType (AST.Array t) = Array (toExpressionType t)
toExpressionType (AST.Pointer t) = Pointer (toExpressionType t)


toExpressionTypeReturn:: AST.ReturnType  -> ExpressionType
toExpressionTypeReturn (AST.ReturnType t) = toExpressionType t
-- Idk it should be any, but can be for now
toExpressionTypeReturn AST.Void = Any


literalType:: AST.Literal -> Analyzer ExpressionType
literalType (AST.IntLiteral _) = return Int
literalType (AST.BoolLiteral _) = return Bool
literalType (AST.ArrayLiteral []) = return (Array Any)
literalType (AST.ArrayLiteral (x:_)) = Array <$> literalType x

variableType:: String -> Analyzer ExpressionType
variableType name = do
        typesMap <- gets (^. currentFContext . registeredVariables)
        case M.lookup name typesMap of
            Just a -> return a
            Nothing -> throwError ("Variable " ++ name ++ " is not declared")

binaryIntOp ::String -> AST.Expression -> AST.Expression -> Analyzer ExpressionType
binaryIntOp name l r = do
    lt <- expressionType l
    rt <- expressionType r
    case (lt,rt) of
        (Int, Int) -> return Int
        _ -> throwError (name ++ " has type Int x Int -> Int")


operatorType:: AST.Operator -> Analyzer ExpressionType
-- UNARY --
operatorType (AST.UnwrapPointer x) = do
    xt <- expressionType x
    case xt of
        Pointer o -> return o
        _ -> throwError "Value is not pointer"
operatorType (AST.MinusUnary x) = do
    xt <- expressionType x
    case xt of
        Int -> return Int
        _ -> throwError "Value is not Int"
operatorType (AST.Negation x) = do
    xt <- expressionType x
    case xt of
        Bool -> return Bool
        _ -> throwError "Value is not Bool"

-- BINARY --
operatorType (AST.Plus l r) = binaryIntOp "Plus" l r
operatorType (AST.Minus l r) = binaryIntOp "Minus" l r
operatorType (AST.Multiply l r) = binaryIntOp "Minus" l r
operatorType (AST.Divide l r) = binaryIntOp "Minus" l r
operatorType (AST.Modulo l r) = binaryIntOp "Minus" l r
operatorType (AST.Less l r) = binaryIntOp "Minus" l r
operatorType (AST.LessEq l r) = binaryIntOp "Minus" l r
operatorType (AST.Greater l r) = binaryIntOp "Minus" l r
operatorType (AST.GreaterEq l r) = binaryIntOp "Minus" l r

operatorType (AST.Equal l r) = binaryIntOp "Minus" l r
operatorType (AST.NotEqual l r) = binaryIntOp "Minus" l r
operatorType (AST.And l r) = binaryIntOp "Minus" l r
operatorType (AST.Or l r) = binaryIntOp "Minus" l r
operatorType (AST.Assign n v) = do
    varT <- variableType n
    valT <- expressionType v
    case (varT, valT) of
        (Int, Int) -> return Int
        (Bool, Bool) -> return Int
        (Pointer a, Pointer b) -> if a == b then return $ Pointer a else throwError "Incorrect assignment"
        (Array a, Array b) ->  if a == b then return $ Array a else throwError "Incorrect assignment"
        (a, Any) -> return a


compareTypes:: [ExpressionType] -> [ExpressionType] -> Analyzer ExpressionType
compareTypes re ex = do
    -- TODO types validation
    if re /= ex then throwError "Incorrect types" else return Any


validateArguments:: [AST.Expression] -> [ExpressionType] -> Analyzer ExpressionType
validateArguments exs expectedTypes = do
    -- TODO rewrite with fold
    recTypes <- mapM expressionType exs
    compareTypes recTypes expectedTypes


expressionType:: AST.Expression -> Analyzer ExpressionType
expressionType (AST.SubExpression expr) = expressionType expr
expressionType (AST.LiteralExpression lit) = literalType lit
expressionType (AST.Operation op) = operatorType op
expressionType (AST.Variable name) = variableType name
expressionType (AST.FunctionCall name args) = do
    rgF <- gets (view registeredFunctions)
    fType  <- (case M.lookup name rgF of
            Nothing -> throwError ("Function " ++ name ++ "is not defined")
            Just et -> return et)
    void $ validateArguments args  (fType ^. arguments)
    return (view returned fType)





validateStatement:: AST.Statement -> Analyzer ExpressionType;
validateStatement (AST.ExpressionStatement expr) = Any <$ expressionType expr
validateStatement (AST.ReturnStatement expr) = do
    expType <- expressionType expr
    retType <- gets (^. currentFContext . returnType)
    if expType /= retType then
        throwError "Expected other returned type"
    else
        return Any
validateStatement (AST.WhileStatement expr body) = do
    void $ validateBody body
    expType <- expressionType expr
    if expType /= Bool then
        throwError "While expression should yield to Bool"
    else
        return Any
validateStatement (AST.ForStatement exIn exC exInc bd) = do
    void $ expressionType exIn
    void $ expressionType exInc
    exCT <- expressionType exC
    void $ validateBody bd
    if exCT /= Bool then
        throwError "For expression comparator should yield to Bool"
    else
        return Any
validateStatement (AST.IfElseStatement ex ifbd ebd) = do
    void $ validateBody ifbd
    void $ validateBody ebd
    exCT <- expressionType ex
    if exCT /= Bool then
        throwError "If expression comparator should yield to Bool"
    else
        return Any
validateStatement _ = return Any

validateBody:: AST.Body -> Analyzer ExpressionType
validateBody (AST.Body st) = validateStatements st

validateStatements:: [AST.Statement] -> Analyzer ExpressionType
validateStatements sts = Any <$ mapM validateStatement sts

registerVariable:: AST.Declaration -> Analyzer ExpressionType
registerVariable (AST.Declaration name tp) = do
    (modify . over (currentFContext . registeredVariables). M.insert name . toExpressionType) tp
    return Any

cleanRegisteredVariables:: Analyzer ExpressionType
cleanRegisteredVariables = do
    (modify . set (currentFContext . registeredVariables)) M.empty
    return Any

validateFunction:: AST.Function -> Analyzer ExpressionType
validateFunction (AST.Function _ args rType (AST.FunctionBody dcs sts)) = do
    mapM_ registerVariable args
    mapM_ registerVariable dcs
    (modify . set (currentFContext . returnType) . toExpressionTypeReturn ) rType
    void $ validateStatements sts
    void cleanRegisteredVariables
    return Any
          