module Necklace.AST where

data Type = Int | Bool | Array Type | Pointer Type

data ReturnType = ReturnType Type | Void

data Declaration = Declaration String Type

data Literal = IntLiteral Int | BoolLiteral Bool | ArrayLiteral [Expression]

data Function = Function String [Declaration] ReturnType

data Body = Body [Declaration] [Statement]

data Statement = FunctionCallStatement String [Expression]
                | IfElseStatement Expression Body Body
                | ForStatement Expression Expression Expression Body
                | Assigment String Expression
                | WhileStatement Expression Body
                | ReturnStatement Expression
                | VoidReturnStatement
                | BreakStatement 
                | ContinueStatement


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

data Expression = Operation Operator | SubExpression Expression | LiteralExpression Literal | FunctionCall String [Expression] 
