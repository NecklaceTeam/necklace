{
module Compiler.Parser.Lexer (Token(..), Lexeme, lex) where

import Prelude hiding (lex)
import Data.Char (isAlphaNum, chr)
import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as T

}

%wrapper "monad"

--macros
$whitechar = [\t\n\r\v\f\ ]
$alpha = [A-Za-z]
$digit = [0-9]
$bool = [true false]
$special   = [\(\)\,\;\[\]\{\}]

@reservedOp = "+"|"-"|"*"|"/"|"%"|"<"|">"|">="|"<="|"="|"=="|"!="|"&&"|"||"|"->"
@reservedId = function|if|else|for|while|return|break|continue|int|bool

@varId = [$alpha $digit]+
@decimal = $digit+

tokens :-
<0> $white+           { skip }
<0> function          { mkL TokenFunction }
<0> do                { mkL TokenDo }
<0> end               { mkL TokenEnd }
<0> @decimal          { mkL TokenInt }
<0> $bool             { mkL TokenBool }
<0> $special          { mkL TokenSpecial }
<0> @varId            { mkL TokenVarId }
<0> @reservedId       { mkL TokenReservedId }
<0> @reservedOp       { mkL TokenReservedOp }

{
data Lexeme = L AlexPosn Token String deriving (Eq,Show)

data Token =
        TokenFunction   |
        TokenDo         |
        TokenEnd        |
        TokenInt        |
        TokenBool       |
        TokenSpecial    |
        TokenReservedId |
        TokenVarId      |
        TokenReservedOp |
        TokenEOF
        deriving (Eq,Show)

mkL :: Token -> AlexInput -> Int -> Alex Lexeme
mkL tok (p,_,_,str) len = return $ L p tok (take len str)

alexEOF = return $ L undefined TokenEOF ""

lex :: String -> Either String [Lexeme]
lex str = runAlex str alexLex

alexLex :: Alex [Lexeme]
alexLex = do lexeme@(L _ tok _) <- alexMonadScan
             if tok == TokenEOF
               then return [lexeme]
               else (lexeme:) <$> alexLex

}