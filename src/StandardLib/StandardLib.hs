module StandardLib.StandardLib where

import ContextAnalysis.AnalyzerTypes
import qualified ContextAnalysis.AnalyzerTypes as A

printInt:: (String, FunctionType)
printInt = ("printInt", FunctionType { _arguments=[A.Int], _returned=Nothing })

allocIntArray:: (String, FunctionType)
allocIntArray = ("allocIntArray", FunctionType { _arguments=[A.Int], _returned=(Just $ A.Pointer A.Int) })

allocBoolArray:: (String, FunctionType)
allocBoolArray = ("allocBoolArray", FunctionType { _arguments=[A.Int], _returned=(Just $ A.Pointer A.Bool) })

freeInt:: (String, FunctionType)
freeInt = ("freeInt", FunctionType { _arguments=[A.Pointer A.Int], _returned=Nothing })

freeBool:: (String, FunctionType)
freeBool = ("freeBool", FunctionType { _arguments=[A.Pointer A.Bool], _returned=Nothing })

accessInt:: (String, FunctionType)
accessInt = ("accessInt", FunctionType { _arguments=[A.Pointer A.Int, A.Int], _returned=(Just $ A.Pointer A.Int) })

accessBool:: (String, FunctionType)
accessBool = ("accessBool", FunctionType { _arguments=[A.Pointer A.Bool, A.Int], _returned=(Just $ A.Pointer A.Bool) })

builtInFunctions:: [(String, FunctionType)]
builtInFunctions = [printInt, allocIntArray, allocBoolArray, freeInt, freeBool, accessInt, accessBool]

