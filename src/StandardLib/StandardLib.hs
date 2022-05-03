module StandardLib.StandardLib where

import Necklace.AST

printInt :: (String, FunctionType)
printInt = ("printInt", FunctionType [Declaration "" Int] Void)

printBool :: (String, FunctionType)
printBool = ("printBool", FunctionType [Declaration "" Bool] Void)

allocIntArray :: (String, FunctionType)
allocIntArray = ("allocIntArray", FunctionType [Declaration "" Int] (ReturnType(Pointer Int)))

allocBoolArray :: (String, FunctionType)
allocBoolArray = ("allocBoolArray", FunctionType [Declaration "" Int] (ReturnType(Pointer Int)))

malloca :: (String, FunctionType)
malloca = ("malloca", FunctionType [Declaration "" Int, Declaration "" Int] (ReturnType(Pointer Any)))

freeInt :: (String, FunctionType)
freeInt = ("freeInt", FunctionType [Declaration "" (Pointer Int)] Void) 

freeBool :: (String, FunctionType)
freeBool = ("freeBool", FunctionType [Declaration "" (Pointer Bool)] Void)

freePtr :: (String, FunctionType)
freePtr = ("freePtr", FunctionType [Declaration "" (Pointer Any)] Void)

accessInt :: (String, FunctionType)
accessInt = ("accessInt", FunctionType [Declaration "" (Pointer Int), Declaration "" Int] (ReturnType (Pointer Int)))

accessBool :: (String, FunctionType)
accessBool = ("accessBool", FunctionType [Declaration "" (Pointer Bool), Declaration "" Int] (ReturnType (Pointer Bool)))

builtInFunctions :: [(String, FunctionType)]
builtInFunctions = [printInt,printBool, allocIntArray, allocBoolArray, freeInt, freeBool, freePtr ,accessInt, accessBool, malloca]
