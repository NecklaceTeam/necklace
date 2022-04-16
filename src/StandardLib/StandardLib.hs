module StandardLib.StandardLib where

import Necklace.AST

printInt :: (String, FunctionType)
printInt = ("printInt", FunctionType [Declaration "" Int] Void)

allocIntArray :: (String, FunctionType)
allocIntArray = ("allocIntArray", FunctionType [Declaration "" Int] (ReturnType(Pointer Int)))

allocBoolArray :: (String, FunctionType)
allocBoolArray = ("allocBoolArray", FunctionType [Declaration "" Int] (ReturnType(Pointer Int)))

malloca :: (String, FunctionType)
malloca = ("malloca", FunctionType [Declaration "" Int, Declaration "" Int] (ReturnType(Pointer Int)))

freeInt :: (String, FunctionType)
freeInt = ("freeInt", FunctionType [Declaration "" (Pointer Int)] Void) 

freeBool :: (String, FunctionType)
freeBool = ("freeBool", FunctionType [Declaration "" (Pointer Bool)] Void)

accessInt :: (String, FunctionType)
accessInt = ("accessInt", FunctionType [Declaration "" (Pointer Int), Declaration "" Int] (ReturnType (Pointer Int)))

accessBool :: (String, FunctionType)
accessBool = ("accessBool", FunctionType [Declaration "" (Pointer Bool), Declaration "" Int] (ReturnType (Pointer Bool)))

builtInFunctions :: [(String, FunctionType)]
builtInFunctions = [printInt, allocIntArray, allocBoolArray, freeInt, freeBool, accessInt, accessBool, malloca]
