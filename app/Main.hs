module Main where
import Compiler.Parser (parser, parse)
import System.Environment (getArgs)
import ContextAnalysis.Analyzer (validate)
import Codegen.Codegen (codegenProgram)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import System.IO (openFile, IOMode (ReadMode))
import Debug.Trace
import qualified Necklace.AST as NAST
import LLVM.Pretty (ppllvm)
import Data.Text.Lazy (toStrict)
import System.Process (callProcess)

import qualified LLVM.AST as LAST
import qualified LLVM.Module                   as LLVM
import           LLVM.Context                   ( withContext )
import           LLVM.Analysis                  ( verify )


compile :: String -> Either String LAST.Module
compile input = do
    ast <- parse input
    tast <- validate $ traceShow ast ast
    return $ codegenProgram tast
    

llvmTypecheck :: LAST.Module -> IO ()
llvmTypecheck modu = do
  withContext $ \ctx -> LLVM.withModuleFromAST ctx modu
    (\modl -> verify modl >> LLVM.writeBitcodeToFile (LLVM.File "output.ll") modl)


toText ::  LAST.Module -> T.Text
toText modu = toStrict . ppllvm $ modu


main :: IO ()
main = do
    (firstArg:_) <- getArgs
    file <- readFile firstArg
    putStrLn file
    case compile file of
        Left err -> putStrLn err
        Right lmod -> do
            T.putStrLn $ toText lmod
            llvmTypecheck lmod
            callProcess "llc-9" ["output.ll"]
            callProcess "gcc" ["output.s", "runtime.c", "-o", "a.out"]
            callProcess "rm" ["output.s", "output.ll"]

     

