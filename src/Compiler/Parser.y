{
module Compiler.Parser where
import Compiler.Lexer
import Necklace.AST
}

%name parser
%tokentype { Lexeme }
%monad { Alex }
%lexer { lex } { Lexeme _ TokenEOF }

%error { parseError }


%token 
      int             { Lexeme _ (TokenType "int") }
      bool            { Lexeme _ (TokenType "bool") }
      intLit          { Lexeme _ (TokenIntLiteral $$)}
      boolLit         { Lexeme _ (TokenBoolLiteral $$)}
      name            { Lexeme _ (TokenId $$)}
      '['             { Lexeme _ TokenSquareLeftParen }
      ']'             { Lexeme _ TokenSquareRightParen }
      void            { Lexeme _ TokenVoid}
%%

Type : int     { Int }
     | bool    { Bool }
     | [Type]  { Array $2 }
     | *Type   { Pointer $2 }

ReturnType : Type  {ReturnType $1}
           | void

Declaration : name ':' Type {Declaration $1 $3}

Literal : intLit  {IntLiteral $1}
        | boolLit {BoolLiteral $1}
        | '[' Literal ']' {ArrayLiteral [$2]}

Function : name '['Declaration']' ReturnType { Function $1 $3 $ }
{

parseError :: Lexeme -> Alex a
parseError (Lexeme (AlexPn _ y z) _) = alexError ("Parse error at line " ++ show y ++ " and column " ++ show x)


}