{-# LANGUAGE TemplateHaskell #-}
module ContextAnalysis.AnalyzerTypes where

import Control.Lens (makeLenses)

data ExpressionType = Int | Bool | Array ExpressionType | Pointer ExpressionType | Any | Undefined
    deriving (Show)

instance Eq ExpressionType where
  (==) Any _ = True
  (==) _ Any = True
  (==) Int Int = True
  (==) Bool Bool = True
  (==) (Array a) (Array b) = a == b
  (==) (Pointer a) (Pointer b) = a == b
  (==) _ _ = False


data FunctionType = FunctionType {_arguments::[ExpressionType], _returned:: Maybe ExpressionType}
    deriving (Eq, Show)
makeLenses ''FunctionType

