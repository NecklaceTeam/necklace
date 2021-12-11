{
module Compiler.Parser.Lexer where

import Prelude hiding (lex)
import Data.Char (isAlphaNum, chr)
import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as T

}

%wrapper "monad"

$whitechar  = [\t\n\r\v\f\ ]
$boolLit    = [true false]
$special    = [\(\)\,\;\:\[\]\{\}]
@keywords   = function|if|else|for|while|return|break|continue|int|bool
@varId      = ([a-zA-Z_][a-zA-Z0-9_]*)
@operator   = "+"|"-"|"*"|"/"|"%"|"<"|">"|">="|"<="|"=="|"!="|"&&"|"||"|"->"|"!"|"="
@comment    = "~~".*
@intLit     = [0-9]+

tokens :-
<0> $white+           { skip }
<0> @comment          { skip }
<0> @keywords         { mkL TokenKeyword }
<0> @operator         { mkL TokenOperator }
<0> @intLit           { mkL TokenIntLiteral }
<0> $boolLit          { mkL TokenBoolLiteral }
<0> $special          { mkL TokenSpecial }
<0> @varId            { mkL TokenVarId }


{
data Lexeme = L AlexPosn Token String deriving (Eq, Show)

data Token =
        TokenKeyword    |
        TokenSpecial    |
        TokenOperator   |
        TokenVarId      |
        TokenBoolLiteral|
        TokenIntLiteral |
        TokenEOF
        deriving (Eq,Show)

mkL :: Token -> AlexInput -> Int -> Alex Lexeme
mkL tok (p,_,_,str) len = return $ L p tok (take len str)

alexEOF = return $ L (AlexPn (-1) (-1) (-1)) TokenEOF ""

lex :: String -> Either String [Lexeme]
lex str = runAlex str alexLex

alexLex :: Alex [Lexeme]
alexLex = do lexeme@(L _ tok _) <- alexMonadScan
             if tok == TokenEOF
               then return [lexeme]
               else (lexeme:) <$> alexLex

}