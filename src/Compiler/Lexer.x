{
module Compiler.Lexer where

import Prelude hiding (lex)
import Data.Char (isAlphaNum, chr, toUpper)
import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as T

}

%wrapper "monad"

$whitechar            = [\t\n\r\v\f\ ]
$special              = [\(\)\,\;\:\[\]]
@keywords             = function|void|if|else|for|while|return|break|continue|"->"|do|end
@id                   = ([a-zA-Z_][a-zA-Z0-9_]*)
@operator             = "+"|"-"|"*"|"/"|"%"|"<"|">"|">="|"<="|"=="|"!="|"&&"|"||"|"="|"!"|">>"|"<<"
@type                 = int|bool
@comment              = "~~".*
@blockComment         = ("/*"[. $whitechar]*)?"*/"
@intLit               = [0-9]+
@boolLit              = true|false

tokens :-
<0> $white+           { skip }
<0> @comment          { skip }
<0> @blockComment     { skip }
<0> function          { makeLexeme TokenFunction }
<0> void              { makeLexeme TokenVoid }
<0> if                { makeLexeme TokenIf }
<0> else              { makeLexeme TokenElse }
<0> for               { makeLexeme TokenFor }
<0> while             { makeLexeme TokenWhile }
<0> return            { makeLexeme TokenReturn }
<0> break             { makeLexeme TokenBreak }
<0> continue          { makeLexeme TokenContinue }
<0> bind              { makeLexeme TokenBind }
<0> "->"              { makeLexeme TokenArrow }
<0> do                { makeLexeme TokenDo }
<0> end               { makeLexeme TokenEnd }
<0> \(                { makeLexeme TokenLeftParen }
<0> \)                { makeLexeme TokenRightParen }
<0> \,                { makeLexeme TokenComma }
<0> \;                { makeLexeme TokenSemicolon }
<0> \:                { makeLexeme TokenColon }
<0> \[                { makeLexeme TokenSquareLeftParen }
<0> \]                { makeLexeme TokenSquareRightParen }
<0> @operator         { makeLexeme_string TokenOperator }
<0> @intLit           { makeLexeme_int TokenIntLiteral }
<0> @boolLit          { makeLexeme_bool TokenBoolLiteral }
<0> @type             { makeLexeme_string TokenType }
<0> @id               { makeLexeme_string TokenId }


{
data Lexeme = Lexeme AlexPosn Token deriving (Eq, Show)

data Token =
        TokenLeftParen           | 
        TokenRightParen          |
        TokenComma               |
        TokenColon               |
        TokenSquareLeftParen     |
        TokenSquareRightParen    |
        TokenSemicolon           |
        TokenFunction            |
        TokenVoid                |
        TokenIf                  |
        TokenElse                |
        TokenFor                 |
        TokenWhile               |
        TokenReturn              |
        TokenBreak               |
        TokenContinue            |
        TokenBind                |
        TokenArrow               |
        TokenDo                  |
        TokenEnd                 |
        TokenKeyword     String  |
        TokenType        String  |
        TokenOperator    String  |
        TokenBoolLiteral Bool    |
        TokenIntLiteral  Int     |
        TokenId          String  |
        TokenEOF
        deriving (Eq,Show)

makeLexeme' :: (String -> Token) -> AlexInput -> Int -> Alex Lexeme
makeLexeme' f (p,_,_,str) len = return $ Lexeme p (f (take len str))

makeLexeme tok = makeLexeme' (\_ -> tok)
makeLexeme_string tok = makeLexeme' (\s -> tok s)
makeLexeme_int tok = makeLexeme' (\s -> tok (read s :: Int))
makeLexeme_bool tok = makeLexeme' (\s -> tok (read (toUpper(head s) : (tail s)) :: Bool))

alexEOF = return $ Lexeme (AlexPn (-1) (-1) (-1)) TokenEOF

lex :: String -> Either String [Lexeme]
lex str = runAlex str alexLex

alexLex :: Alex [Lexeme]
alexLex = do lexeme@(Lexeme _ tok) <- alexMonadScan
             if tok == TokenEOF
               then return [lexeme]
               else (lexeme:) <$> alexLex
}