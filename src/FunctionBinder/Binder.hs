{-# LANGUAGE TemplateHaskell #-}
module FunctionBinder.Binder where

import qualified Necklace.AST as N
import qualified Data.Set as S
import qualified Data.Map as M

import Control.Monad.State (StateT (runStateT), gets, modify, void, State)
import Control.Monad.Identity (Identity (runIdentity))
import Control.Monad.Except (ExceptT, MonadError (throwError), runExceptT)
import Data.IntMap.Strict (insert)
import Control.Lens (makeLenses, set, over, (^.))
import Necklace.AST (Body(_bstatements))


data BinderContext = BinderContext {
    _bindableFunctions :: S.Set String,
    _bindedFunctions :: S.Set String,
    _variableBindings :: M.Map String [String]
}

makeLenses ''BinderContext

type FunctionBinder = ExceptT String (StateT BinderContext Identity)

bindInExpression:: N.Expression -> FunctionBinder N.Expression
bindInExpression expr = do
    return expr



bindInOperator:: N.Operator -> FunctionBinder N.Operator
bindInOperator (N.Assign (N.Variable vName) valE) = do --HERE finished finish it
    bValE <- bindInExpression valE
    let exprRes = N.Operation $ N.Assign (N.Variable vName) bValE
    varBindings <- gets $ (M.! vName).(^. variableBindings)
    let (N.Operation result) = foldr triggerBinding exprRes varBindings
    return result
    where triggerBinding fN vN =  N.Operation $ N.Assign vN (N.FunctionCall fN [vN])  -- TODO reverse

bindInOperator oper = return oper


bindInStatement:: N.Statement -> FunctionBinder N.Statement
bindInStatement (N.IfElseStatement expr tbody fbody) = do
    bExpr <- bindInExpression expr
    bTBody <- bindInBody tbody
    bFBody <- bindInBody fbody
    return (N.IfElseStatement bExpr bTBody bFBody)
bindInStatement (N.ExpressionStatement expr) = do
    bExpr <- bindInExpression expr
    return (N.ExpressionStatement bExpr)
bindInStatement (N.WhileStatement expr body) = do
    bExpr <- bindInExpression expr
    bBody <- bindInBody body
    return (N.WhileStatement bExpr bBody)
bindInStatement (N.ReturnStatement expr) = do
    bExpr <- bindInExpression expr
    return (N.ReturnStatement bExpr)
bindInStatement (N.BindStatement varName funcName) = do
    _variableBindings
    return $ N.BindStatement varName funcName
bindInStatement st = return st

bindInBody:: N.Body -> FunctionBinder N.Body
bindInBody body = do
    bTstatements <- mapM bindInStatement (body ^. N.bstatements)
    return $ N.Body { _bstatements=bTstatements }

bindInFunction:: N.Function -> FunctionBinder N.Function
bindInFunction fun = do
    return fun

collectFunctions:: N.AST -> FunctionBinder ()
collectFunctions ast = do
    let singleArgNames = map (^. N.fname) . filter ((== 1).length.(^. (N.ftype . N.args))) . (^. N.functions) $ ast
    let funcMap = S.fromList singleArgNames
    modify (set bindableFunctions funcMap)
    return ()

-- injectBindable = do
--     ast

bindVariables:: N.AST -> FunctionBinder N.AST
bindVariables ast = do
    collectFunctions ast
    astWithBinds <- mapM bindInFunction (ast ^. N.functions)
    return $ set N.functions astWithBinds ast


resolveBindings :: BinderContext -> FunctionBinder N.AST ->  (Either String N.AST, BinderContext)
resolveBindings ctx binder = runIdentity $ runStateT (runExceptT binder) ctx



-- TODO Analyzer
-- forbid function name "not_existing"
-- forbid argument name "bdFunc"
-- forbid argument name "bdTable"