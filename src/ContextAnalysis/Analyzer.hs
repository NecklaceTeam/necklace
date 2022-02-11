{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -Wno-deprecations #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE RecursiveDo #-}
module ContextAnalysis.Analyzer where
import qualified Necklace.AST as AST
import qualified Data.Map as M
import Control.Monad.State (StateT (runStateT), gets, modify, void)
import Control.Monad.Identity (Identity (runIdentity))
import Control.Monad.Error (ErrorT, MonadError (throwError), runErrorT)
import Control.Lens (makeLenses, view, over, (^.), set)
import Control.Monad (unless)
import Data.List
import Debug.Trace (traceShow)
import StandardLib.StandardLib (builtInFunctions)
import ContextAnalysis.AnalyzerTypes


data FunctionContext = FunctionContext { _returnType:: Maybe ExpressionType
                                       , _registeredVariables:: M.Map String ExpressionType
                                       , _callableFunctions:: M.Map String FunctionType
                                       }
    deriving (Eq, Show)
makeLenses ''FunctionContext

data Context = Context { _registeredFunctions:: M.Map String FunctionType
                       , _errors:: [String]
                       }
    deriving (Eq, Show)
makeLenses ''Context


emptyFunctionContext:: ExpressionType -> FunctionContext
emptyFunctionContext Undefined = FunctionContext {
        _returnType=Nothing,
        _registeredVariables=M.empty,
        _callableFunctions=M.empty
    }
emptyFunctionContext rType = FunctionContext {
        _returnType=Just rType,
        _registeredVariables=M.empty,
        _callableFunctions=M.empty
    }


emptyContext:: Context
emptyContext = Context {
        _registeredFunctions=(M.fromList builtInFunctions),
        _errors= []
    }

type FunctionAnalyzer = (ErrorT String (StateT FunctionContext Identity))

analyzeFunction:: FunctionContext -> FunctionAnalyzer ExpressionType -> (Either String ExpressionType, FunctionContext)
analyzeFunction ctx m = runIdentity (runStateT (runErrorT m) ctx)

type Analyzer = (StateT Context Identity)

analyze:: Context -> Analyzer () -> ((), Context)
analyze ctx m = runIdentity (runStateT m ctx)

toExpressionType:: AST.Type -> ExpressionType
toExpressionType AST.Int = Int
toExpressionType AST.Bool = Bool 
toExpressionType (AST.Array t) = Array (toExpressionType t)
toExpressionType (AST.Pointer t) = Pointer (toExpressionType t)


toExpressionTypeReturn:: AST.ReturnType  -> Maybe ExpressionType
toExpressionTypeReturn (AST.ReturnType t) = Just $ toExpressionType t
toExpressionTypeReturn AST.Void = Nothing


literalType:: AST.Literal -> FunctionAnalyzer ExpressionType
literalType (AST.IntLiteral _) = return Int
literalType (AST.BoolLiteral _) = return Bool
literalType (AST.ArrayLiteral []) = return (Array Any) 
literalType (AST.ArrayLiteral [x]) = Array <$> expressionType x
literalType (AST.ArrayLiteral (x:y:xs)) = do
    ft <- expressionType x
    st <- expressionType y
    if ft == st then
        literalType (AST.ArrayLiteral (y:xs))
    else
        throwError "All values in array must be of the same type"

variableType:: String -> FunctionAnalyzer ExpressionType
variableType name = do
        typesMap <- gets (^. registeredVariables)
        case M.lookup name typesMap of
            Just a -> return a
            Nothing -> throwError ("Variable " ++ name ++ " is not declared")

binaryIntOp:: String -> AST.Expression -> AST.Expression -> FunctionAnalyzer ExpressionType
binaryIntOp name l r = do
    lt <- expressionType l
    rt <- expressionType r
    case (lt,rt) of
        (Int, Int) -> return Int
        _ -> throwError (name ++ " has type Int x Int -> Int")

binaryBoolOp ::String -> AST.Expression -> AST.Expression -> FunctionAnalyzer ExpressionType
binaryBoolOp name l r = do
    lt <- expressionType l
    rt <- expressionType r
    case (lt,rt) of
        (Bool, Bool) -> return Bool
        _ -> throwError (name ++ " has type Bool x Bool -> Bool")

binaryCompOp ::String -> AST.Expression -> AST.Expression -> FunctionAnalyzer ExpressionType
binaryCompOp name l r = do
    lt <- expressionType l
    rt <- expressionType r
    case (lt,rt) of
        (Int, Int) -> return Bool
        _ -> throwError (name ++ " has type Int x Int -> Bool")



operatorType:: AST.Operator -> FunctionAnalyzer ExpressionType
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
operatorType (AST.Multiply l r) = binaryIntOp "Multiply" l r
operatorType (AST.Divide l r) = binaryIntOp "Divide" l r
operatorType (AST.Modulo l r) = binaryIntOp "Modulo" l r
operatorType (AST.Less l r) = binaryCompOp "Less" l r
operatorType (AST.LessEq l r) = binaryCompOp "LessEq" l r
operatorType (AST.Greater l r) = binaryCompOp "Greater" l r
operatorType (AST.GreaterEq l r) = binaryCompOp "GreaterEq" l r
operatorType (AST.Equal l r) = binaryBoolOp "Equal" l r
operatorType (AST.NotEqual l r) = binaryBoolOp "NotEqual" l r
operatorType (AST.And l r) = binaryBoolOp "And" l r
operatorType (AST.Or l r) = binaryBoolOp "Or" l r
operatorType (AST.Assign n v) = do
    varT <- variableType n
    valT <- expressionType v
    case (varT, valT) of
        (Int, Int) -> return Int
        (Bool, Bool) -> return Bool
        (Pointer a, Pointer b) -> if a == b then return $ Pointer a else throwError "Incorrect assignment"
        (Array a, Array b) ->  if a == b then return $ Array a else throwError "Incorrect assignment"
        (a, Any) -> return a
        (_, _) ->  throwError $ "Incorrect assignment " ++ show valT ++ " to " ++ show varT

operatorType (AST.ArrayIndex a n) = do
    varA <- expressionType a
    valN <- expressionType n
    case(varA, valN) of
        (Array z, Int) -> return z
        (Array z,_) -> throwError $ "Index expression shoud yield Int"
        (_,_) -> throwError $ "Value is not an Array"


compareTypes:: [ExpressionType] -> [ExpressionType] -> FunctionAnalyzer ExpressionType
compareTypes re ex = do
    -- TODO types validation
    if re /= ex then throwError "Incorrect types" else return Undefined


validateArguments:: [AST.Expression] -> [ExpressionType] -> FunctionAnalyzer ExpressionType
validateArguments exs expectedTypes = do
    -- TODO rewrite with fold
    recTypes <- mapM expressionType exs
    compareTypes recTypes expectedTypes


expressionType:: AST.Expression -> FunctionAnalyzer ExpressionType
expressionType (AST.SubExpression expr) = expressionType expr
expressionType (AST.LiteralExpression lit) = literalType lit
expressionType (AST.Operation op) = operatorType op
expressionType (AST.Variable name) = variableType name
expressionType (AST.FunctionCall name args) = do
    rgF <- gets $ view callableFunctions
    fType  <- (case M.lookup name rgF of
            Nothing -> throwError $ "Function " ++ name ++ "is not defined"
            Just et -> return et)
    void $ validateArguments args (fType ^. arguments)
    maybe (return Undefined) return (view returned fType)


validateStatement:: AST.Statement -> FunctionAnalyzer ExpressionType;
validateStatement (AST.ExpressionStatement expr) = Any <$ expressionType expr
validateStatement (AST.ReturnStatement expr) = do
    expType <- expressionType expr
    retType <- gets (^. returnType)
    case (expType, retType) of
         (_, Nothing) -> throwError "Unexpected return type"
         (a, Just b) -> if a /= b then
                throwError "Expected other return type"
              else
                return Any

validateStatement AST.VoidReturnStatement = do
    retType <- gets (^. returnType)
    unless False $ throwError "xDDDD"
    case retType of
        Nothing -> return Undefined
        _ -> throwError "Expected return"

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

validateBody:: AST.Body -> FunctionAnalyzer ExpressionType
validateBody (AST.Body st) = validateStatements st

validateStatements:: [AST.Statement] -> FunctionAnalyzer ExpressionType
validateStatements sts = Any <$ mapM validateStatement sts

registerVariable:: AST.Declaration -> FunctionAnalyzer ExpressionType
registerVariable (AST.Declaration name tp) = do
    variableMap <- gets (^. registeredVariables)
    if M.member name variableMap then
        throwError ("Variable " ++ name ++" is already declared in this scope")
    else 
        (modify . over registeredVariables. M.insert name . toExpressionType) tp 
    return Any

cleanRegisteredVariables:: FunctionAnalyzer ExpressionType
cleanRegisteredVariables = do
    (modify . set registeredVariables) M.empty
    return Any

validateFunction:: AST.Function -> FunctionAnalyzer ExpressionType
validateFunction (AST.Function _ args rType (AST.FunctionBody dcs sts)) = do
    mapM_ registerVariable args
    mapM_ registerVariable dcs
    (modify . set returnType . toExpressionTypeReturn ) rType
    void $ validateStatements sts
    return Any


registerFunction:: AST.Function -> Analyzer ()
registerFunction (AST.Function name args rType _) = do
    let argsT = map (toExpressionType . \(AST.Declaration _ t) -> t) args
    let functionType = FunctionType argsT $ toExpressionTypeReturn rType
    (modify . over registeredFunctions. M.insert name) functionType
    return ()

appendError:: String -> Analyzer ()
appendError err = do
    modify $ over errors (err:)
    return ()


validateAST:: AST.AST -> Analyzer ()
validateAST (AST.AST []) = return ()
validateAST (AST.AST (f:fs)) = mdo
    registerFunction f
    regFuncs <- gets (^. registeredFunctions)
    let funcCtx = set callableFunctions regFuncs (emptyFunctionContext Undefined)
    let result = analyzeFunction funcCtx (validateFunction f)
    case result of
        (Left err, _) -> appendError err
        (_, _) -> return ()
    validateAST $ AST.AST fs


validate:: AST.AST -> Either String AST.AST
validate ast = case ctx ^. errors of
                    [] -> return ast
                    err -> Left (intercalate "\n" (map ("ERROR: " ++ ) err))
    where ((), ctx) = analyze emptyContext $ validateAST ast
