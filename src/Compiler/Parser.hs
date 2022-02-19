{-# OPTIONS_GHC -w #-}
module Compiler.Parser where

import Compiler.Lexer
import Necklace.AST
import Prelude hiding(lex)
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20
	= HappyTerminal (Lexeme)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,644) ([0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,16,0,0,0,8,0,0,0,0,8192,0,4352,0,0,0,0,0,0,0,48,0,0,0,4,0,0,0,0,256,0,28863,40960,15,0,2,0,0,0,0,0,0,33280,32766,0,0,2048,0,0,61440,1803,64000,0,0,0,0,0,0,0,0,0,28863,40960,15,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,4,0,0,3056,7,0,0,28863,0,0,61440,1803,0,0,48896,112,0,0,3056,7,0,0,28863,0,0,0,8,0,0,48896,112,0,0,35824,7,0,0,2048,0,0,0,128,0,0,8960,32,8,0,560,2,0,0,0,0,16,0,1,0,0,0,0,0,0,560,32770,0,0,0,0,0,12288,514,0,0,8960,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,59424,2047,0,0,8,0,0,0,0,0,0,512,32766,512,0,28863,0,0,0,65026,127,2,8192,0,0,0,512,0,0,0,32,0,0,0,2,0,0,8192,65505,7,0,1536,0,0,0,57376,2047,0,0,36,0,0,48896,112,0,0,0,0,0,0,0,0,0,0,128,0,0,48896,112,4000,0,0,0,0,0,28863,0,0,0,0,0,0,48896,112,0,0,3056,7,0,0,28863,0,0,61440,1803,0,0,48896,112,0,0,3056,7,0,0,28863,0,0,61440,1803,0,0,48896,112,0,0,3056,7,0,0,28863,0,0,61440,1803,0,0,48896,112,0,0,3056,7,0,0,28863,0,0,0,65030,127,0,8192,65504,7,0,512,8190,0,0,57376,255,0,0,65026,3,0,8192,16352,0,0,512,62,0,0,57376,3,0,0,15874,0,0,8192,992,0,0,512,26,0,0,32,0,0,0,2,0,0,8192,416,0,0,512,0,0,0,57440,2047,0,0,0,0,0,0,3,0,0,0,0,0,0,28863,0,0,0,0,0,0,0,0,0,0,3056,7,250,0,57888,2047,0,61440,1803,64000,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,48896,112,4000,0,0,0,1024,0,28863,0,0,0,0,1024,0,8192,65504,7,0,0,0,0,0,0,0,0,0,0,0,0,48896,112,4000,0,8704,32766,0,0,0,0,0,61440,1803,0,0,0,0,16384,0,0,0,0,0,57632,2047,0,0,0,0,2,48896,112,4000,0,0,0,1024,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Start","Functions","Type","ReturnType","Operator","Expression","Expressions","Declaration","FunctionArgs","Declarations","Literal","Statement","Statements","Body","FunctionBody","FunctionType","Function","int","bool","intLit","boolLit","name","'['","']'","'('","')'","','","':'","';'","'!'","'*'","'-'","'/'","'%'","'+'","'>'","'<'","'>='","'<='","'=='","'!='","'&&'","'||'","'='","void","function","if","else","for","while","return","break","continue","'->'","do","end","%eof"]
        bit_start = st Prelude.* 60
        bit_end = (st Prelude.+ 1) Prelude.* 60
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..59]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_2
action_0 _ = happyReduce_3

action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (49) = happyShift action_5
action_2 (20) = happyGoto action_4
action_2 _ = happyReduce_1

action_3 (60) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_2

action_5 (25) = happyShift action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (28) = happyShift action_8
action_6 (19) = happyGoto action_7
action_6 _ = happyReduce_61

action_7 (58) = happyShift action_13
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (25) = happyShift action_11
action_8 (29) = happyShift action_12
action_8 (11) = happyGoto action_9
action_8 (12) = happyGoto action_10
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_37

action_10 (29) = happyShift action_41
action_10 (30) = happyShift action_42
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (31) = happyShift action_40
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (57) = happyShift action_39
action_12 _ = happyReduce_60

action_13 (21) = happyShift action_23
action_13 (22) = happyShift action_24
action_13 (23) = happyShift action_25
action_13 (24) = happyShift action_26
action_13 (25) = happyShift action_27
action_13 (26) = happyShift action_28
action_13 (28) = happyShift action_29
action_13 (33) = happyShift action_30
action_13 (34) = happyShift action_31
action_13 (35) = happyShift action_32
action_13 (50) = happyShift action_33
action_13 (52) = happyShift action_34
action_13 (53) = happyShift action_35
action_13 (54) = happyShift action_36
action_13 (55) = happyShift action_37
action_13 (56) = happyShift action_38
action_13 (6) = happyGoto action_14
action_13 (8) = happyGoto action_15
action_13 (9) = happyGoto action_16
action_13 (11) = happyGoto action_17
action_13 (13) = happyGoto action_18
action_13 (14) = happyGoto action_19
action_13 (15) = happyGoto action_20
action_13 (16) = happyGoto action_21
action_13 (18) = happyGoto action_22
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (26) = happyShift action_89
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_30

action_16 (26) = happyShift action_73
action_16 (32) = happyShift action_74
action_16 (34) = happyShift action_75
action_16 (35) = happyShift action_76
action_16 (36) = happyShift action_77
action_16 (37) = happyShift action_78
action_16 (38) = happyShift action_79
action_16 (39) = happyShift action_80
action_16 (40) = happyShift action_81
action_16 (41) = happyShift action_82
action_16 (42) = happyShift action_83
action_16 (43) = happyShift action_84
action_16 (44) = happyShift action_85
action_16 (45) = happyShift action_86
action_16 (46) = happyShift action_87
action_16 (47) = happyShift action_88
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (32) = happyShift action_72
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (21) = happyShift action_23
action_18 (22) = happyShift action_24
action_18 (23) = happyShift action_25
action_18 (24) = happyShift action_26
action_18 (25) = happyShift action_27
action_18 (26) = happyShift action_28
action_18 (28) = happyShift action_29
action_18 (33) = happyShift action_30
action_18 (34) = happyShift action_31
action_18 (35) = happyShift action_32
action_18 (50) = happyShift action_33
action_18 (52) = happyShift action_34
action_18 (53) = happyShift action_35
action_18 (54) = happyShift action_36
action_18 (55) = happyShift action_37
action_18 (56) = happyShift action_38
action_18 (6) = happyGoto action_14
action_18 (8) = happyGoto action_15
action_18 (9) = happyGoto action_16
action_18 (11) = happyGoto action_70
action_18 (14) = happyGoto action_19
action_18 (15) = happyGoto action_20
action_18 (16) = happyGoto action_71
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_28

action_20 _ = happyReduce_53

action_21 (21) = happyShift action_23
action_21 (22) = happyShift action_24
action_21 (23) = happyShift action_25
action_21 (24) = happyShift action_26
action_21 (25) = happyShift action_54
action_21 (26) = happyShift action_28
action_21 (28) = happyShift action_29
action_21 (33) = happyShift action_30
action_21 (34) = happyShift action_31
action_21 (35) = happyShift action_32
action_21 (50) = happyShift action_33
action_21 (52) = happyShift action_34
action_21 (53) = happyShift action_35
action_21 (54) = happyShift action_36
action_21 (55) = happyShift action_37
action_21 (56) = happyShift action_38
action_21 (6) = happyGoto action_14
action_21 (8) = happyGoto action_15
action_21 (9) = happyGoto action_16
action_21 (14) = happyGoto action_19
action_21 (15) = happyGoto action_69
action_21 _ = happyReduce_56

action_22 (59) = happyShift action_68
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_4

action_24 _ = happyReduce_5

action_25 _ = happyReduce_40

action_26 _ = happyReduce_41

action_27 (28) = happyShift action_67
action_27 (31) = happyShift action_40
action_27 _ = happyReduce_32

action_28 (21) = happyShift action_23
action_28 (22) = happyShift action_24
action_28 (23) = happyShift action_25
action_28 (24) = happyShift action_26
action_28 (25) = happyShift action_54
action_28 (26) = happyShift action_28
action_28 (28) = happyShift action_29
action_28 (33) = happyShift action_30
action_28 (34) = happyShift action_31
action_28 (35) = happyShift action_32
action_28 (6) = happyGoto action_64
action_28 (8) = happyGoto action_15
action_28 (9) = happyGoto action_65
action_28 (10) = happyGoto action_66
action_28 (14) = happyGoto action_19
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (21) = happyShift action_23
action_29 (22) = happyShift action_24
action_29 (23) = happyShift action_25
action_29 (24) = happyShift action_26
action_29 (25) = happyShift action_54
action_29 (26) = happyShift action_28
action_29 (28) = happyShift action_29
action_29 (33) = happyShift action_30
action_29 (34) = happyShift action_31
action_29 (35) = happyShift action_32
action_29 (6) = happyGoto action_14
action_29 (8) = happyGoto action_15
action_29 (9) = happyGoto action_63
action_29 (14) = happyGoto action_19
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (21) = happyShift action_23
action_30 (22) = happyShift action_24
action_30 (23) = happyShift action_25
action_30 (24) = happyShift action_26
action_30 (25) = happyShift action_54
action_30 (26) = happyShift action_28
action_30 (28) = happyShift action_29
action_30 (33) = happyShift action_30
action_30 (34) = happyShift action_31
action_30 (35) = happyShift action_32
action_30 (6) = happyGoto action_14
action_30 (8) = happyGoto action_15
action_30 (9) = happyGoto action_62
action_30 (14) = happyGoto action_19
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (21) = happyShift action_23
action_31 (22) = happyShift action_24
action_31 (23) = happyShift action_25
action_31 (24) = happyShift action_26
action_31 (25) = happyShift action_54
action_31 (26) = happyShift action_28
action_31 (28) = happyShift action_29
action_31 (33) = happyShift action_30
action_31 (34) = happyShift action_31
action_31 (35) = happyShift action_32
action_31 (6) = happyGoto action_60
action_31 (8) = happyGoto action_15
action_31 (9) = happyGoto action_61
action_31 (14) = happyGoto action_19
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (21) = happyShift action_23
action_32 (22) = happyShift action_24
action_32 (23) = happyShift action_25
action_32 (24) = happyShift action_26
action_32 (25) = happyShift action_54
action_32 (26) = happyShift action_28
action_32 (28) = happyShift action_29
action_32 (33) = happyShift action_30
action_32 (34) = happyShift action_31
action_32 (35) = happyShift action_32
action_32 (6) = happyGoto action_14
action_32 (8) = happyGoto action_15
action_32 (9) = happyGoto action_59
action_32 (14) = happyGoto action_19
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (21) = happyShift action_23
action_33 (22) = happyShift action_24
action_33 (23) = happyShift action_25
action_33 (24) = happyShift action_26
action_33 (25) = happyShift action_54
action_33 (26) = happyShift action_28
action_33 (28) = happyShift action_29
action_33 (33) = happyShift action_30
action_33 (34) = happyShift action_31
action_33 (35) = happyShift action_32
action_33 (6) = happyGoto action_14
action_33 (8) = happyGoto action_15
action_33 (9) = happyGoto action_58
action_33 (14) = happyGoto action_19
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (28) = happyShift action_57
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (21) = happyShift action_23
action_35 (22) = happyShift action_24
action_35 (23) = happyShift action_25
action_35 (24) = happyShift action_26
action_35 (25) = happyShift action_54
action_35 (26) = happyShift action_28
action_35 (28) = happyShift action_29
action_35 (33) = happyShift action_30
action_35 (34) = happyShift action_31
action_35 (35) = happyShift action_32
action_35 (6) = happyGoto action_14
action_35 (8) = happyGoto action_15
action_35 (9) = happyGoto action_56
action_35 (14) = happyGoto action_19
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (21) = happyShift action_23
action_36 (22) = happyShift action_24
action_36 (23) = happyShift action_25
action_36 (24) = happyShift action_26
action_36 (25) = happyShift action_54
action_36 (26) = happyShift action_28
action_36 (28) = happyShift action_29
action_36 (32) = happyShift action_55
action_36 (33) = happyShift action_30
action_36 (34) = happyShift action_31
action_36 (35) = happyShift action_32
action_36 (6) = happyGoto action_14
action_36 (8) = happyGoto action_15
action_36 (9) = happyGoto action_53
action_36 (14) = happyGoto action_19
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (32) = happyShift action_52
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (32) = happyShift action_51
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (21) = happyShift action_23
action_39 (22) = happyShift action_24
action_39 (26) = happyShift action_46
action_39 (34) = happyShift action_47
action_39 (48) = happyShift action_50
action_39 (6) = happyGoto action_48
action_39 (7) = happyGoto action_49
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (21) = happyShift action_23
action_40 (22) = happyShift action_24
action_40 (26) = happyShift action_46
action_40 (34) = happyShift action_47
action_40 (6) = happyGoto action_45
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (57) = happyShift action_44
action_41 _ = happyReduce_58

action_42 (25) = happyShift action_11
action_42 (11) = happyGoto action_43
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_36

action_44 (21) = happyShift action_23
action_44 (22) = happyShift action_24
action_44 (26) = happyShift action_46
action_44 (34) = happyShift action_47
action_44 (48) = happyShift action_50
action_44 (6) = happyGoto action_48
action_44 (7) = happyGoto action_118
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_35

action_46 (21) = happyShift action_23
action_46 (22) = happyShift action_24
action_46 (26) = happyShift action_46
action_46 (34) = happyShift action_47
action_46 (6) = happyGoto action_117
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (21) = happyShift action_23
action_47 (22) = happyShift action_24
action_47 (26) = happyShift action_46
action_47 (34) = happyShift action_47
action_47 (6) = happyGoto action_116
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_8

action_49 _ = happyReduce_59

action_50 _ = happyReduce_9

action_51 _ = happyReduce_51

action_52 _ = happyReduce_50

action_53 (26) = happyShift action_73
action_53 (32) = happyShift action_115
action_53 (34) = happyShift action_75
action_53 (35) = happyShift action_76
action_53 (36) = happyShift action_77
action_53 (37) = happyShift action_78
action_53 (38) = happyShift action_79
action_53 (39) = happyShift action_80
action_53 (40) = happyShift action_81
action_53 (41) = happyShift action_82
action_53 (42) = happyShift action_83
action_53 (43) = happyShift action_84
action_53 (44) = happyShift action_85
action_53 (45) = happyShift action_86
action_53 (46) = happyShift action_87
action_53 (47) = happyShift action_88
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (28) = happyShift action_67
action_54 _ = happyReduce_32

action_55 _ = happyReduce_49

action_56 (26) = happyShift action_73
action_56 (34) = happyShift action_75
action_56 (35) = happyShift action_76
action_56 (36) = happyShift action_77
action_56 (37) = happyShift action_78
action_56 (38) = happyShift action_79
action_56 (39) = happyShift action_80
action_56 (40) = happyShift action_81
action_56 (41) = happyShift action_82
action_56 (42) = happyShift action_83
action_56 (43) = happyShift action_84
action_56 (44) = happyShift action_85
action_56 (45) = happyShift action_86
action_56 (46) = happyShift action_87
action_56 (47) = happyShift action_88
action_56 (58) = happyShift action_114
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (21) = happyShift action_23
action_57 (22) = happyShift action_24
action_57 (23) = happyShift action_25
action_57 (24) = happyShift action_26
action_57 (25) = happyShift action_54
action_57 (26) = happyShift action_28
action_57 (28) = happyShift action_29
action_57 (33) = happyShift action_30
action_57 (34) = happyShift action_31
action_57 (35) = happyShift action_32
action_57 (6) = happyGoto action_14
action_57 (8) = happyGoto action_15
action_57 (9) = happyGoto action_113
action_57 (14) = happyGoto action_19
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (26) = happyShift action_73
action_58 (34) = happyShift action_75
action_58 (35) = happyShift action_76
action_58 (36) = happyShift action_77
action_58 (37) = happyShift action_78
action_58 (38) = happyShift action_79
action_58 (39) = happyShift action_80
action_58 (40) = happyShift action_81
action_58 (41) = happyShift action_82
action_58 (42) = happyShift action_83
action_58 (43) = happyShift action_84
action_58 (44) = happyShift action_85
action_58 (45) = happyShift action_86
action_58 (46) = happyShift action_87
action_58 (47) = happyShift action_88
action_58 (58) = happyShift action_112
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (26) = happyShift action_73
action_59 _ = happyReduce_25

action_60 (26) = happyShift action_89
action_60 _ = happyReduce_7

action_61 (26) = happyShift action_73
action_61 _ = happyReduce_24

action_62 (26) = happyShift action_73
action_62 _ = happyReduce_23

action_63 (26) = happyShift action_73
action_63 (29) = happyShift action_111
action_63 (34) = happyShift action_75
action_63 (35) = happyShift action_76
action_63 (36) = happyShift action_77
action_63 (37) = happyShift action_78
action_63 (38) = happyShift action_79
action_63 (39) = happyShift action_80
action_63 (40) = happyShift action_81
action_63 (41) = happyShift action_82
action_63 (42) = happyShift action_83
action_63 (43) = happyShift action_84
action_63 (44) = happyShift action_85
action_63 (45) = happyShift action_86
action_63 (46) = happyShift action_87
action_63 (47) = happyShift action_88
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (26) = happyShift action_89
action_64 (27) = happyShift action_110
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (26) = happyShift action_73
action_65 (34) = happyShift action_75
action_65 (35) = happyShift action_76
action_65 (36) = happyShift action_77
action_65 (37) = happyShift action_78
action_65 (38) = happyShift action_79
action_65 (39) = happyShift action_80
action_65 (40) = happyShift action_81
action_65 (41) = happyShift action_82
action_65 (42) = happyShift action_83
action_65 (43) = happyShift action_84
action_65 (44) = happyShift action_85
action_65 (45) = happyShift action_86
action_65 (46) = happyShift action_87
action_65 (47) = happyShift action_88
action_65 _ = happyReduce_34

action_66 (27) = happyShift action_108
action_66 (30) = happyShift action_109
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (21) = happyShift action_23
action_67 (22) = happyShift action_24
action_67 (23) = happyShift action_25
action_67 (24) = happyShift action_26
action_67 (25) = happyShift action_54
action_67 (26) = happyShift action_28
action_67 (28) = happyShift action_29
action_67 (33) = happyShift action_30
action_67 (34) = happyShift action_31
action_67 (35) = happyShift action_32
action_67 (6) = happyGoto action_14
action_67 (8) = happyGoto action_15
action_67 (9) = happyGoto action_65
action_67 (10) = happyGoto action_107
action_67 (14) = happyGoto action_19
action_67 _ = happyFail (happyExpListPerState 67)

action_68 _ = happyReduce_62

action_69 _ = happyReduce_52

action_70 (32) = happyShift action_106
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (21) = happyShift action_23
action_71 (22) = happyShift action_24
action_71 (23) = happyShift action_25
action_71 (24) = happyShift action_26
action_71 (25) = happyShift action_54
action_71 (26) = happyShift action_28
action_71 (28) = happyShift action_29
action_71 (33) = happyShift action_30
action_71 (34) = happyShift action_31
action_71 (35) = happyShift action_32
action_71 (50) = happyShift action_33
action_71 (52) = happyShift action_34
action_71 (53) = happyShift action_35
action_71 (54) = happyShift action_36
action_71 (55) = happyShift action_37
action_71 (56) = happyShift action_38
action_71 (6) = happyGoto action_14
action_71 (8) = happyGoto action_15
action_71 (9) = happyGoto action_16
action_71 (14) = happyGoto action_19
action_71 (15) = happyGoto action_69
action_71 _ = happyReduce_55

action_72 _ = happyReduce_39

action_73 (21) = happyShift action_23
action_73 (22) = happyShift action_24
action_73 (23) = happyShift action_25
action_73 (24) = happyShift action_26
action_73 (25) = happyShift action_54
action_73 (26) = happyShift action_28
action_73 (28) = happyShift action_29
action_73 (33) = happyShift action_30
action_73 (34) = happyShift action_31
action_73 (35) = happyShift action_32
action_73 (6) = happyGoto action_14
action_73 (8) = happyGoto action_15
action_73 (9) = happyGoto action_105
action_73 (14) = happyGoto action_19
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_46

action_75 (21) = happyShift action_23
action_75 (22) = happyShift action_24
action_75 (23) = happyShift action_25
action_75 (24) = happyShift action_26
action_75 (25) = happyShift action_54
action_75 (26) = happyShift action_28
action_75 (28) = happyShift action_29
action_75 (33) = happyShift action_30
action_75 (34) = happyShift action_31
action_75 (35) = happyShift action_32
action_75 (6) = happyGoto action_14
action_75 (8) = happyGoto action_15
action_75 (9) = happyGoto action_104
action_75 (14) = happyGoto action_19
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (21) = happyShift action_23
action_76 (22) = happyShift action_24
action_76 (23) = happyShift action_25
action_76 (24) = happyShift action_26
action_76 (25) = happyShift action_54
action_76 (26) = happyShift action_28
action_76 (28) = happyShift action_29
action_76 (33) = happyShift action_30
action_76 (34) = happyShift action_31
action_76 (35) = happyShift action_32
action_76 (6) = happyGoto action_14
action_76 (8) = happyGoto action_15
action_76 (9) = happyGoto action_103
action_76 (14) = happyGoto action_19
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (21) = happyShift action_23
action_77 (22) = happyShift action_24
action_77 (23) = happyShift action_25
action_77 (24) = happyShift action_26
action_77 (25) = happyShift action_54
action_77 (26) = happyShift action_28
action_77 (28) = happyShift action_29
action_77 (33) = happyShift action_30
action_77 (34) = happyShift action_31
action_77 (35) = happyShift action_32
action_77 (6) = happyGoto action_14
action_77 (8) = happyGoto action_15
action_77 (9) = happyGoto action_102
action_77 (14) = happyGoto action_19
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (21) = happyShift action_23
action_78 (22) = happyShift action_24
action_78 (23) = happyShift action_25
action_78 (24) = happyShift action_26
action_78 (25) = happyShift action_54
action_78 (26) = happyShift action_28
action_78 (28) = happyShift action_29
action_78 (33) = happyShift action_30
action_78 (34) = happyShift action_31
action_78 (35) = happyShift action_32
action_78 (6) = happyGoto action_14
action_78 (8) = happyGoto action_15
action_78 (9) = happyGoto action_101
action_78 (14) = happyGoto action_19
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (21) = happyShift action_23
action_79 (22) = happyShift action_24
action_79 (23) = happyShift action_25
action_79 (24) = happyShift action_26
action_79 (25) = happyShift action_54
action_79 (26) = happyShift action_28
action_79 (28) = happyShift action_29
action_79 (33) = happyShift action_30
action_79 (34) = happyShift action_31
action_79 (35) = happyShift action_32
action_79 (6) = happyGoto action_14
action_79 (8) = happyGoto action_15
action_79 (9) = happyGoto action_100
action_79 (14) = happyGoto action_19
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (21) = happyShift action_23
action_80 (22) = happyShift action_24
action_80 (23) = happyShift action_25
action_80 (24) = happyShift action_26
action_80 (25) = happyShift action_54
action_80 (26) = happyShift action_28
action_80 (28) = happyShift action_29
action_80 (33) = happyShift action_30
action_80 (34) = happyShift action_31
action_80 (35) = happyShift action_32
action_80 (6) = happyGoto action_14
action_80 (8) = happyGoto action_15
action_80 (9) = happyGoto action_99
action_80 (14) = happyGoto action_19
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (21) = happyShift action_23
action_81 (22) = happyShift action_24
action_81 (23) = happyShift action_25
action_81 (24) = happyShift action_26
action_81 (25) = happyShift action_54
action_81 (26) = happyShift action_28
action_81 (28) = happyShift action_29
action_81 (33) = happyShift action_30
action_81 (34) = happyShift action_31
action_81 (35) = happyShift action_32
action_81 (6) = happyGoto action_14
action_81 (8) = happyGoto action_15
action_81 (9) = happyGoto action_98
action_81 (14) = happyGoto action_19
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (21) = happyShift action_23
action_82 (22) = happyShift action_24
action_82 (23) = happyShift action_25
action_82 (24) = happyShift action_26
action_82 (25) = happyShift action_54
action_82 (26) = happyShift action_28
action_82 (28) = happyShift action_29
action_82 (33) = happyShift action_30
action_82 (34) = happyShift action_31
action_82 (35) = happyShift action_32
action_82 (6) = happyGoto action_14
action_82 (8) = happyGoto action_15
action_82 (9) = happyGoto action_97
action_82 (14) = happyGoto action_19
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (21) = happyShift action_23
action_83 (22) = happyShift action_24
action_83 (23) = happyShift action_25
action_83 (24) = happyShift action_26
action_83 (25) = happyShift action_54
action_83 (26) = happyShift action_28
action_83 (28) = happyShift action_29
action_83 (33) = happyShift action_30
action_83 (34) = happyShift action_31
action_83 (35) = happyShift action_32
action_83 (6) = happyGoto action_14
action_83 (8) = happyGoto action_15
action_83 (9) = happyGoto action_96
action_83 (14) = happyGoto action_19
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (21) = happyShift action_23
action_84 (22) = happyShift action_24
action_84 (23) = happyShift action_25
action_84 (24) = happyShift action_26
action_84 (25) = happyShift action_54
action_84 (26) = happyShift action_28
action_84 (28) = happyShift action_29
action_84 (33) = happyShift action_30
action_84 (34) = happyShift action_31
action_84 (35) = happyShift action_32
action_84 (6) = happyGoto action_14
action_84 (8) = happyGoto action_15
action_84 (9) = happyGoto action_95
action_84 (14) = happyGoto action_19
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (21) = happyShift action_23
action_85 (22) = happyShift action_24
action_85 (23) = happyShift action_25
action_85 (24) = happyShift action_26
action_85 (25) = happyShift action_54
action_85 (26) = happyShift action_28
action_85 (28) = happyShift action_29
action_85 (33) = happyShift action_30
action_85 (34) = happyShift action_31
action_85 (35) = happyShift action_32
action_85 (6) = happyGoto action_14
action_85 (8) = happyGoto action_15
action_85 (9) = happyGoto action_94
action_85 (14) = happyGoto action_19
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (21) = happyShift action_23
action_86 (22) = happyShift action_24
action_86 (23) = happyShift action_25
action_86 (24) = happyShift action_26
action_86 (25) = happyShift action_54
action_86 (26) = happyShift action_28
action_86 (28) = happyShift action_29
action_86 (33) = happyShift action_30
action_86 (34) = happyShift action_31
action_86 (35) = happyShift action_32
action_86 (6) = happyGoto action_14
action_86 (8) = happyGoto action_15
action_86 (9) = happyGoto action_93
action_86 (14) = happyGoto action_19
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (21) = happyShift action_23
action_87 (22) = happyShift action_24
action_87 (23) = happyShift action_25
action_87 (24) = happyShift action_26
action_87 (25) = happyShift action_54
action_87 (26) = happyShift action_28
action_87 (28) = happyShift action_29
action_87 (33) = happyShift action_30
action_87 (34) = happyShift action_31
action_87 (35) = happyShift action_32
action_87 (6) = happyGoto action_14
action_87 (8) = happyGoto action_15
action_87 (9) = happyGoto action_92
action_87 (14) = happyGoto action_19
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (21) = happyShift action_23
action_88 (22) = happyShift action_24
action_88 (23) = happyShift action_25
action_88 (24) = happyShift action_26
action_88 (25) = happyShift action_54
action_88 (26) = happyShift action_28
action_88 (28) = happyShift action_29
action_88 (33) = happyShift action_30
action_88 (34) = happyShift action_31
action_88 (35) = happyShift action_32
action_88 (6) = happyGoto action_14
action_88 (8) = happyGoto action_15
action_88 (9) = happyGoto action_91
action_88 (14) = happyGoto action_19
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (21) = happyShift action_23
action_89 (22) = happyShift action_24
action_89 (23) = happyShift action_25
action_89 (24) = happyShift action_26
action_89 (25) = happyShift action_54
action_89 (26) = happyShift action_28
action_89 (28) = happyShift action_29
action_89 (33) = happyShift action_30
action_89 (34) = happyShift action_31
action_89 (35) = happyShift action_32
action_89 (6) = happyGoto action_14
action_89 (8) = happyGoto action_15
action_89 (9) = happyGoto action_90
action_89 (14) = happyGoto action_19
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (26) = happyShift action_73
action_90 (27) = happyShift action_126
action_90 (34) = happyShift action_75
action_90 (35) = happyShift action_76
action_90 (36) = happyShift action_77
action_90 (37) = happyShift action_78
action_90 (38) = happyShift action_79
action_90 (39) = happyShift action_80
action_90 (40) = happyShift action_81
action_90 (41) = happyShift action_82
action_90 (42) = happyShift action_83
action_90 (43) = happyShift action_84
action_90 (44) = happyShift action_85
action_90 (45) = happyShift action_86
action_90 (46) = happyShift action_87
action_90 (47) = happyShift action_88
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (26) = happyShift action_73
action_91 (34) = happyShift action_75
action_91 (35) = happyShift action_76
action_91 (36) = happyShift action_77
action_91 (37) = happyShift action_78
action_91 (38) = happyShift action_79
action_91 (39) = happyShift action_80
action_91 (40) = happyShift action_81
action_91 (41) = happyShift action_82
action_91 (42) = happyShift action_83
action_91 (43) = happyShift action_84
action_91 (44) = happyShift action_85
action_91 (45) = happyShift action_86
action_91 (46) = happyShift action_87
action_91 (47) = happyShift action_88
action_91 _ = happyReduce_26

action_92 (26) = happyShift action_73
action_92 (34) = happyShift action_75
action_92 (35) = happyShift action_76
action_92 (36) = happyShift action_77
action_92 (37) = happyShift action_78
action_92 (38) = happyShift action_79
action_92 (39) = happyShift action_80
action_92 (40) = happyShift action_81
action_92 (41) = happyShift action_82
action_92 (42) = happyShift action_83
action_92 (43) = happyShift action_84
action_92 (44) = happyShift action_85
action_92 (45) = happyShift action_86
action_92 _ = happyReduce_22

action_93 (26) = happyShift action_73
action_93 (34) = happyShift action_75
action_93 (35) = happyShift action_76
action_93 (36) = happyShift action_77
action_93 (37) = happyShift action_78
action_93 (38) = happyShift action_79
action_93 (39) = happyShift action_80
action_93 (40) = happyShift action_81
action_93 (41) = happyShift action_82
action_93 (42) = happyShift action_83
action_93 (43) = happyShift action_84
action_93 (44) = happyShift action_85
action_93 _ = happyReduce_21

action_94 (26) = happyShift action_73
action_94 (34) = happyShift action_75
action_94 (35) = happyShift action_76
action_94 (36) = happyShift action_77
action_94 (37) = happyShift action_78
action_94 (38) = happyShift action_79
action_94 (39) = happyShift action_80
action_94 (40) = happyShift action_81
action_94 (41) = happyShift action_82
action_94 (42) = happyShift action_83
action_94 _ = happyReduce_20

action_95 (26) = happyShift action_73
action_95 (34) = happyShift action_75
action_95 (35) = happyShift action_76
action_95 (36) = happyShift action_77
action_95 (37) = happyShift action_78
action_95 (38) = happyShift action_79
action_95 (39) = happyShift action_80
action_95 (40) = happyShift action_81
action_95 (41) = happyShift action_82
action_95 (42) = happyShift action_83
action_95 _ = happyReduce_19

action_96 (26) = happyShift action_73
action_96 (34) = happyShift action_75
action_96 (35) = happyShift action_76
action_96 (36) = happyShift action_77
action_96 (37) = happyShift action_78
action_96 (38) = happyShift action_79
action_96 _ = happyReduce_16

action_97 (26) = happyShift action_73
action_97 (34) = happyShift action_75
action_97 (35) = happyShift action_76
action_97 (36) = happyShift action_77
action_97 (37) = happyShift action_78
action_97 (38) = happyShift action_79
action_97 _ = happyReduce_18

action_98 (26) = happyShift action_73
action_98 (34) = happyShift action_75
action_98 (35) = happyShift action_76
action_98 (36) = happyShift action_77
action_98 (37) = happyShift action_78
action_98 (38) = happyShift action_79
action_98 _ = happyReduce_15

action_99 (26) = happyShift action_73
action_99 (34) = happyShift action_75
action_99 (35) = happyShift action_76
action_99 (36) = happyShift action_77
action_99 (37) = happyShift action_78
action_99 (38) = happyShift action_79
action_99 _ = happyReduce_17

action_100 (26) = happyShift action_73
action_100 (34) = happyShift action_75
action_100 (36) = happyShift action_77
action_100 (37) = happyShift action_78
action_100 _ = happyReduce_12

action_101 (26) = happyShift action_73
action_101 _ = happyReduce_14

action_102 (26) = happyShift action_73
action_102 _ = happyReduce_13

action_103 (26) = happyShift action_73
action_103 (34) = happyShift action_75
action_103 (36) = happyShift action_77
action_103 (37) = happyShift action_78
action_103 _ = happyReduce_11

action_104 (26) = happyShift action_73
action_104 _ = happyReduce_10

action_105 (26) = happyShift action_73
action_105 (27) = happyShift action_125
action_105 (34) = happyShift action_75
action_105 (35) = happyShift action_76
action_105 (36) = happyShift action_77
action_105 (37) = happyShift action_78
action_105 (38) = happyShift action_79
action_105 (39) = happyShift action_80
action_105 (40) = happyShift action_81
action_105 (41) = happyShift action_82
action_105 (42) = happyShift action_83
action_105 (43) = happyShift action_84
action_105 (44) = happyShift action_85
action_105 (45) = happyShift action_86
action_105 (46) = happyShift action_87
action_105 (47) = happyShift action_88
action_105 _ = happyFail (happyExpListPerState 105)

action_106 _ = happyReduce_38

action_107 (29) = happyShift action_124
action_107 (30) = happyShift action_109
action_107 _ = happyFail (happyExpListPerState 107)

action_108 _ = happyReduce_42

action_109 (21) = happyShift action_23
action_109 (22) = happyShift action_24
action_109 (23) = happyShift action_25
action_109 (24) = happyShift action_26
action_109 (25) = happyShift action_54
action_109 (26) = happyShift action_28
action_109 (28) = happyShift action_29
action_109 (33) = happyShift action_30
action_109 (34) = happyShift action_31
action_109 (35) = happyShift action_32
action_109 (6) = happyGoto action_14
action_109 (8) = happyGoto action_15
action_109 (9) = happyGoto action_123
action_109 (14) = happyGoto action_19
action_109 _ = happyFail (happyExpListPerState 109)

action_110 _ = happyReduce_6

action_111 _ = happyReduce_31

action_112 (21) = happyShift action_23
action_112 (22) = happyShift action_24
action_112 (23) = happyShift action_25
action_112 (24) = happyShift action_26
action_112 (25) = happyShift action_54
action_112 (26) = happyShift action_28
action_112 (28) = happyShift action_29
action_112 (33) = happyShift action_30
action_112 (34) = happyShift action_31
action_112 (35) = happyShift action_32
action_112 (50) = happyShift action_33
action_112 (52) = happyShift action_34
action_112 (53) = happyShift action_35
action_112 (54) = happyShift action_36
action_112 (55) = happyShift action_37
action_112 (56) = happyShift action_38
action_112 (6) = happyGoto action_14
action_112 (8) = happyGoto action_15
action_112 (9) = happyGoto action_16
action_112 (14) = happyGoto action_19
action_112 (15) = happyGoto action_20
action_112 (16) = happyGoto action_119
action_112 (17) = happyGoto action_122
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (26) = happyShift action_73
action_113 (30) = happyShift action_121
action_113 (34) = happyShift action_75
action_113 (35) = happyShift action_76
action_113 (36) = happyShift action_77
action_113 (37) = happyShift action_78
action_113 (38) = happyShift action_79
action_113 (39) = happyShift action_80
action_113 (40) = happyShift action_81
action_113 (41) = happyShift action_82
action_113 (42) = happyShift action_83
action_113 (43) = happyShift action_84
action_113 (44) = happyShift action_85
action_113 (45) = happyShift action_86
action_113 (46) = happyShift action_87
action_113 (47) = happyShift action_88
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (21) = happyShift action_23
action_114 (22) = happyShift action_24
action_114 (23) = happyShift action_25
action_114 (24) = happyShift action_26
action_114 (25) = happyShift action_54
action_114 (26) = happyShift action_28
action_114 (28) = happyShift action_29
action_114 (33) = happyShift action_30
action_114 (34) = happyShift action_31
action_114 (35) = happyShift action_32
action_114 (50) = happyShift action_33
action_114 (52) = happyShift action_34
action_114 (53) = happyShift action_35
action_114 (54) = happyShift action_36
action_114 (55) = happyShift action_37
action_114 (56) = happyShift action_38
action_114 (6) = happyGoto action_14
action_114 (8) = happyGoto action_15
action_114 (9) = happyGoto action_16
action_114 (14) = happyGoto action_19
action_114 (15) = happyGoto action_20
action_114 (16) = happyGoto action_119
action_114 (17) = happyGoto action_120
action_114 _ = happyFail (happyExpListPerState 114)

action_115 _ = happyReduce_48

action_116 _ = happyReduce_7

action_117 (27) = happyShift action_110
action_117 _ = happyFail (happyExpListPerState 117)

action_118 _ = happyReduce_57

action_119 (21) = happyShift action_23
action_119 (22) = happyShift action_24
action_119 (23) = happyShift action_25
action_119 (24) = happyShift action_26
action_119 (25) = happyShift action_54
action_119 (26) = happyShift action_28
action_119 (28) = happyShift action_29
action_119 (33) = happyShift action_30
action_119 (34) = happyShift action_31
action_119 (35) = happyShift action_32
action_119 (50) = happyShift action_33
action_119 (52) = happyShift action_34
action_119 (53) = happyShift action_35
action_119 (54) = happyShift action_36
action_119 (55) = happyShift action_37
action_119 (56) = happyShift action_38
action_119 (6) = happyGoto action_14
action_119 (8) = happyGoto action_15
action_119 (9) = happyGoto action_16
action_119 (14) = happyGoto action_19
action_119 (15) = happyGoto action_69
action_119 _ = happyReduce_54

action_120 (59) = happyShift action_129
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (21) = happyShift action_23
action_121 (22) = happyShift action_24
action_121 (23) = happyShift action_25
action_121 (24) = happyShift action_26
action_121 (25) = happyShift action_54
action_121 (26) = happyShift action_28
action_121 (28) = happyShift action_29
action_121 (33) = happyShift action_30
action_121 (34) = happyShift action_31
action_121 (35) = happyShift action_32
action_121 (6) = happyGoto action_14
action_121 (8) = happyGoto action_15
action_121 (9) = happyGoto action_128
action_121 (14) = happyGoto action_19
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (51) = happyShift action_127
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (26) = happyShift action_73
action_123 (34) = happyShift action_75
action_123 (35) = happyShift action_76
action_123 (36) = happyShift action_77
action_123 (37) = happyShift action_78
action_123 (38) = happyShift action_79
action_123 (39) = happyShift action_80
action_123 (40) = happyShift action_81
action_123 (41) = happyShift action_82
action_123 (42) = happyShift action_83
action_123 (43) = happyShift action_84
action_123 (44) = happyShift action_85
action_123 (45) = happyShift action_86
action_123 (46) = happyShift action_87
action_123 (47) = happyShift action_88
action_123 _ = happyReduce_33

action_124 _ = happyReduce_29

action_125 _ = happyReduce_27

action_126 _ = happyReduce_43

action_127 (21) = happyShift action_23
action_127 (22) = happyShift action_24
action_127 (23) = happyShift action_25
action_127 (24) = happyShift action_26
action_127 (25) = happyShift action_54
action_127 (26) = happyShift action_28
action_127 (28) = happyShift action_29
action_127 (33) = happyShift action_30
action_127 (34) = happyShift action_31
action_127 (35) = happyShift action_32
action_127 (50) = happyShift action_33
action_127 (52) = happyShift action_34
action_127 (53) = happyShift action_35
action_127 (54) = happyShift action_36
action_127 (55) = happyShift action_37
action_127 (56) = happyShift action_38
action_127 (6) = happyGoto action_14
action_127 (8) = happyGoto action_15
action_127 (9) = happyGoto action_16
action_127 (14) = happyGoto action_19
action_127 (15) = happyGoto action_20
action_127 (16) = happyGoto action_119
action_127 (17) = happyGoto action_131
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (26) = happyShift action_73
action_128 (30) = happyShift action_130
action_128 (34) = happyShift action_75
action_128 (35) = happyShift action_76
action_128 (36) = happyShift action_77
action_128 (37) = happyShift action_78
action_128 (38) = happyShift action_79
action_128 (39) = happyShift action_80
action_128 (40) = happyShift action_81
action_128 (41) = happyShift action_82
action_128 (42) = happyShift action_83
action_128 (43) = happyShift action_84
action_128 (44) = happyShift action_85
action_128 (45) = happyShift action_86
action_128 (46) = happyShift action_87
action_128 (47) = happyShift action_88
action_128 _ = happyFail (happyExpListPerState 128)

action_129 _ = happyReduce_47

action_130 (21) = happyShift action_23
action_130 (22) = happyShift action_24
action_130 (23) = happyShift action_25
action_130 (24) = happyShift action_26
action_130 (25) = happyShift action_54
action_130 (26) = happyShift action_28
action_130 (28) = happyShift action_29
action_130 (33) = happyShift action_30
action_130 (34) = happyShift action_31
action_130 (35) = happyShift action_32
action_130 (6) = happyGoto action_14
action_130 (8) = happyGoto action_15
action_130 (9) = happyGoto action_133
action_130 (14) = happyGoto action_19
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (59) = happyShift action_132
action_131 _ = happyFail (happyExpListPerState 131)

action_132 _ = happyReduce_44

action_133 (26) = happyShift action_73
action_133 (29) = happyShift action_134
action_133 (34) = happyShift action_75
action_133 (35) = happyShift action_76
action_133 (36) = happyShift action_77
action_133 (37) = happyShift action_78
action_133 (38) = happyShift action_79
action_133 (39) = happyShift action_80
action_133 (40) = happyShift action_81
action_133 (41) = happyShift action_82
action_133 (42) = happyShift action_83
action_133 (43) = happyShift action_84
action_133 (44) = happyShift action_85
action_133 (45) = happyShift action_86
action_133 (46) = happyShift action_87
action_133 (47) = happyShift action_88
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (58) = happyShift action_135
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (21) = happyShift action_23
action_135 (22) = happyShift action_24
action_135 (23) = happyShift action_25
action_135 (24) = happyShift action_26
action_135 (25) = happyShift action_54
action_135 (26) = happyShift action_28
action_135 (28) = happyShift action_29
action_135 (33) = happyShift action_30
action_135 (34) = happyShift action_31
action_135 (35) = happyShift action_32
action_135 (50) = happyShift action_33
action_135 (52) = happyShift action_34
action_135 (53) = happyShift action_35
action_135 (54) = happyShift action_36
action_135 (55) = happyShift action_37
action_135 (56) = happyShift action_38
action_135 (6) = happyGoto action_14
action_135 (8) = happyGoto action_15
action_135 (9) = happyGoto action_16
action_135 (14) = happyGoto action_19
action_135 (15) = happyGoto action_20
action_135 (16) = happyGoto action_119
action_135 (17) = happyGoto action_136
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (59) = happyShift action_137
action_136 _ = happyFail (happyExpListPerState 136)

action_137 _ = happyReduce_45

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (AST (reverse happy_var_1)
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  5 happyReduction_2
happyReduction_2 (HappyAbsSyn20  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_2:happy_var_1
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_0  5 happyReduction_3
happyReduction_3  =  HappyAbsSyn5
		 ([]
	)

happyReduce_4 = happySpecReduce_1  6 happyReduction_4
happyReduction_4 _
	 =  HappyAbsSyn6
		 (Int
	)

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 _
	 =  HappyAbsSyn6
		 (Bool
	)

happyReduce_6 = happySpecReduce_3  6 happyReduction_6
happyReduction_6 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Array happy_var_2
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Pointer happy_var_2
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  7 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (ReturnType happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn7
		 (Void
	)

happyReduce_10 = happySpecReduce_3  8 happyReduction_10
happyReduction_10 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (Multiply happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  8 happyReduction_11
happyReduction_11 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (Minus happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  8 happyReduction_12
happyReduction_12 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (Plus happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  8 happyReduction_13
happyReduction_13 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (Divide happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  8 happyReduction_14
happyReduction_14 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (Modulo happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  8 happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (Less happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  8 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (LessEq happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  8 happyReduction_17
happyReduction_17 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (Greater happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  8 happyReduction_18
happyReduction_18 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (GreaterEq happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  8 happyReduction_19
happyReduction_19 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (Equal happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  8 happyReduction_20
happyReduction_20 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (NotEqual happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  8 happyReduction_21
happyReduction_21 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (And happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  8 happyReduction_22
happyReduction_22 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (Or happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_2  8 happyReduction_23
happyReduction_23 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (Negation happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  8 happyReduction_24
happyReduction_24 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (UnwrapPointer happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_2  8 happyReduction_25
happyReduction_25 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (MinusUnary happy_var_2
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  8 happyReduction_26
happyReduction_26 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (Assign happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happyReduce 4 8 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ArrayIndex happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_1  9 happyReduction_28
happyReduction_28 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (LiteralExpression happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happyReduce 4 9 happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexeme _ (TokenId happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (FunctionCall happy_var_1 (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_1  9 happyReduction_30
happyReduction_30 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn9
		 (Operation happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  9 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (SubExpression happy_var_2
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  9 happyReduction_32
happyReduction_32 (HappyTerminal (Lexeme _ (TokenId happy_var_1)))
	 =  HappyAbsSyn9
		 (Variable happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  10 happyReduction_33
happyReduction_33 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_3:happy_var_1
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  10 happyReduction_34
happyReduction_34 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  11 happyReduction_35
happyReduction_35 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (Lexeme _ (TokenId happy_var_1)))
	 =  HappyAbsSyn11
		 (Declaration happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  12 happyReduction_36
happyReduction_36 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_3:happy_var_1
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  12 happyReduction_37
happyReduction_37 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  13 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_2:happy_var_1
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_2  13 happyReduction_39
happyReduction_39 _
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  14 happyReduction_40
happyReduction_40 (HappyTerminal (Lexeme _ (TokenIntLiteral happy_var_1)))
	 =  HappyAbsSyn14
		 (IntLiteral happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  14 happyReduction_41
happyReduction_41 (HappyTerminal (Lexeme _ (TokenBoolLiteral happy_var_1)))
	 =  HappyAbsSyn14
		 (BoolLiteral happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  14 happyReduction_42
happyReduction_42 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (ArrayLiteral (reverse happy_var_2)
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happyReduce 4 14 happyReduction_43
happyReduction_43 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (EmptyArrayLiteral happy_var_1 happy_var_3 zz
	) `HappyStk` happyRest

happyReduce_44 = happyReduce 7 15 happyReduction_44
happyReduction_44 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (IfElseStatement happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_45 = happyReduce 11 15 happyReduction_45
happyReduction_45 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (ForStatement happy_var_3 happy_var_5 happy_var_7 happy_var_10
	) `HappyStk` happyRest

happyReduce_46 = happySpecReduce_2  15 happyReduction_46
happyReduction_46 _
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn15
		 (ExpressionStatement happy_var_1
	)
happyReduction_46 _ _  = notHappyAtAll 

happyReduce_47 = happyReduce 5 15 happyReduction_47
happyReduction_47 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (WhileStatement happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_48 = happySpecReduce_3  15 happyReduction_48
happyReduction_48 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (ReturnStatement happy_var_2
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_2  15 happyReduction_49
happyReduction_49 _
	_
	 =  HappyAbsSyn15
		 (VoidReturnStatement
	)

happyReduce_50 = happySpecReduce_2  15 happyReduction_50
happyReduction_50 _
	_
	 =  HappyAbsSyn15
		 (BreakStatement
	)

happyReduce_51 = happySpecReduce_2  15 happyReduction_51
happyReduction_51 _
	_
	 =  HappyAbsSyn15
		 (ContinueStatement
	)

happyReduce_52 = happySpecReduce_2  16 happyReduction_52
happyReduction_52 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_2 : happy_var_1
	)
happyReduction_52 _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_1  16 happyReduction_53
happyReduction_53 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 ([happy_var_1]
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  17 happyReduction_54
happyReduction_54 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn17
		 (Body (reverse happy_var_1)
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_2  18 happyReduction_55
happyReduction_55 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn18
		 (FunctionBody (reverse happy_var_1) (reverse happy_var_2)
	)
happyReduction_55 _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  18 happyReduction_56
happyReduction_56 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn18
		 (FunctionBody [] happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happyReduce 5 19 happyReduction_57
happyReduction_57 ((HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (FunctionType (reverse happy_var_2) happy_var_5
	) `HappyStk` happyRest

happyReduce_58 = happySpecReduce_3  19 happyReduction_58
happyReduction_58 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (FunctionType (reverse happy_var_2) Void
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happyReduce 4 19 happyReduction_59
happyReduction_59 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (FunctionType [] happy_var_4
	) `HappyStk` happyRest

happyReduce_60 = happySpecReduce_2  19 happyReduction_60
happyReduction_60 _
	_
	 =  HappyAbsSyn19
		 (FunctionType [] Void
	)

happyReduce_61 = happySpecReduce_0  19 happyReduction_61
happyReduction_61  =  HappyAbsSyn19
		 (FunctionType [] Void
	)

happyReduce_62 = happyReduce 6 20 happyReduction_62
happyReduction_62 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_3) `HappyStk`
	(HappyTerminal (Lexeme _ (TokenId happy_var_2))) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (Function happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyNewToken action sts stk
	= lexwrap(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	Lexeme _ TokenEOF -> action 60 60 tk (HappyState action) sts stk;
	Lexeme _ (TokenType "int") -> cont 21;
	Lexeme _ (TokenType "bool") -> cont 22;
	Lexeme _ (TokenIntLiteral happy_dollar_dollar) -> cont 23;
	Lexeme _ (TokenBoolLiteral happy_dollar_dollar) -> cont 24;
	Lexeme _ (TokenId happy_dollar_dollar) -> cont 25;
	Lexeme _ TokenSquareLeftParen -> cont 26;
	Lexeme _ TokenSquareRightParen -> cont 27;
	Lexeme _ TokenLeftParen -> cont 28;
	Lexeme _ TokenRightParen -> cont 29;
	Lexeme _ TokenComma -> cont 30;
	Lexeme _ TokenColon -> cont 31;
	Lexeme _ TokenSemicolon -> cont 32;
	Lexeme _ (TokenOperator "!") -> cont 33;
	Lexeme _ (TokenOperator "*") -> cont 34;
	Lexeme _ (TokenOperator "-") -> cont 35;
	Lexeme _ (TokenOperator "/") -> cont 36;
	Lexeme _ (TokenOperator "%") -> cont 37;
	Lexeme _ (TokenOperator "+") -> cont 38;
	Lexeme _ (TokenOperator ">") -> cont 39;
	Lexeme _ (TokenOperator "<") -> cont 40;
	Lexeme _ (TokenOperator ">=") -> cont 41;
	Lexeme _ (TokenOperator "<=") -> cont 42;
	Lexeme _ (TokenOperator "==") -> cont 43;
	Lexeme _ (TokenOperator "!=") -> cont 44;
	Lexeme _ (TokenOperator "&&") -> cont 45;
	Lexeme _ (TokenOperator "||") -> cont 46;
	Lexeme _ (TokenOperator "=") -> cont 47;
	Lexeme _ TokenVoid -> cont 48;
	Lexeme _ TokenFunction -> cont 49;
	Lexeme _ TokenIf -> cont 50;
	Lexeme _ TokenElse -> cont 51;
	Lexeme _ TokenFor -> cont 52;
	Lexeme _ TokenWhile -> cont 53;
	Lexeme _ TokenReturn -> cont 54;
	Lexeme _ TokenBreak -> cont 55;
	Lexeme _ TokenContinue -> cont 56;
	Lexeme _ TokenArrow -> cont 57;
	Lexeme _ TokenDo -> cont 58;
	Lexeme _ TokenEnd -> cont 59;
	_ -> happyError' (tk, [])
	})

happyError_ explist 60 tk = happyError' (tk, explist)
happyError_ explist _ tk = happyError' (tk, explist)

happyThen :: () => Alex a -> (a -> Alex b) -> Alex b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> Alex a
happyReturn = (Prelude.return)
happyThen1 :: () => Alex a -> (a -> Alex b) -> Alex b
happyThen1 = happyThen
happyReturn1 :: () => a -> Alex a
happyReturn1 = happyReturn
happyError' :: () => ((Lexeme), [Prelude.String]) -> Alex a
happyError' tk = (\(tokens, _) -> parseError tokens) tk
parser = happySomeParser where
 happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


lexwrap = (alexMonadScan >>= )

parseError :: Lexeme -> Alex a
parseError (Lexeme (AlexPn _ y z) _) = alexError ("Syntax error at line " ++ show y ++ " and column " ++ show z)

parse :: String -> Either String AST
parse s = runAlex s parser
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
