module Necklace.AST where

class ErrorRepr t where
    typeRepr:: t -> String

data Type = Int | Bool | Array Type | Pointer Type

data ReturnType = ReturnType Type | Void

data Declaration = Declaration String Type

data Literal = IntLiteral Int | BoolLiteral Bool | ArrayLiteral [Literal]

data Function = Function String [Declaration] ReturnType FunctionBody

data FunctionBody = FunctionBody [Declaration] [Statement]

newtype Body = Body [Statement]

data Statement = IfElseStatement Expression Body Body
                | ForStatement Expression Expression Expression Body
                | WhileStatement Expression Body
                | ReturnStatement Expression
                | VoidReturnStatement
                | BreakStatement 
                | ContinueStatement
                | ExpressionStatement Expression


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
                | Assign String Expression


instance ErrorRepr Operator where
    typeRepr (UnwrapPointer _) = "UnwrapPointer: (Pointer Any) -> Any"
    typeRepr (Negation _) = "Negation: (Pointer Any) -> Any"
    typeRepr (MinusUnary _) = "Negation: (Pointer Any) -> Any"
    typeRepr (Plus _ _) = "Plus: (Int, Int) -> Int"
    typeRepr (Minus _ _) = "Minus: (Int, Int) -> Int"
    typeRepr (Multiply _ _) = "Multiply: (Int, Int) -> Int"
    typeRepr (Divide _ _) = "Divide: (Int, Int) -> Int"
    typeRepr (Modulo _ _) = "Modulo: (Int, Int) -> Int"
    typeRepr (Less _ _) = "Less: (Int, Int) -> Int"
    typeRepr (LessEq _ _) = "LessEq: (Int, Int) -> Int"
    typeRepr (Greater _ _) = "Greater: (Int, Int) -> Int"
    typeRepr (GreaterEq _ _) = "GreaterEq: (Int, Int) -> Int"
    typeRepr (Equal _ _) = "Equal: (Int, Int) -> Int"
    typeRepr (NotEqual _ _) = "NotEqual: (Int, Int) -> Int"
    typeRepr (And _ _) = "And: (Int, Int) -> Int"
    typeRepr (Or _ _) = "Or: (Int, Int) -> Int"
    typeRepr (Assign _ _) = "Assign: (Int, Int) -> Int"


data Expression =  Operation Operator | SubExpression Expression | LiteralExpression Literal | Variable String | FunctionCall String [Expression] 

newtype AST = AST [Function]

-- instance Expression AST where 

