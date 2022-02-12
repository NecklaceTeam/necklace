{
module Compiler.Parser where

import Compiler.Lexer
import Necklace.AST
import Prelude hiding(lex)
}

%name parser
%tokentype { Lexeme }
%monad { Alex }
%lexer { lexwrap } { Lexeme _ TokenEOF }

%error { parseError }


%token 
      int             { Lexeme _ (TokenType "int") }
      bool            { Lexeme _ (TokenType "bool") }
      intLit          { Lexeme _ (TokenIntLiteral $$) }
      boolLit         { Lexeme _ (TokenBoolLiteral $$) }
      name            { Lexeme _ (TokenId $$)}
      '['             { Lexeme _ TokenSquareLeftParen }
      ']'             { Lexeme _ TokenSquareRightParen }
      '('             { Lexeme _ TokenLeftParen }
      ')'             { Lexeme _ TokenRightParen }
      ','             { Lexeme _ TokenComma }
      ':'             { Lexeme _ TokenColon }
      ';'             { Lexeme _ TokenSemicolon }
      '!'             { Lexeme _ (TokenOperator "!") }
      '*'             { Lexeme _ (TokenOperator "*") }
      '-'             { Lexeme _ (TokenOperator "-") }
      '/'             { Lexeme _ (TokenOperator "/") }
      '%'             { Lexeme _ (TokenOperator "%") }    
      '+'             { Lexeme _ (TokenOperator "+") }
      '>'             { Lexeme _ (TokenOperator ">") }
      '<'             { Lexeme _ (TokenOperator "<") }
      '>='            { Lexeme _ (TokenOperator ">=") }
      '<='            { Lexeme _ (TokenOperator "<=") }
      '=='            { Lexeme _ (TokenOperator "==") }
      '!='            { Lexeme _ (TokenOperator "!=") }
      '&&'            { Lexeme _ (TokenOperator "&&") }
      '||'            { Lexeme _ (TokenOperator "||") }
      '='             { Lexeme _ (TokenOperator "=") }
      void            { Lexeme _ TokenVoid}
      function        { Lexeme _ TokenFunction }
      if              { Lexeme _ TokenIf }
      else            { Lexeme _ TokenElse }
      for             { Lexeme _ TokenFor }
      while           { Lexeme _ TokenWhile }
      return          { Lexeme _ TokenReturn }
      break           { Lexeme _ TokenBreak }
      continue        { Lexeme _ TokenContinue }
      '->'            { Lexeme _ TokenArrow }
      do              { Lexeme _ TokenDo }
      end             { Lexeme _ TokenEnd }


%right '='
%left '||' 
%left '&&'
%left '==' '!='
%left '>' '<' '<=' '>='     
%left '+' '-'     
%left '*' '/' '%'     
%right NEG UNWRAP '!'      
%left '['
     
%%     
Start      : Functions                                                             { AST (reverse $1) }
     
Functions : Functions Function                                                     { $2:$1 }
          | {- empty -}                                                            { [] }
     
Type       : int                                                                   { Int }
           | bool                                                                  { Bool }
           | '['Type']'                                                            { Array $2 }
           | '*'Type                                                               { Pointer $2 }
     
ReturnType : Type                                                                  { ReturnType $1 }
           | void                                                                  { Void }
     
Operator   : Expression '*' Expression                                             { Multiply $1 $3 }
           | Expression '-' Expression                                             { Minus $1 $3 }
           | Expression '+' Expression                                             { Plus $1 $3 }
           | Expression '/' Expression                                             { Divide $1 $3 }
           | Expression '%' Expression                                             { Modulo $1 $3 }
           | Expression '<' Expression                                             { Less $1 $3 }
           | Expression '<=' Expression                                            { LessEq $1 $3 }
           | Expression '>' Expression                                             { Greater $1 $3 }
           | Expression '>=' Expression                                            { GreaterEq $1 $3}
           | Expression '==' Expression                                            { Equal $1 $3 }
           | Expression '!=' Expression                                            { NotEqual $1 $3 }
           | Expression '&&' Expression                                            { And $1 $3 }
           | Expression '||' Expression                                            { Or $1 $3 }
           | '!' Expression                                                        { Negation $2 }
           | '*' Expression %prec UNWRAP                                           { UnwrapPointer $2 }
           | '-' Expression %prec NEG                                              { MinusUnary $2 }
           | Expression '=' Expression                                             { Assign $1 $3 }
           | Expression '[' Expression ']'                                         { ArrayIndex $1 $3 }

     
     
Expression : Literal                                                               { LiteralExpression $1 }
           | name '(' Expressions ')'                                              { FunctionCall $1 (reverse $3) }
           | Operator                                                              { Operation $1 }
           | '(' Expression ')'                                                    { SubExpression $2 }
           | name                                                                  { Variable $1 }
     
Expressions : Expressions ',' Expression                                           { $3:$1 }
            | Expression                                                           { [$1] }
     
Declaration  : name ':' Type                                                       { Declaration $1 $3 }
     
FunctionArgs : FunctionArgs ',' Declaration                                        { $3:$1 }
             | Declaration                                                         { [$1] }

Declarations : Declarations Declaration ';'                                        { $2:$1 }
             | Declaration ';'                                                     { [$1] }
     
Literal     : intLit                                                               { IntLiteral $1 }
            | boolLit                                                              { BoolLiteral $1 }
            | '[' Expressions ']'                                                  { ArrayLiteral (reverse $2) }
          
Statement   : if Expression do Body else Body end                                  { IfElseStatement $2 $4 $6 }
            | for '('Expression ',' Expression ',' Expression ')' do Body end      { ForStatement $3 $5 $7 $10}
            | Expression ';'                                                       { ExpressionStatement $1}
            | while Expression do Body end                                         { WhileStatement $2 $4}
            | return Expression ';'                                                { ReturnStatement $2}
            | return ';'                                                           { VoidReturnStatement }
            | break ';'                                                            { BreakStatement }
            | continue ';'                                                         { ContinueStatement }

Statements : Statements Statement                                                  { $2 : $1 }
            | Statement                                                            { [$1] }                                          
     
Body        : Statements                                                           { Body (reverse $1) }
     
FunctionBody: Declarations Statements                                              { FunctionBody (reverse $1) (reverse $2)}
            | Statements                                                           { FunctionBody [] $1}
            
Function    : function name '('FunctionArgs')' '->' ReturnType do FunctionBody end { Function $2 (reverse $4) $7 $9 }
            | function name '('')' '->' ReturnType do FunctionBody end             { Function $2 [] $6 $8 }



{
lexwrap = (alexMonadScan >>= )

parseError :: Lexeme -> Alex a
parseError (Lexeme (AlexPn _ y z) _) = alexError ("Syntax error at line " ++ show y ++ " and column " ++ show z)

parse :: String -> Either String AST
parse s = runAlex s parser

}