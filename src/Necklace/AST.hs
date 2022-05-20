{-# LANGUAGE TemplateHaskell #-}
module Necklace.AST where
import Control.Lens (makeLenses, view, over, (^.), set, makePrisms, makeClassy)

class ErrorRepr t where
    typeRepr:: t -> String

data Type = Int | Bool | Array Type | Pointer Type deriving(Show)

data ReturnType = ReturnType Type | Void deriving(Show)

data Literal = IntLiteral Int | BoolLiteral Bool | ArrayLiteral [Expression] deriving(Show)

data Declaration = Declaration { _dname :: String, _dtype :: Type} deriving(Show)

data Statement = IfElseStatement Expression Body Body
                | ForStatement Expression Expression Expression Body
                | ExpressionStatement Expression
                | WhileStatement Expression Body
                | ReturnStatement Expression
                | VoidReturnStatement
                | BreakStatement 
                | ContinueStatement 
                | BindStatement String String deriving(Show)

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
                | Assign Expression Expression
                | MoveRight Expression Expression
                | MoveLeft Expression Expression
                | ArrayIndex Expression Expression
                | Alloc Allocable deriving(Show)

data Allocable = ArrayMem Type Expression deriving(Show)

data Expression = Operation Operator
                | SubExpression Expression
                | LiteralExpression Literal 
                | FunctionCall String [Expression] 
                | Variable String deriving(Show)


data FunctionType = FunctionType { _args :: [Declaration], _rtype :: ReturnType} deriving(Show)

data FunctionBody = FunctionBody { _fdeclarations :: [Declaration], _fstatements :: [Statement]} deriving(Show) 

data Function = Function { _fname :: String, _ftype :: FunctionType, _fbody :: FunctionBody}
                deriving(Show) 

newtype Body = Body {_bstatements :: [Statement]} deriving(Show)

newtype AST = AST { _functions :: [Function] } deriving (Show)

makeLenses ''AST
makeLenses ''Declaration
makeLenses ''FunctionType
makeLenses ''FunctionBody
makeLenses ''Function
makeLenses ''Body



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

