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
import Control.Monad (unless, when)
import Data.List
import Debug.Trace (traceShow)
import StandardLib.StandardLib (builtInFunctions)
import ContextAnalysis.AnalyzerTypes


data ExpressionType = Int | Bool | Array ExpressionType | Pointer ExpressionType | Any | Undefined
    deriving (Show)

instance Eq ExpressionType where
  (==) Any _ = True
  (==) _ Any = True
  (==) Int Int = True
  (==) Bool Bool = True
  (==) (Array a) (Array b) = a == b
  (==) (Pointer a) (Pointer b) = a == b
  (==) _ _ = False


data FunctionType = FunctionType {_arguments::[ExpressionType], _returned:: Maybe ExpressionType}
    deriving (Eq, Show)
makeLenses ''FunctionType


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
        _registeredFunctions=M.fromList (map (\(a,b) -> (a, toFunctionType b)) builtInFunctions),
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

toFunctionType :: AST.FunctionType -> FunctionType
toFunctionType (AST.FunctionType params ret) = FunctionType (map toDeclarationType params) (toExpressionTypeReturn ret)

toExpressionTypeReturn:: AST.ReturnType  -> Maybe ExpressionType
toExpressionTypeReturn (AST.ReturnType t) = Just $ toExpressionType t
toExpressionTypeReturn AST.Void = Nothing

toDeclarationType :: AST.Declaration -> ExpressionType
toDeclarationType dec = toExpressionType (dec ^. AST.dtype)

literalType:: AST.Literal -> FunctionAnalyzer ExpressionType
literalType (AST.IntLiteral _) = return Int
literalType (AST.BoolLiteral _) = return Bool
literalType (AST.ArrayLiteral []) = return (Array Any)
literalType (AST.ArrayLiteral [x]) = Array <$> expressionType x
literalType (AST.ArrayLiteral (x:xs)) = do
    ft <- expressionType x
    rt <- mapM expressionType xs
    unless (all(==ft) rt) $ throwError "All values in array must be of the same type"
    return (Array ft)


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
        -- TODO: refactor
        (Pointer a, Int) -> return $ Pointer a
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
operatorType (AST.Assign var val) = do
        varT <- expressionType var
        valT <- expressionType val
        case (varT, valT) of
            (Int, Int)             | isMutable var -> return Int
            (Bool, Bool)           | isMutable var -> return Bool
            (Pointer a, Pointer b) | isMutable var -> if a == b then return $ Pointer a else throwError "Incorrect assignment"
            (Array a, Array b)     | isMutable var ->  if a == b then return $ Array a else throwError "Incorrect assignment"
            (a, Any)               | isMutable var -> return a
            (_, _)                 | isMutable var -> throwError $ "Incorrect assignment " ++ show valT ++ " to " ++ show varT
            _                                      -> throwError "Incorrect assignment to immutable expression"
operatorType (AST.MoveRight ptr idx) = do
        ptrT <- expressionType ptr
        idxT <- expressionType idx
        case (ptrT, idxT) of
            (Pointer a, Int) -> return $ Pointer a
            _                -> throwError "Pointer shift has type (Pointer a) X Int -> Pointer a"
operatorType (AST.MoveLeft ptr idx) = do
        ptrT <- expressionType ptr
        idxT <- expressionType idx
        case (ptrT, idxT) of
            (Pointer a, Int) -> return $ Pointer a
            _                -> throwError "Pointer shift has type (Pointer a) X Int -> Pointer a"           
operatorType (AST.ArrayIndex a n) = do
    varA <- expressionType a
    valN <- expressionType n
    case(varA, valN) of
        (Array z, Int) -> return z
        (Array z,_) -> throwError "Index expression should yield Int"
        _           -> throwError "Value is not an Array"
operatorType (AST.Alloc (AST.ArrayMem t n)) = do
    valN <- expressionType n
    let arrT = toExpressionType t
    case (arrT, valN) of
        (arrT,Int) -> return $ Array arrT 
        _          -> throwError "Array size should yield to Int"

isMutable :: AST.Expression -> Bool
isMutable (AST.Operation (AST.UnwrapPointer _))= True
isMutable (AST.Operation (AST.ArrayIndex _ _)) = True
isMutable (AST.Variable _) = True
isMutable _ = False

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
validateStatement (AST.BindStatement exprPtr exprIdx func) = do
    -- TODO refactor this
    let errMsg = "Bind has type (Pointer b, Int, Function(Pointer b, Int) -> void)"
    ptrType <- expressionType exprPtr
    idxType <- expressionType exprIdx
    rgF <- gets $ view callableFunctions
    unless (ptrType == Pointer Any && idxType == Int) $ throwError errMsg
    fType  <- (
        case M.lookup func rgF of
            Nothing -> throwError $ "Function " ++ func ++ "is not defined"
            Just et -> return et
        )
    let (Pointer ptrB) = ptrType
    void $ case (view returned fType, view arguments fType) of
                (Nothing, [Pointer b, Int]) -> if b == ptrB then return () 
                                               else throwError errMsg
                _ -> throwError errMsg

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
validateBody bdy = validateStatements (bdy^.AST.bstatements)

validateStatements:: [AST.Statement] -> FunctionAnalyzer ExpressionType
validateStatements sts = Any <$ mapM validateStatement sts

registerVariable:: AST.Declaration -> FunctionAnalyzer ExpressionType
registerVariable dec = do
    variableMap <- gets (^. registeredVariables)
    let name = dec^.AST.dname
    let tp = dec^.AST.dtype
    when (M.member name variableMap) $ throwError ("Variable " ++ name ++" is already declared in this scope")
    (modify . over registeredVariables. M.insert name . toExpressionType) tp
    return Any

cleanRegisteredVariables:: FunctionAnalyzer ExpressionType
cleanRegisteredVariables = do
    (modify . set registeredVariables) M.empty
    return Any

validateFunction:: AST.Function -> FunctionAnalyzer ExpressionType
validateFunction fun = do
    mapM_ registerVariable (fun^.AST.ftype.AST.args)
    mapM_ registerVariable (fun^.AST.fbody.AST.fdeclarations)
    (modify . set returnType . toExpressionTypeReturn ) (fun^.AST.ftype.AST.rtype)
    void $ validateStatements (fun^.AST.fbody.AST.fstatements)
    return Any

registerFunction:: AST.Function -> Analyzer ()
registerFunction fun = do
    functionMap <- gets (^. registeredFunctions)
    let name = fun^.AST.fname
    when (M.member name functionMap) $ appendError ("Function " ++ name ++" is already declared in this scope")
    let argsT = map toDeclarationType (fun^.AST.ftype.AST.args) 
    let functionType = FunctionType argsT $ toExpressionTypeReturn (fun^.AST.ftype.AST.rtype)
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
