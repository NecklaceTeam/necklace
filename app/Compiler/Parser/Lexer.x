{
module Compiler.Parser.Lexer (Token(..), Lexeme, lex) where

import Prelude hiding (lex)
import Data.Char (isAlphaNum, chr)
import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as T

import Utils.Outputable
}

%wrapper "monad"

--macros
$alpha = [A-Za-z]
$digit = [0-9]
$special = [\(\)\,\;\[\],:]

@reservedOp = "+"|"-"|"*"|"/"|"%"|"<"|">"|">="|"<="|"="|"=="|"!="|"&&"|"||"
@reservedId = function|if|else|for|while|return|break|continue

@varId = [$alpha $digit]+
@decimal = $digit+

tokens :-
    <O> $white+ { skip }
