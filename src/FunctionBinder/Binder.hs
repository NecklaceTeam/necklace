module FunctionBinder.Resolver where

import qualified Necklace.AST as N
import qualified Data.Set as S
import qualified Data.Map as M

import Control.Monad.State (StateT (runStateT), gets, modify, void, State)
import Control.Monad.Identity (Identity (runIdentity))
import Control.Monad.Except (ExceptT, MonadError (throwError), runExceptT)
import Data.IntMap.Strict (insert)

data PointerBind = PointerBind { _name :: String, _bindingTable :: String, _bindedFunction :: String}
-- data VariableDefinition = Variable {_vType :: N.Type, _bindings :: S.Set N.Function}  
newtype PointerDefinition = PointerDefinition { _bindings :: S.Set PointerBind }

newtype Context = BinderContext { _pointerBindings :: M.Map String PointerDefinition }

type FunctionBinder = ExceptT String (StateT Context Identity)

resolveBindings :: Context -> FunctionBinder N.AST ->  (Either String N.AST, Context) 
resolveBindings ctx binder =  runIdentity $ runStateT (runExceptT binder) ctx

-- Passing function as an argument -- aka function pointers


-- Bindings design
-- Each function has a generated additional function named binding resolver, binding resolver has the same 
-- signature + binding table 
--  
-- IDEA 
-- GENERATE FUNCTION X_BINDING_RESOLVER, IT SETS UP IF TO CHECK IF INDEX IS BINDED
-- CURRENTLY IT CONTAINS ONLY BIIIIG LIST OF IFS, IN THE FUTURE WE WANT TO OPOTIMIZE IT 
-- TO PERFORM SYMBOLIC OPTIMIZATIONS

-- 

-- How to pass function as the argument
-- to resolve it on the level of an AST we need to provide a way to pass funcitons as arguments
-- It is probably easily doable in terms of llvm, each functions is a operand itself 

--  


-- resolveForFunction :: N.Function -> FunctionBinder N.AST
-- resolveForFunction = 

-- bindings :: N.AST -> FunctionBinder N.AST 
-- bindings = mapM resolveForFunction

-- bind :: N.Function -> FunctionBinder
-- bind = do


-- insertContexts :: N.AST -> N.AST
-- insertContexts ((N.Function name (N.FunctionType decs ret) body):fs) = 
--     let ctxArgs = [(N.Declaration "bdFunc" String),
--                    (N.Declaration "bdTabl" (Pointer N.Int))] in
--    (N.Function name (N.FunctionType (ctxArgs ++ decs) ret) body):ins 


-- TODO Analyzer
-- forbid function name "not_existing"
-- forbid argument name "bdFunc"
-- forbid argument name "bdTable"



-- func effect (string, pointerBin: *int, pointer: *int,  x: int){

-- }


-- func main {
--     x: *int
--     int x_binded_234215: *int

--     x = malloc(1)

--     // first bind to the array
--     bind x 0 effect

--     // it is replaced by
--     x_binded_234215 = malloc(1, bool)
--     *access(x_binded_234215, 0) = 1
--     // also we set 

--     *access(x, r) = 100000
--     if *access(x_binded_234215, r) do
--         call effect x r
-- }
