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

%right '='
%nonassoc '>' '<' '<=' '>=' '==' '!='
%left '+' '-'
%left '*' '/' '%'
%left NEG UNWRAP '!'

%%

Type : int     { Int }
     | bool    { Bool }
     | [Type]  { Array $2 }
     | *Type   { Pointer $2 }

ReturnType : Type                            { ReturnType $1 }
           | void                            { Void }

Operator   : Expression '*' Expression       { Multiply $1 $3 }
           | Expression '-' Expression       { Minus $1 $3 }
           | Expression '+' Expression       { Plus $1 $3 }
           | Expression '/' Expression       { Divide $1 $3 }
           | Expression '%' Expression       { Modulo $1 $3 }
           | Expression '<' Expression       { Less $1 $3 }
           | Expression '<=' Expression      { LessEq $1 $3 }
           | Expression '>' Expression       { Greater $1 $3 }
           | Expression '>=' Expression      { GreaterEq $1 $3}
           | Expression '==' Expression      { Equal $1 $3 }
           | Expression '!=' Expression      { NotEqual $1 $3 }
           | Expression '&&' Expression      { And $1 $3 }
           | Expression '||' Expression      { Or $1 $3 }
           | '!' Expression                  { Negation $2 }
           | '*' Expression %prec UNWRAP     { UnwrapPointer $2}
           | '-' Expression %prec NEG        { MinusUnary $2 }


Expression : Literal                         { LiteralExpression $1 }
           | name '(' Expressions ')'        { FunctionCall $1 $3 }
           | Operator                        { Operation $1 }
           | '(' Expression ')'              { SubExpression $2 }

Expressions :   {- empty -}                  { [] }
            |   Expression                   { [$1] }
            |   Expression ',' Expressions   { $1 : $2 }

Declaration  : name ':' Type                 { Declaration $1 $3 }

Declarations : {- empty -}                   { [] }
             | Declaration                   { [$1] }
             | Declaration ',' Declarations  { $1 : $2 }

DeclarationsWithSemicolon : {- empty -}                   { [] }
                         | Declaration ';'               { [$1] }
                         | Declaration ',' Declarations  { $1 : $2 }

Literal     : intLit                        { IntLiteral $1 }
            | boolLit                       { BoolLiteral $1 }
            | '[' Expressions ']'           { ArrayLiteral $2 }
     
Function    : name '('Declarations')' ReturnType { Function $1 $3 $5 }

Body        : DeclarationsWithSemicolon Statement { Body $1 $2 }

{

parseError :: Lexeme -> Alex a
parseError (Lexeme (AlexPn _ y z) _) = alexError ("Parse error at line " ++ show y ++ " and column " ++ show x)


}