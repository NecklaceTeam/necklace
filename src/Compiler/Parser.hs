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

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,434) ([0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,16384,0,0,0,4096,0,0,0,272,0,0,0,0,0,0,49152,0,0,0,2048,0,0,0,0,0,1,4480,16,4,0,32908,0,0,0,0,0,2,4096,0,0,0,0,0,0,49152,2056,512,0,0,0,0,0,0,0,0,0,0,0,0,35840,128,0,0,1120,4,0,0,0,0,0,0,0,0,1,0,0,0,0,32,16384,31,0,0,0,0,8192,0,0,0,0,0,128,0,2,62464,1,0,0,0,0,16384,0,0,0,4,59392,3,0,0,0,0,256,0,250,0,0,0,32,0,18,0,0,6016,14,0,0,128,0,0,57344,901,0,0,12032,30,0,0,4096,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,65512,3,0,0,0,0,0,0,0,0,0,0,0,0,2048,16384,0,0,14430,0,0,61440,450,0,0,0,0,0,0,28860,0,0,57344,901,0,0,12032,28,0,0,49216,2047,64,49152,1803,0,0,4096,65520,4097,0,49904,1,0,0,0,0,0,0,0,0,0,1024,0,0,0,512,0,0,8192,0,8000,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,57376,1023,0,0,24,0,0,12032,28,0,0,57720,0,0,49152,1803,0,0,24064,56,0,0,49904,1,0,32768,3607,0,0,48128,112,0,0,34272,3,0,0,7215,0,0,30720,225,0,0,3008,7,0,0,14430,0,0,61440,450,0,0,6016,14,0,0,16,40960,15,0,65297,31,0,1024,0,1000,0,64,0,0,0,2,0,0,4096,0,0,0,33920,4095,0,0,72,0,0,48128,112,0,0,34272,3,0,0,0,0,0,16384,65472,7,0,12288,0,0,0,0,0,0,61440,450,0,0,0,0,0,0,16,40960,15,0,0,0,2,12032,28,0,0,0,32768,0,0,65026,31,0,4096,32752,0,0,32896,255,0,0,64516,7,0,8192,992,0,0,256,31,0,0,63496,0,0,16384,1984,0,0,512,26,0,0,16,0,0,32768,0,0,0,1024,52,0,0,32,0,0,0,65283,31,0,0,2,0,0,0,0,0,0,0,0,0,2048,0,2000,0,34944,4095,0,0,0,0,0,8192,65504,3,0,0,0,0,0,7215,0,0,0,0,32768,0,0,0,0,0,61584,511,0,0,0,32768,0,512,0,500,0,0,0,64,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Start","Functions","Type","ReturnType","Operator","Expression","Expressions","Declaration","FunctionArgs","Declarations","Literal","Statement","Statements","Body","FunctionBody","Function","int","bool","intLit","boolLit","name","'['","']'","'('","')'","','","':'","';'","'!'","'*'","'-'","'/'","'%'","'+'","'>'","'<'","'>='","'<='","'=='","'!='","'&&'","'||'","'='","void","function","if","else","for","while","return","break","continue","'->'","do","end","%eof"]
        bit_start = st Prelude.* 59
        bit_end = (st Prelude.+ 1) Prelude.* 59
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..58]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_2
action_0 _ = happyReduce_3

action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (48) = happyShift action_5
action_2 (19) = happyGoto action_4
action_2 _ = happyReduce_1

action_3 (59) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_2

action_5 (24) = happyShift action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (27) = happyShift action_7
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (24) = happyShift action_10
action_7 (28) = happyShift action_11
action_7 (11) = happyGoto action_8
action_7 (12) = happyGoto action_9
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_36

action_9 (28) = happyShift action_14
action_9 (29) = happyShift action_15
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (30) = happyShift action_13
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (56) = happyShift action_12
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (20) = happyShift action_19
action_12 (21) = happyShift action_20
action_12 (25) = happyShift action_21
action_12 (33) = happyShift action_22
action_12 (47) = happyShift action_25
action_12 (6) = happyGoto action_23
action_12 (7) = happyGoto action_24
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (20) = happyShift action_19
action_13 (21) = happyShift action_20
action_13 (25) = happyShift action_21
action_13 (33) = happyShift action_22
action_13 (6) = happyGoto action_18
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (56) = happyShift action_17
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (24) = happyShift action_10
action_15 (11) = happyGoto action_16
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_35

action_17 (20) = happyShift action_19
action_17 (21) = happyShift action_20
action_17 (25) = happyShift action_21
action_17 (33) = happyShift action_22
action_17 (47) = happyShift action_25
action_17 (6) = happyGoto action_23
action_17 (7) = happyGoto action_29
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_34

action_19 _ = happyReduce_4

action_20 _ = happyReduce_5

action_21 (20) = happyShift action_19
action_21 (21) = happyShift action_20
action_21 (25) = happyShift action_21
action_21 (33) = happyShift action_22
action_21 (6) = happyGoto action_28
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (20) = happyShift action_19
action_22 (21) = happyShift action_20
action_22 (25) = happyShift action_21
action_22 (33) = happyShift action_22
action_22 (6) = happyGoto action_27
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_8

action_24 (57) = happyShift action_26
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_9

action_26 (24) = happyShift action_37
action_26 (49) = happyShift action_38
action_26 (51) = happyShift action_39
action_26 (52) = happyShift action_40
action_26 (53) = happyShift action_41
action_26 (54) = happyShift action_42
action_26 (55) = happyShift action_43
action_26 (11) = happyGoto action_32
action_26 (13) = happyGoto action_33
action_26 (15) = happyGoto action_34
action_26 (16) = happyGoto action_35
action_26 (18) = happyGoto action_36
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_7

action_28 (26) = happyShift action_31
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (57) = happyShift action_30
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (24) = happyShift action_37
action_30 (49) = happyShift action_38
action_30 (51) = happyShift action_39
action_30 (52) = happyShift action_40
action_30 (53) = happyShift action_41
action_30 (54) = happyShift action_42
action_30 (55) = happyShift action_43
action_30 (11) = happyGoto action_32
action_30 (13) = happyGoto action_33
action_30 (15) = happyGoto action_34
action_30 (16) = happyGoto action_35
action_30 (18) = happyGoto action_68
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_6

action_32 (31) = happyShift action_67
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (24) = happyShift action_37
action_33 (49) = happyShift action_38
action_33 (51) = happyShift action_39
action_33 (52) = happyShift action_40
action_33 (53) = happyShift action_41
action_33 (54) = happyShift action_42
action_33 (55) = happyShift action_43
action_33 (11) = happyGoto action_65
action_33 (15) = happyGoto action_34
action_33 (16) = happyGoto action_66
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_51

action_35 (24) = happyShift action_64
action_35 (49) = happyShift action_38
action_35 (51) = happyShift action_39
action_35 (52) = happyShift action_40
action_35 (53) = happyShift action_41
action_35 (54) = happyShift action_42
action_35 (55) = happyShift action_43
action_35 (15) = happyGoto action_63
action_35 _ = happyReduce_54

action_36 (58) = happyShift action_62
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (27) = happyShift action_61
action_37 (30) = happyShift action_13
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (22) = happyShift action_49
action_38 (23) = happyShift action_50
action_38 (24) = happyShift action_51
action_38 (25) = happyShift action_52
action_38 (27) = happyShift action_53
action_38 (32) = happyShift action_55
action_38 (33) = happyShift action_56
action_38 (34) = happyShift action_57
action_38 (8) = happyGoto action_46
action_38 (9) = happyGoto action_60
action_38 (14) = happyGoto action_48
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (27) = happyShift action_59
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (22) = happyShift action_49
action_40 (23) = happyShift action_50
action_40 (24) = happyShift action_51
action_40 (25) = happyShift action_52
action_40 (27) = happyShift action_53
action_40 (32) = happyShift action_55
action_40 (33) = happyShift action_56
action_40 (34) = happyShift action_57
action_40 (8) = happyGoto action_46
action_40 (9) = happyGoto action_58
action_40 (14) = happyGoto action_48
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (22) = happyShift action_49
action_41 (23) = happyShift action_50
action_41 (24) = happyShift action_51
action_41 (25) = happyShift action_52
action_41 (27) = happyShift action_53
action_41 (31) = happyShift action_54
action_41 (32) = happyShift action_55
action_41 (33) = happyShift action_56
action_41 (34) = happyShift action_57
action_41 (8) = happyGoto action_46
action_41 (9) = happyGoto action_47
action_41 (14) = happyGoto action_48
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (31) = happyShift action_45
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (31) = happyShift action_44
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_49

action_45 _ = happyReduce_48

action_46 _ = happyReduce_29

action_47 (25) = happyShift action_73
action_47 (31) = happyShift action_97
action_47 (33) = happyShift action_74
action_47 (34) = happyShift action_75
action_47 (35) = happyShift action_76
action_47 (36) = happyShift action_77
action_47 (37) = happyShift action_78
action_47 (38) = happyShift action_79
action_47 (39) = happyShift action_80
action_47 (40) = happyShift action_81
action_47 (41) = happyShift action_82
action_47 (42) = happyShift action_83
action_47 (43) = happyShift action_84
action_47 (44) = happyShift action_85
action_47 (45) = happyShift action_86
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_27

action_49 _ = happyReduce_39

action_50 _ = happyReduce_40

action_51 (27) = happyShift action_95
action_51 (46) = happyShift action_96
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (22) = happyShift action_49
action_52 (23) = happyShift action_50
action_52 (24) = happyShift action_51
action_52 (25) = happyShift action_52
action_52 (27) = happyShift action_53
action_52 (32) = happyShift action_55
action_52 (33) = happyShift action_56
action_52 (34) = happyShift action_57
action_52 (8) = happyGoto action_46
action_52 (9) = happyGoto action_71
action_52 (10) = happyGoto action_94
action_52 (14) = happyGoto action_48
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (22) = happyShift action_49
action_53 (23) = happyShift action_50
action_53 (24) = happyShift action_51
action_53 (25) = happyShift action_52
action_53 (27) = happyShift action_53
action_53 (32) = happyShift action_55
action_53 (33) = happyShift action_56
action_53 (34) = happyShift action_57
action_53 (8) = happyGoto action_46
action_53 (9) = happyGoto action_93
action_53 (14) = happyGoto action_48
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_47

action_55 (22) = happyShift action_49
action_55 (23) = happyShift action_50
action_55 (24) = happyShift action_51
action_55 (25) = happyShift action_52
action_55 (27) = happyShift action_53
action_55 (32) = happyShift action_55
action_55 (33) = happyShift action_56
action_55 (34) = happyShift action_57
action_55 (8) = happyGoto action_46
action_55 (9) = happyGoto action_92
action_55 (14) = happyGoto action_48
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (22) = happyShift action_49
action_56 (23) = happyShift action_50
action_56 (24) = happyShift action_51
action_56 (25) = happyShift action_52
action_56 (27) = happyShift action_53
action_56 (32) = happyShift action_55
action_56 (33) = happyShift action_56
action_56 (34) = happyShift action_57
action_56 (8) = happyGoto action_46
action_56 (9) = happyGoto action_91
action_56 (14) = happyGoto action_48
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (22) = happyShift action_49
action_57 (23) = happyShift action_50
action_57 (24) = happyShift action_51
action_57 (25) = happyShift action_52
action_57 (27) = happyShift action_53
action_57 (32) = happyShift action_55
action_57 (33) = happyShift action_56
action_57 (34) = happyShift action_57
action_57 (8) = happyGoto action_46
action_57 (9) = happyGoto action_90
action_57 (14) = happyGoto action_48
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (25) = happyShift action_73
action_58 (33) = happyShift action_74
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
action_58 (57) = happyShift action_89
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (22) = happyShift action_49
action_59 (23) = happyShift action_50
action_59 (24) = happyShift action_51
action_59 (25) = happyShift action_52
action_59 (27) = happyShift action_53
action_59 (32) = happyShift action_55
action_59 (33) = happyShift action_56
action_59 (34) = happyShift action_57
action_59 (8) = happyGoto action_46
action_59 (9) = happyGoto action_88
action_59 (14) = happyGoto action_48
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (25) = happyShift action_73
action_60 (33) = happyShift action_74
action_60 (34) = happyShift action_75
action_60 (35) = happyShift action_76
action_60 (36) = happyShift action_77
action_60 (37) = happyShift action_78
action_60 (38) = happyShift action_79
action_60 (39) = happyShift action_80
action_60 (40) = happyShift action_81
action_60 (41) = happyShift action_82
action_60 (42) = happyShift action_83
action_60 (43) = happyShift action_84
action_60 (44) = happyShift action_85
action_60 (45) = happyShift action_86
action_60 (57) = happyShift action_87
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (22) = happyShift action_49
action_61 (23) = happyShift action_50
action_61 (24) = happyShift action_51
action_61 (25) = happyShift action_52
action_61 (27) = happyShift action_53
action_61 (32) = happyShift action_55
action_61 (33) = happyShift action_56
action_61 (34) = happyShift action_57
action_61 (8) = happyGoto action_46
action_61 (9) = happyGoto action_71
action_61 (10) = happyGoto action_72
action_61 (14) = happyGoto action_48
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_56

action_63 _ = happyReduce_50

action_64 (27) = happyShift action_61
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (31) = happyShift action_70
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (24) = happyShift action_64
action_66 (49) = happyShift action_38
action_66 (51) = happyShift action_39
action_66 (52) = happyShift action_40
action_66 (53) = happyShift action_41
action_66 (54) = happyShift action_42
action_66 (55) = happyShift action_43
action_66 (15) = happyGoto action_63
action_66 _ = happyReduce_53

action_67 _ = happyReduce_38

action_68 (58) = happyShift action_69
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_55

action_70 _ = happyReduce_37

action_71 (25) = happyShift action_73
action_71 (33) = happyShift action_74
action_71 (34) = happyShift action_75
action_71 (35) = happyShift action_76
action_71 (36) = happyShift action_77
action_71 (37) = happyShift action_78
action_71 (38) = happyShift action_79
action_71 (39) = happyShift action_80
action_71 (40) = happyShift action_81
action_71 (41) = happyShift action_82
action_71 (42) = happyShift action_83
action_71 (43) = happyShift action_84
action_71 (44) = happyShift action_85
action_71 (45) = happyShift action_86
action_71 _ = happyReduce_33

action_72 (28) = happyShift action_121
action_72 (29) = happyShift action_101
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (22) = happyShift action_49
action_73 (23) = happyShift action_50
action_73 (24) = happyShift action_51
action_73 (25) = happyShift action_52
action_73 (27) = happyShift action_53
action_73 (32) = happyShift action_55
action_73 (33) = happyShift action_56
action_73 (34) = happyShift action_57
action_73 (8) = happyGoto action_46
action_73 (9) = happyGoto action_120
action_73 (14) = happyGoto action_48
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (22) = happyShift action_49
action_74 (23) = happyShift action_50
action_74 (24) = happyShift action_51
action_74 (25) = happyShift action_52
action_74 (27) = happyShift action_53
action_74 (32) = happyShift action_55
action_74 (33) = happyShift action_56
action_74 (34) = happyShift action_57
action_74 (8) = happyGoto action_46
action_74 (9) = happyGoto action_119
action_74 (14) = happyGoto action_48
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (22) = happyShift action_49
action_75 (23) = happyShift action_50
action_75 (24) = happyShift action_51
action_75 (25) = happyShift action_52
action_75 (27) = happyShift action_53
action_75 (32) = happyShift action_55
action_75 (33) = happyShift action_56
action_75 (34) = happyShift action_57
action_75 (8) = happyGoto action_46
action_75 (9) = happyGoto action_118
action_75 (14) = happyGoto action_48
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (22) = happyShift action_49
action_76 (23) = happyShift action_50
action_76 (24) = happyShift action_51
action_76 (25) = happyShift action_52
action_76 (27) = happyShift action_53
action_76 (32) = happyShift action_55
action_76 (33) = happyShift action_56
action_76 (34) = happyShift action_57
action_76 (8) = happyGoto action_46
action_76 (9) = happyGoto action_117
action_76 (14) = happyGoto action_48
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (22) = happyShift action_49
action_77 (23) = happyShift action_50
action_77 (24) = happyShift action_51
action_77 (25) = happyShift action_52
action_77 (27) = happyShift action_53
action_77 (32) = happyShift action_55
action_77 (33) = happyShift action_56
action_77 (34) = happyShift action_57
action_77 (8) = happyGoto action_46
action_77 (9) = happyGoto action_116
action_77 (14) = happyGoto action_48
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (22) = happyShift action_49
action_78 (23) = happyShift action_50
action_78 (24) = happyShift action_51
action_78 (25) = happyShift action_52
action_78 (27) = happyShift action_53
action_78 (32) = happyShift action_55
action_78 (33) = happyShift action_56
action_78 (34) = happyShift action_57
action_78 (8) = happyGoto action_46
action_78 (9) = happyGoto action_115
action_78 (14) = happyGoto action_48
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (22) = happyShift action_49
action_79 (23) = happyShift action_50
action_79 (24) = happyShift action_51
action_79 (25) = happyShift action_52
action_79 (27) = happyShift action_53
action_79 (32) = happyShift action_55
action_79 (33) = happyShift action_56
action_79 (34) = happyShift action_57
action_79 (8) = happyGoto action_46
action_79 (9) = happyGoto action_114
action_79 (14) = happyGoto action_48
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (22) = happyShift action_49
action_80 (23) = happyShift action_50
action_80 (24) = happyShift action_51
action_80 (25) = happyShift action_52
action_80 (27) = happyShift action_53
action_80 (32) = happyShift action_55
action_80 (33) = happyShift action_56
action_80 (34) = happyShift action_57
action_80 (8) = happyGoto action_46
action_80 (9) = happyGoto action_113
action_80 (14) = happyGoto action_48
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (22) = happyShift action_49
action_81 (23) = happyShift action_50
action_81 (24) = happyShift action_51
action_81 (25) = happyShift action_52
action_81 (27) = happyShift action_53
action_81 (32) = happyShift action_55
action_81 (33) = happyShift action_56
action_81 (34) = happyShift action_57
action_81 (8) = happyGoto action_46
action_81 (9) = happyGoto action_112
action_81 (14) = happyGoto action_48
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (22) = happyShift action_49
action_82 (23) = happyShift action_50
action_82 (24) = happyShift action_51
action_82 (25) = happyShift action_52
action_82 (27) = happyShift action_53
action_82 (32) = happyShift action_55
action_82 (33) = happyShift action_56
action_82 (34) = happyShift action_57
action_82 (8) = happyGoto action_46
action_82 (9) = happyGoto action_111
action_82 (14) = happyGoto action_48
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (22) = happyShift action_49
action_83 (23) = happyShift action_50
action_83 (24) = happyShift action_51
action_83 (25) = happyShift action_52
action_83 (27) = happyShift action_53
action_83 (32) = happyShift action_55
action_83 (33) = happyShift action_56
action_83 (34) = happyShift action_57
action_83 (8) = happyGoto action_46
action_83 (9) = happyGoto action_110
action_83 (14) = happyGoto action_48
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (22) = happyShift action_49
action_84 (23) = happyShift action_50
action_84 (24) = happyShift action_51
action_84 (25) = happyShift action_52
action_84 (27) = happyShift action_53
action_84 (32) = happyShift action_55
action_84 (33) = happyShift action_56
action_84 (34) = happyShift action_57
action_84 (8) = happyGoto action_46
action_84 (9) = happyGoto action_109
action_84 (14) = happyGoto action_48
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (22) = happyShift action_49
action_85 (23) = happyShift action_50
action_85 (24) = happyShift action_51
action_85 (25) = happyShift action_52
action_85 (27) = happyShift action_53
action_85 (32) = happyShift action_55
action_85 (33) = happyShift action_56
action_85 (34) = happyShift action_57
action_85 (8) = happyGoto action_46
action_85 (9) = happyGoto action_108
action_85 (14) = happyGoto action_48
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (22) = happyShift action_49
action_86 (23) = happyShift action_50
action_86 (24) = happyShift action_51
action_86 (25) = happyShift action_52
action_86 (27) = happyShift action_53
action_86 (32) = happyShift action_55
action_86 (33) = happyShift action_56
action_86 (34) = happyShift action_57
action_86 (8) = happyGoto action_46
action_86 (9) = happyGoto action_107
action_86 (14) = happyGoto action_48
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (24) = happyShift action_64
action_87 (49) = happyShift action_38
action_87 (51) = happyShift action_39
action_87 (52) = happyShift action_40
action_87 (53) = happyShift action_41
action_87 (54) = happyShift action_42
action_87 (55) = happyShift action_43
action_87 (15) = happyGoto action_34
action_87 (16) = happyGoto action_103
action_87 (17) = happyGoto action_106
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (25) = happyShift action_73
action_88 (29) = happyShift action_105
action_88 (33) = happyShift action_74
action_88 (34) = happyShift action_75
action_88 (35) = happyShift action_76
action_88 (36) = happyShift action_77
action_88 (37) = happyShift action_78
action_88 (38) = happyShift action_79
action_88 (39) = happyShift action_80
action_88 (40) = happyShift action_81
action_88 (41) = happyShift action_82
action_88 (42) = happyShift action_83
action_88 (43) = happyShift action_84
action_88 (44) = happyShift action_85
action_88 (45) = happyShift action_86
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (24) = happyShift action_64
action_89 (49) = happyShift action_38
action_89 (51) = happyShift action_39
action_89 (52) = happyShift action_40
action_89 (53) = happyShift action_41
action_89 (54) = happyShift action_42
action_89 (55) = happyShift action_43
action_89 (15) = happyGoto action_34
action_89 (16) = happyGoto action_103
action_89 (17) = happyGoto action_104
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (25) = happyShift action_73
action_90 _ = happyReduce_25

action_91 (25) = happyShift action_73
action_91 _ = happyReduce_24

action_92 (25) = happyShift action_73
action_92 _ = happyReduce_23

action_93 (25) = happyShift action_73
action_93 (28) = happyShift action_102
action_93 (33) = happyShift action_74
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
action_93 (45) = happyShift action_86
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (26) = happyShift action_100
action_94 (29) = happyShift action_101
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (22) = happyShift action_49
action_95 (23) = happyShift action_50
action_95 (24) = happyShift action_51
action_95 (25) = happyShift action_52
action_95 (27) = happyShift action_53
action_95 (32) = happyShift action_55
action_95 (33) = happyShift action_56
action_95 (34) = happyShift action_57
action_95 (8) = happyGoto action_46
action_95 (9) = happyGoto action_71
action_95 (10) = happyGoto action_99
action_95 (14) = happyGoto action_48
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (22) = happyShift action_49
action_96 (23) = happyShift action_50
action_96 (24) = happyShift action_51
action_96 (25) = happyShift action_52
action_96 (27) = happyShift action_53
action_96 (32) = happyShift action_55
action_96 (33) = happyShift action_56
action_96 (34) = happyShift action_57
action_96 (8) = happyGoto action_46
action_96 (9) = happyGoto action_98
action_96 (14) = happyGoto action_48
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_46

action_98 (25) = happyShift action_73
action_98 (33) = happyShift action_74
action_98 (34) = happyShift action_75
action_98 (35) = happyShift action_76
action_98 (36) = happyShift action_77
action_98 (37) = happyShift action_78
action_98 (38) = happyShift action_79
action_98 (39) = happyShift action_80
action_98 (40) = happyShift action_81
action_98 (41) = happyShift action_82
action_98 (42) = happyShift action_83
action_98 (43) = happyShift action_84
action_98 (44) = happyShift action_85
action_98 (45) = happyShift action_86
action_98 _ = happyReduce_26

action_99 (28) = happyShift action_128
action_99 (29) = happyShift action_101
action_99 _ = happyFail (happyExpListPerState 99)

action_100 _ = happyReduce_41

action_101 (22) = happyShift action_49
action_101 (23) = happyShift action_50
action_101 (24) = happyShift action_51
action_101 (25) = happyShift action_52
action_101 (27) = happyShift action_53
action_101 (32) = happyShift action_55
action_101 (33) = happyShift action_56
action_101 (34) = happyShift action_57
action_101 (8) = happyGoto action_46
action_101 (9) = happyGoto action_127
action_101 (14) = happyGoto action_48
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_30

action_103 (24) = happyShift action_64
action_103 (49) = happyShift action_38
action_103 (51) = happyShift action_39
action_103 (52) = happyShift action_40
action_103 (53) = happyShift action_41
action_103 (54) = happyShift action_42
action_103 (55) = happyShift action_43
action_103 (15) = happyGoto action_63
action_103 _ = happyReduce_52

action_104 (58) = happyShift action_126
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (22) = happyShift action_49
action_105 (23) = happyShift action_50
action_105 (24) = happyShift action_51
action_105 (25) = happyShift action_52
action_105 (27) = happyShift action_53
action_105 (32) = happyShift action_55
action_105 (33) = happyShift action_56
action_105 (34) = happyShift action_57
action_105 (8) = happyGoto action_46
action_105 (9) = happyGoto action_125
action_105 (14) = happyGoto action_48
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (50) = happyShift action_124
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (25) = happyShift action_73
action_107 (33) = happyShift action_74
action_107 (34) = happyShift action_75
action_107 (35) = happyShift action_76
action_107 (36) = happyShift action_77
action_107 (37) = happyShift action_78
action_107 (38) = happyShift action_79
action_107 (39) = happyShift action_80
action_107 (40) = happyShift action_81
action_107 (41) = happyShift action_82
action_107 (42) = happyShift action_83
action_107 (43) = happyShift action_84
action_107 (44) = happyShift action_85
action_107 _ = happyReduce_22

action_108 (25) = happyShift action_73
action_108 (33) = happyShift action_74
action_108 (34) = happyShift action_75
action_108 (35) = happyShift action_76
action_108 (36) = happyShift action_77
action_108 (37) = happyShift action_78
action_108 (38) = happyShift action_79
action_108 (39) = happyShift action_80
action_108 (40) = happyShift action_81
action_108 (41) = happyShift action_82
action_108 (42) = happyShift action_83
action_108 (43) = happyShift action_84
action_108 _ = happyReduce_21

action_109 (25) = happyShift action_73
action_109 (33) = happyShift action_74
action_109 (34) = happyShift action_75
action_109 (35) = happyShift action_76
action_109 (36) = happyShift action_77
action_109 (37) = happyShift action_78
action_109 (38) = happyShift action_79
action_109 (39) = happyShift action_80
action_109 (40) = happyShift action_81
action_109 (41) = happyShift action_82
action_109 _ = happyReduce_20

action_110 (25) = happyShift action_73
action_110 (33) = happyShift action_74
action_110 (34) = happyShift action_75
action_110 (35) = happyShift action_76
action_110 (36) = happyShift action_77
action_110 (37) = happyShift action_78
action_110 (38) = happyShift action_79
action_110 (39) = happyShift action_80
action_110 (40) = happyShift action_81
action_110 (41) = happyShift action_82
action_110 _ = happyReduce_19

action_111 (25) = happyShift action_73
action_111 (33) = happyShift action_74
action_111 (34) = happyShift action_75
action_111 (35) = happyShift action_76
action_111 (36) = happyShift action_77
action_111 (37) = happyShift action_78
action_111 _ = happyReduce_16

action_112 (25) = happyShift action_73
action_112 (33) = happyShift action_74
action_112 (34) = happyShift action_75
action_112 (35) = happyShift action_76
action_112 (36) = happyShift action_77
action_112 (37) = happyShift action_78
action_112 _ = happyReduce_18

action_113 (25) = happyShift action_73
action_113 (33) = happyShift action_74
action_113 (34) = happyShift action_75
action_113 (35) = happyShift action_76
action_113 (36) = happyShift action_77
action_113 (37) = happyShift action_78
action_113 _ = happyReduce_15

action_114 (25) = happyShift action_73
action_114 (33) = happyShift action_74
action_114 (34) = happyShift action_75
action_114 (35) = happyShift action_76
action_114 (36) = happyShift action_77
action_114 (37) = happyShift action_78
action_114 _ = happyReduce_17

action_115 (25) = happyShift action_73
action_115 (33) = happyShift action_74
action_115 (35) = happyShift action_76
action_115 (36) = happyShift action_77
action_115 _ = happyReduce_12

action_116 (25) = happyShift action_73
action_116 _ = happyReduce_14

action_117 (25) = happyShift action_73
action_117 _ = happyReduce_13

action_118 (25) = happyShift action_73
action_118 (33) = happyShift action_74
action_118 (35) = happyShift action_76
action_118 (36) = happyShift action_77
action_118 _ = happyReduce_11

action_119 (25) = happyShift action_73
action_119 _ = happyReduce_10

action_120 (25) = happyShift action_73
action_120 (26) = happyShift action_123
action_120 (33) = happyShift action_74
action_120 (34) = happyShift action_75
action_120 (35) = happyShift action_76
action_120 (36) = happyShift action_77
action_120 (37) = happyShift action_78
action_120 (38) = happyShift action_79
action_120 (39) = happyShift action_80
action_120 (40) = happyShift action_81
action_120 (41) = happyShift action_82
action_120 (42) = happyShift action_83
action_120 (43) = happyShift action_84
action_120 (44) = happyShift action_85
action_120 (45) = happyShift action_86
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (31) = happyShift action_122
action_121 _ = happyFail (happyExpListPerState 121)

action_122 _ = happyReduce_42

action_123 _ = happyReduce_31

action_124 (24) = happyShift action_64
action_124 (49) = happyShift action_38
action_124 (51) = happyShift action_39
action_124 (52) = happyShift action_40
action_124 (53) = happyShift action_41
action_124 (54) = happyShift action_42
action_124 (55) = happyShift action_43
action_124 (15) = happyGoto action_34
action_124 (16) = happyGoto action_103
action_124 (17) = happyGoto action_130
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (25) = happyShift action_73
action_125 (29) = happyShift action_129
action_125 (33) = happyShift action_74
action_125 (34) = happyShift action_75
action_125 (35) = happyShift action_76
action_125 (36) = happyShift action_77
action_125 (37) = happyShift action_78
action_125 (38) = happyShift action_79
action_125 (39) = happyShift action_80
action_125 (40) = happyShift action_81
action_125 (41) = happyShift action_82
action_125 (42) = happyShift action_83
action_125 (43) = happyShift action_84
action_125 (44) = happyShift action_85
action_125 (45) = happyShift action_86
action_125 _ = happyFail (happyExpListPerState 125)

action_126 _ = happyReduce_45

action_127 (25) = happyShift action_73
action_127 (33) = happyShift action_74
action_127 (34) = happyShift action_75
action_127 (35) = happyShift action_76
action_127 (36) = happyShift action_77
action_127 (37) = happyShift action_78
action_127 (38) = happyShift action_79
action_127 (39) = happyShift action_80
action_127 (40) = happyShift action_81
action_127 (41) = happyShift action_82
action_127 (42) = happyShift action_83
action_127 (43) = happyShift action_84
action_127 (44) = happyShift action_85
action_127 (45) = happyShift action_86
action_127 _ = happyReduce_32

action_128 _ = happyReduce_28

action_129 (22) = happyShift action_49
action_129 (23) = happyShift action_50
action_129 (24) = happyShift action_51
action_129 (25) = happyShift action_52
action_129 (27) = happyShift action_53
action_129 (32) = happyShift action_55
action_129 (33) = happyShift action_56
action_129 (34) = happyShift action_57
action_129 (8) = happyGoto action_46
action_129 (9) = happyGoto action_132
action_129 (14) = happyGoto action_48
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (58) = happyShift action_131
action_130 _ = happyFail (happyExpListPerState 130)

action_131 _ = happyReduce_43

action_132 (25) = happyShift action_73
action_132 (28) = happyShift action_133
action_132 (33) = happyShift action_74
action_132 (34) = happyShift action_75
action_132 (35) = happyShift action_76
action_132 (36) = happyShift action_77
action_132 (37) = happyShift action_78
action_132 (38) = happyShift action_79
action_132 (39) = happyShift action_80
action_132 (40) = happyShift action_81
action_132 (41) = happyShift action_82
action_132 (42) = happyShift action_83
action_132 (43) = happyShift action_84
action_132 (44) = happyShift action_85
action_132 (45) = happyShift action_86
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (57) = happyShift action_134
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (24) = happyShift action_64
action_134 (49) = happyShift action_38
action_134 (51) = happyShift action_39
action_134 (52) = happyShift action_40
action_134 (53) = happyShift action_41
action_134 (54) = happyShift action_42
action_134 (55) = happyShift action_43
action_134 (15) = happyGoto action_34
action_134 (16) = happyGoto action_103
action_134 (17) = happyGoto action_135
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (58) = happyShift action_136
action_135 _ = happyFail (happyExpListPerState 135)

action_136 _ = happyReduce_44

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (AST happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  5 happyReduction_2
happyReduction_2 (HappyAbsSyn19  happy_var_2)
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
	(HappyTerminal (Lexeme _ (TokenId happy_var_1)))
	 =  HappyAbsSyn8
		 (Assign happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  9 happyReduction_27
happyReduction_27 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (LiteralExpression happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happyReduce 4 9 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexeme _ (TokenId happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (FunctionCall happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_1  9 happyReduction_29
happyReduction_29 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn9
		 (Operation happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  9 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (SubExpression happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happyReduce 4 9 happyReduction_31
happyReduction_31 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (ArrayIndex happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_32 = happySpecReduce_3  10 happyReduction_32
happyReduction_32 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_3:happy_var_1
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  10 happyReduction_33
happyReduction_33 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  11 happyReduction_34
happyReduction_34 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (Lexeme _ (TokenId happy_var_1)))
	 =  HappyAbsSyn11
		 (Declaration happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  12 happyReduction_35
happyReduction_35 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_3:happy_var_1
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  12 happyReduction_36
happyReduction_36 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  13 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_2:happy_var_1
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  13 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  14 happyReduction_39
happyReduction_39 (HappyTerminal (Lexeme _ (TokenIntLiteral happy_var_1)))
	 =  HappyAbsSyn14
		 (IntLiteral happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  14 happyReduction_40
happyReduction_40 (HappyTerminal (Lexeme _ (TokenBoolLiteral happy_var_1)))
	 =  HappyAbsSyn14
		 (BoolLiteral happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  14 happyReduction_41
happyReduction_41 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (ArrayLiteral happy_var_2
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happyReduce 5 15 happyReduction_42
happyReduction_42 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexeme _ (TokenId happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (FunctionCallStatement happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_43 = happyReduce 7 15 happyReduction_43
happyReduction_43 (_ `HappyStk`
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

happyReduce_44 = happyReduce 11 15 happyReduction_44
happyReduction_44 (_ `HappyStk`
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

happyReduce_45 = happyReduce 5 15 happyReduction_45
happyReduction_45 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (WhileStatement happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_46 = happySpecReduce_3  15 happyReduction_46
happyReduction_46 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (ReturnStatement happy_var_2
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_2  15 happyReduction_47
happyReduction_47 _
	_
	 =  HappyAbsSyn15
		 (VoidReturnStatement
	)

happyReduce_48 = happySpecReduce_2  15 happyReduction_48
happyReduction_48 _
	_
	 =  HappyAbsSyn15
		 (BreakStatement
	)

happyReduce_49 = happySpecReduce_2  15 happyReduction_49
happyReduction_49 _
	_
	 =  HappyAbsSyn15
		 (ContinueStatement
	)

happyReduce_50 = happySpecReduce_2  16 happyReduction_50
happyReduction_50 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_2 : happy_var_1
	)
happyReduction_50 _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  16 happyReduction_51
happyReduction_51 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 ([happy_var_1]
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  17 happyReduction_52
happyReduction_52 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn17
		 (Body happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_2  18 happyReduction_53
happyReduction_53 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn18
		 (FunctionBody happy_var_1 happy_var_2
	)
happyReduction_53 _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  18 happyReduction_54
happyReduction_54 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn18
		 (FunctionBody [] happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happyReduce 10 19 happyReduction_55
happyReduction_55 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexeme _ (TokenId happy_var_2))) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (Function happy_var_2 happy_var_4 happy_var_7 happy_var_9
	) `HappyStk` happyRest

happyReduce_56 = happyReduce 9 19 happyReduction_56
happyReduction_56 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexeme _ (TokenId happy_var_2))) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (Function happy_var_2 [] happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyNewToken action sts stk
	= lexwrap(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	Lexeme _ TokenEOF -> action 59 59 tk (HappyState action) sts stk;
	Lexeme _ (TokenType "int") -> cont 20;
	Lexeme _ (TokenType "bool") -> cont 21;
	Lexeme _ (TokenIntLiteral happy_dollar_dollar) -> cont 22;
	Lexeme _ (TokenBoolLiteral happy_dollar_dollar) -> cont 23;
	Lexeme _ (TokenId happy_dollar_dollar) -> cont 24;
	Lexeme _ TokenSquareLeftParen -> cont 25;
	Lexeme _ TokenSquareRightParen -> cont 26;
	Lexeme _ TokenLeftParen -> cont 27;
	Lexeme _ TokenRightParen -> cont 28;
	Lexeme _ TokenComma -> cont 29;
	Lexeme _ TokenColon -> cont 30;
	Lexeme _ TokenSemicolon -> cont 31;
	Lexeme _ (TokenOperator "!") -> cont 32;
	Lexeme _ (TokenOperator "*") -> cont 33;
	Lexeme _ (TokenOperator "-") -> cont 34;
	Lexeme _ (TokenOperator "/") -> cont 35;
	Lexeme _ (TokenOperator "%") -> cont 36;
	Lexeme _ (TokenOperator "+") -> cont 37;
	Lexeme _ (TokenOperator ">") -> cont 38;
	Lexeme _ (TokenOperator "<") -> cont 39;
	Lexeme _ (TokenOperator ">=") -> cont 40;
	Lexeme _ (TokenOperator "<=") -> cont 41;
	Lexeme _ (TokenOperator "==") -> cont 42;
	Lexeme _ (TokenOperator "!=") -> cont 43;
	Lexeme _ (TokenOperator "&&") -> cont 44;
	Lexeme _ (TokenOperator "||") -> cont 45;
	Lexeme _ (TokenOperator "=") -> cont 46;
	Lexeme _ TokenVoid -> cont 47;
	Lexeme _ TokenFunction -> cont 48;
	Lexeme _ TokenIf -> cont 49;
	Lexeme _ TokenElse -> cont 50;
	Lexeme _ TokenFor -> cont 51;
	Lexeme _ TokenWhile -> cont 52;
	Lexeme _ TokenReturn -> cont 53;
	Lexeme _ TokenBreak -> cont 54;
	Lexeme _ TokenContinue -> cont 55;
	Lexeme _ TokenArrow -> cont 56;
	Lexeme _ TokenDo -> cont 57;
	Lexeme _ TokenEnd -> cont 58;
	_ -> happyError' (tk, [])
	})

happyError_ explist 59 tk = happyError' (tk, explist)
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
