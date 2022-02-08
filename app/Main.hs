module Main where
import Compiler.Parser (parser, parse)
import System.Environment (getArgs)
import ContextAnalysis.Analyzer (validate)
import Codegen.Codegen (codegen)
import qualified Data.Text as T
import qualified Data.Text.IO as T
import System.IO (openFile, IOMode (ReadMode))
import Debug.Trace


compile :: String -> Either String T.Text
compile input = do
    ast <- parse input
    -- Left $ show ast
    tast <- validate $ traceShow ast ast
    return $ codegen tast


main :: IO ()
main = do
    (firstArg:_) <- getArgs
    file <- readFile firstArg
    putStrLn file
    case compile file of
        Left err -> putStrLn err
        Right lmod -> T.putStrLn lmod

     

