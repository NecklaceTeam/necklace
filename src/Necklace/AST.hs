module Necklace.AST where

class ErrorRepr t where
    typeRepr:: t -> String

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
                | Assign String Expression
                | ArrayIndex Expression Expression deriving(Show)

data Expression = Operation Operator 
                | SubExpression Expression
                | LiteralExpression Literal 
                | FunctionCall String [Expression]
                | Variable String deriving(Show)

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

