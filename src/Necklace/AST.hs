module Necklace.AST where

newtype AST = AST [Function] deriving(Show)

data Type = Int | Bool | Array Type | Pointer Type deriving(Show)

data ReturnType = ReturnType Type | Void deriving(Show)

data Declaration = Declaration String Type deriving(Show)

data Literal = IntLiteral Int | BoolLiteral Bool | ArrayLiteral [Expression] deriving(Show)

data Function = Function String [Declaration] ReturnType FunctionBody
                deriving(Show) 

data FunctionBody = FunctionBody [Declaration] [Statement] deriving(Show) 

newtype Body = Body [Statement] deriving(Show)

data Statement = IfElseStatement Expression Body Body
                | ForStatement Expression Expression Expression Body
                | ExpressionStatement Expression
                | WhileStatement Expression Body
                | ReturnStatement Expression
                | VoidReturnStatement
                | BreakStatement 
                | ContinueStatement deriving(Show)

data Operator = UnwrapPointer Expression
                | MinusUnary Expression
                | Negation Expression
                | Plus Expression Expression
                | Minus Expression Expression
                | Multiply Expression Expression
                | Divide Expression Expression
                | Modulo Expression Expression 
                | Less Expression Expression
                | LessEq Expression Expression
                | Greater Expression Expression                
                | GreaterEq Expression Expression
                | Equal Expression Expression
                | NotEqual Expression Expression
                | And Expression Expression
                | Or Expression Expression
                | Assign String Expression deriving(Show)

data Expression = Operation Operator 
                | SubExpression Expression
                | LiteralExpression Literal 
                | FunctionCall String [Expression]
                | Variable String 
                | ArrayIndex Expression Expression deriving(Show)


