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
happyExpList = Happy_Data_Array.listArray (0,557) ([0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,8,0,0,0,4,0,0,34816,0,0,0,0,0,0,0,384,0,0,0,32,0,0,0,0,4096,0,280,16385,0,32768,4113,0,0,0,0,0,1,2048,0,0,0,0,0,0,32768,4113,1024,0,0,0,0,0,0,0,0,0,0,0,0,32768,4113,0,0,6144,257,0,0,0,0,0,0,0,0,512,0,0,0,0,57344,901,64768,0,0,0,0,0,512,0,0,0,0,0,32,57344,901,64768,0,0,0,0,0,0,0,0,0,62480,511,0,0,64,0,0,24064,56,4048,0,0,0,0,0,0,0,0,57344,901,64768,0,0,0,16384,0,0,0,0,0,0,0,0,0,36,32,0,24064,56,0,0,34272,3,0,0,14430,0,0,57344,901,0,0,24064,56,0,0,34272,3,0,0,64,0,0,57344,901,0,0,24064,60,0,0,16384,0,0,0,1024,0,0,0,4,0,0,24064,56,0,0,0,0,0,0,0,0,0,0,65345,31,0,16384,0,2,0,0,0,0,0,61456,511,32,57344,901,0,0,4096,65520,8193,0,256,0,0,0,16,0,0,0,1,0,0,36864,65520,1,0,256,8191,0,0,288,0,0,57344,901,0,0,24064,56,0,0,0,0,0,0,0,0,0,0,64,0,0,24064,56,4048,0,0,0,0,0,14430,0,0,0,0,0,0,24064,56,0,0,34272,3,0,0,14430,0,0,57344,901,0,0,24064,56,0,0,34272,3,0,0,14430,0,0,57344,901,0,0,24064,56,0,0,34272,3,0,0,14430,0,0,57344,901,0,0,24064,56,0,0,0,0,1024,0,0,0,0,0,65281,15,0,4096,32752,0,0,256,511,0,0,61456,31,0,0,7937,0,0,4096,496,0,0,256,31,0,0,61456,1,0,0,3329,0,0,4096,0,0,0,256,0,0,0,53264,0,0,0,1,0,0,12288,65520,1,0,0,0,0,0,61456,511,0,0,24,0,0,0,0,0,0,34272,3,0,0,0,0,0,57344,901,64768,0,4096,65521,1,0,34272,3,253,0,0,0,0,0,65297,31,0,24064,56,0,0,34272,3,253,0,0,0,64,57344,901,0,0,0,0,32,0,256,8191,0,0,0,0,0,0,0,0,0,24064,56,4048,0,4352,8191,0,0,0,0,0,0,65297,31,0,2048,0,0,0,34272,3,0,0,0,0,64,0,0,0,0,36864,65520,1,0,2048,0,0,0,1024,0,0,0,0,0,2,24064,56,4048,0,0,0,0,0,0,0,64,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Start","Functions","Type","ReturnType","Operator","Expression","Expressions","Declaration","FunctionArgs","Declarations","Literal","Statement","Statements","Body","FunctionBody","Function","int","bool","intLit","boolLit","name","'['","']'","'('","')'","','","':'","';'","'!'","'*'","'-'","'/'","'%'","'+'","'>'","'<'","'>='","'<='","'=='","'!='","'&&'","'||'","'='","void","function","if","else","for","while","return","break","continue","bind","'->'","do","end","%eof"]
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

action_2 (48) = happyShift action_5
action_2 (19) = happyGoto action_4
action_2 _ = happyReduce_1

action_3 (60) = happyAccept
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

action_8 _ = happyReduce_37

action_9 (28) = happyShift action_14
action_9 (29) = happyShift action_15
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (30) = happyShift action_13
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (57) = happyShift action_12
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

action_14 (57) = happyShift action_17
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (24) = happyShift action_10
action_15 (11) = happyGoto action_16
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_36

action_17 (20) = happyShift action_19
action_17 (21) = happyShift action_20
action_17 (25) = happyShift action_21
action_17 (33) = happyShift action_22
action_17 (47) = happyShift action_25
action_17 (6) = happyGoto action_23
action_17 (7) = happyGoto action_29
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_35

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

action_24 (58) = happyShift action_26
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_9

action_26 (22) = happyShift action_40
action_26 (23) = happyShift action_41
action_26 (24) = happyShift action_42
action_26 (25) = happyShift action_43
action_26 (27) = happyShift action_44
action_26 (32) = happyShift action_45
action_26 (33) = happyShift action_46
action_26 (34) = happyShift action_47
action_26 (49) = happyShift action_48
action_26 (51) = happyShift action_49
action_26 (52) = happyShift action_50
action_26 (53) = happyShift action_51
action_26 (54) = happyShift action_52
action_26 (55) = happyShift action_53
action_26 (56) = happyShift action_54
action_26 (8) = happyGoto action_32
action_26 (9) = happyGoto action_33
action_26 (11) = happyGoto action_34
action_26 (13) = happyGoto action_35
action_26 (14) = happyGoto action_36
action_26 (15) = happyGoto action_37
action_26 (16) = happyGoto action_38
action_26 (18) = happyGoto action_39
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_7

action_28 (26) = happyShift action_31
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (58) = happyShift action_30
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (22) = happyShift action_40
action_30 (23) = happyShift action_41
action_30 (24) = happyShift action_42
action_30 (25) = happyShift action_43
action_30 (27) = happyShift action_44
action_30 (32) = happyShift action_45
action_30 (33) = happyShift action_46
action_30 (34) = happyShift action_47
action_30 (49) = happyShift action_48
action_30 (51) = happyShift action_49
action_30 (52) = happyShift action_50
action_30 (53) = happyShift action_51
action_30 (54) = happyShift action_52
action_30 (55) = happyShift action_53
action_30 (56) = happyShift action_54
action_30 (8) = happyGoto action_32
action_30 (9) = happyGoto action_33
action_30 (11) = happyGoto action_34
action_30 (13) = happyGoto action_35
action_30 (14) = happyGoto action_36
action_30 (15) = happyGoto action_37
action_30 (16) = happyGoto action_38
action_30 (18) = happyGoto action_92
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_6

action_32 _ = happyReduce_30

action_33 (25) = happyShift action_77
action_33 (31) = happyShift action_78
action_33 (33) = happyShift action_79
action_33 (34) = happyShift action_80
action_33 (35) = happyShift action_81
action_33 (36) = happyShift action_82
action_33 (37) = happyShift action_83
action_33 (38) = happyShift action_84
action_33 (39) = happyShift action_85
action_33 (40) = happyShift action_86
action_33 (41) = happyShift action_87
action_33 (42) = happyShift action_88
action_33 (43) = happyShift action_89
action_33 (44) = happyShift action_90
action_33 (45) = happyShift action_91
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (31) = happyShift action_76
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (22) = happyShift action_40
action_35 (23) = happyShift action_41
action_35 (24) = happyShift action_42
action_35 (25) = happyShift action_43
action_35 (27) = happyShift action_44
action_35 (32) = happyShift action_45
action_35 (33) = happyShift action_46
action_35 (34) = happyShift action_47
action_35 (49) = happyShift action_48
action_35 (51) = happyShift action_49
action_35 (52) = happyShift action_50
action_35 (53) = happyShift action_51
action_35 (54) = happyShift action_52
action_35 (55) = happyShift action_53
action_35 (56) = happyShift action_54
action_35 (8) = happyGoto action_32
action_35 (9) = happyGoto action_33
action_35 (11) = happyGoto action_74
action_35 (14) = happyGoto action_36
action_35 (15) = happyGoto action_37
action_35 (16) = happyGoto action_75
action_35 _ = happyFail (happyExpListPerState 35)

action_36 _ = happyReduce_28

action_37 _ = happyReduce_53

action_38 (22) = happyShift action_40
action_38 (23) = happyShift action_41
action_38 (24) = happyShift action_59
action_38 (25) = happyShift action_43
action_38 (27) = happyShift action_44
action_38 (32) = happyShift action_45
action_38 (33) = happyShift action_46
action_38 (34) = happyShift action_47
action_38 (49) = happyShift action_48
action_38 (51) = happyShift action_49
action_38 (52) = happyShift action_50
action_38 (53) = happyShift action_51
action_38 (54) = happyShift action_52
action_38 (55) = happyShift action_53
action_38 (56) = happyShift action_54
action_38 (8) = happyGoto action_32
action_38 (9) = happyGoto action_33
action_38 (14) = happyGoto action_36
action_38 (15) = happyGoto action_73
action_38 _ = happyReduce_56

action_39 (59) = happyShift action_72
action_39 _ = happyFail (happyExpListPerState 39)

action_40 _ = happyReduce_40

action_41 _ = happyReduce_41

action_42 (27) = happyShift action_70
action_42 (30) = happyShift action_13
action_42 (46) = happyShift action_71
action_42 _ = happyReduce_32

action_43 (22) = happyShift action_40
action_43 (23) = happyShift action_41
action_43 (24) = happyShift action_59
action_43 (25) = happyShift action_43
action_43 (27) = happyShift action_44
action_43 (32) = happyShift action_45
action_43 (33) = happyShift action_46
action_43 (34) = happyShift action_47
action_43 (8) = happyGoto action_32
action_43 (9) = happyGoto action_68
action_43 (10) = happyGoto action_69
action_43 (14) = happyGoto action_36
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (22) = happyShift action_40
action_44 (23) = happyShift action_41
action_44 (24) = happyShift action_59
action_44 (25) = happyShift action_43
action_44 (27) = happyShift action_44
action_44 (32) = happyShift action_45
action_44 (33) = happyShift action_46
action_44 (34) = happyShift action_47
action_44 (8) = happyGoto action_32
action_44 (9) = happyGoto action_67
action_44 (14) = happyGoto action_36
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (22) = happyShift action_40
action_45 (23) = happyShift action_41
action_45 (24) = happyShift action_59
action_45 (25) = happyShift action_43
action_45 (27) = happyShift action_44
action_45 (32) = happyShift action_45
action_45 (33) = happyShift action_46
action_45 (34) = happyShift action_47
action_45 (8) = happyGoto action_32
action_45 (9) = happyGoto action_66
action_45 (14) = happyGoto action_36
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (22) = happyShift action_40
action_46 (23) = happyShift action_41
action_46 (24) = happyShift action_59
action_46 (25) = happyShift action_43
action_46 (27) = happyShift action_44
action_46 (32) = happyShift action_45
action_46 (33) = happyShift action_46
action_46 (34) = happyShift action_47
action_46 (8) = happyGoto action_32
action_46 (9) = happyGoto action_65
action_46 (14) = happyGoto action_36
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (22) = happyShift action_40
action_47 (23) = happyShift action_41
action_47 (24) = happyShift action_59
action_47 (25) = happyShift action_43
action_47 (27) = happyShift action_44
action_47 (32) = happyShift action_45
action_47 (33) = happyShift action_46
action_47 (34) = happyShift action_47
action_47 (8) = happyGoto action_32
action_47 (9) = happyGoto action_64
action_47 (14) = happyGoto action_36
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (22) = happyShift action_40
action_48 (23) = happyShift action_41
action_48 (24) = happyShift action_59
action_48 (25) = happyShift action_43
action_48 (27) = happyShift action_44
action_48 (32) = happyShift action_45
action_48 (33) = happyShift action_46
action_48 (34) = happyShift action_47
action_48 (8) = happyGoto action_32
action_48 (9) = happyGoto action_63
action_48 (14) = happyGoto action_36
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (27) = happyShift action_62
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (22) = happyShift action_40
action_50 (23) = happyShift action_41
action_50 (24) = happyShift action_59
action_50 (25) = happyShift action_43
action_50 (27) = happyShift action_44
action_50 (32) = happyShift action_45
action_50 (33) = happyShift action_46
action_50 (34) = happyShift action_47
action_50 (8) = happyGoto action_32
action_50 (9) = happyGoto action_61
action_50 (14) = happyGoto action_36
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (22) = happyShift action_40
action_51 (23) = happyShift action_41
action_51 (24) = happyShift action_59
action_51 (25) = happyShift action_43
action_51 (27) = happyShift action_44
action_51 (31) = happyShift action_60
action_51 (32) = happyShift action_45
action_51 (33) = happyShift action_46
action_51 (34) = happyShift action_47
action_51 (8) = happyGoto action_32
action_51 (9) = happyGoto action_58
action_51 (14) = happyGoto action_36
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (31) = happyShift action_57
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (31) = happyShift action_56
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (27) = happyShift action_55
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (22) = happyShift action_40
action_55 (23) = happyShift action_41
action_55 (24) = happyShift action_59
action_55 (25) = happyShift action_43
action_55 (27) = happyShift action_44
action_55 (32) = happyShift action_45
action_55 (33) = happyShift action_46
action_55 (34) = happyShift action_47
action_55 (8) = happyGoto action_32
action_55 (9) = happyGoto action_118
action_55 (14) = happyGoto action_36
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_50

action_57 _ = happyReduce_49

action_58 (25) = happyShift action_77
action_58 (31) = happyShift action_117
action_58 (33) = happyShift action_79
action_58 (34) = happyShift action_80
action_58 (35) = happyShift action_81
action_58 (36) = happyShift action_82
action_58 (37) = happyShift action_83
action_58 (38) = happyShift action_84
action_58 (39) = happyShift action_85
action_58 (40) = happyShift action_86
action_58 (41) = happyShift action_87
action_58 (42) = happyShift action_88
action_58 (43) = happyShift action_89
action_58 (44) = happyShift action_90
action_58 (45) = happyShift action_91
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (27) = happyShift action_70
action_59 (46) = happyShift action_71
action_59 _ = happyReduce_32

action_60 _ = happyReduce_48

action_61 (25) = happyShift action_77
action_61 (33) = happyShift action_79
action_61 (34) = happyShift action_80
action_61 (35) = happyShift action_81
action_61 (36) = happyShift action_82
action_61 (37) = happyShift action_83
action_61 (38) = happyShift action_84
action_61 (39) = happyShift action_85
action_61 (40) = happyShift action_86
action_61 (41) = happyShift action_87
action_61 (42) = happyShift action_88
action_61 (43) = happyShift action_89
action_61 (44) = happyShift action_90
action_61 (45) = happyShift action_91
action_61 (58) = happyShift action_116
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (22) = happyShift action_40
action_62 (23) = happyShift action_41
action_62 (24) = happyShift action_59
action_62 (25) = happyShift action_43
action_62 (27) = happyShift action_44
action_62 (32) = happyShift action_45
action_62 (33) = happyShift action_46
action_62 (34) = happyShift action_47
action_62 (8) = happyGoto action_32
action_62 (9) = happyGoto action_115
action_62 (14) = happyGoto action_36
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (25) = happyShift action_77
action_63 (33) = happyShift action_79
action_63 (34) = happyShift action_80
action_63 (35) = happyShift action_81
action_63 (36) = happyShift action_82
action_63 (37) = happyShift action_83
action_63 (38) = happyShift action_84
action_63 (39) = happyShift action_85
action_63 (40) = happyShift action_86
action_63 (41) = happyShift action_87
action_63 (42) = happyShift action_88
action_63 (43) = happyShift action_89
action_63 (44) = happyShift action_90
action_63 (45) = happyShift action_91
action_63 (58) = happyShift action_114
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (25) = happyShift action_77
action_64 _ = happyReduce_25

action_65 (25) = happyShift action_77
action_65 _ = happyReduce_24

action_66 (25) = happyShift action_77
action_66 _ = happyReduce_23

action_67 (25) = happyShift action_77
action_67 (28) = happyShift action_113
action_67 (33) = happyShift action_79
action_67 (34) = happyShift action_80
action_67 (35) = happyShift action_81
action_67 (36) = happyShift action_82
action_67 (37) = happyShift action_83
action_67 (38) = happyShift action_84
action_67 (39) = happyShift action_85
action_67 (40) = happyShift action_86
action_67 (41) = happyShift action_87
action_67 (42) = happyShift action_88
action_67 (43) = happyShift action_89
action_67 (44) = happyShift action_90
action_67 (45) = happyShift action_91
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (25) = happyShift action_77
action_68 (33) = happyShift action_79
action_68 (34) = happyShift action_80
action_68 (35) = happyShift action_81
action_68 (36) = happyShift action_82
action_68 (37) = happyShift action_83
action_68 (38) = happyShift action_84
action_68 (39) = happyShift action_85
action_68 (40) = happyShift action_86
action_68 (41) = happyShift action_87
action_68 (42) = happyShift action_88
action_68 (43) = happyShift action_89
action_68 (44) = happyShift action_90
action_68 (45) = happyShift action_91
action_68 _ = happyReduce_34

action_69 (26) = happyShift action_111
action_69 (29) = happyShift action_112
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (22) = happyShift action_40
action_70 (23) = happyShift action_41
action_70 (24) = happyShift action_59
action_70 (25) = happyShift action_43
action_70 (27) = happyShift action_44
action_70 (32) = happyShift action_45
action_70 (33) = happyShift action_46
action_70 (34) = happyShift action_47
action_70 (8) = happyGoto action_32
action_70 (9) = happyGoto action_68
action_70 (10) = happyGoto action_110
action_70 (14) = happyGoto action_36
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (22) = happyShift action_40
action_71 (23) = happyShift action_41
action_71 (24) = happyShift action_59
action_71 (25) = happyShift action_43
action_71 (27) = happyShift action_44
action_71 (32) = happyShift action_45
action_71 (33) = happyShift action_46
action_71 (34) = happyShift action_47
action_71 (8) = happyGoto action_32
action_71 (9) = happyGoto action_109
action_71 (14) = happyGoto action_36
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_58

action_73 _ = happyReduce_52

action_74 (31) = happyShift action_108
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (22) = happyShift action_40
action_75 (23) = happyShift action_41
action_75 (24) = happyShift action_59
action_75 (25) = happyShift action_43
action_75 (27) = happyShift action_44
action_75 (32) = happyShift action_45
action_75 (33) = happyShift action_46
action_75 (34) = happyShift action_47
action_75 (49) = happyShift action_48
action_75 (51) = happyShift action_49
action_75 (52) = happyShift action_50
action_75 (53) = happyShift action_51
action_75 (54) = happyShift action_52
action_75 (55) = happyShift action_53
action_75 (56) = happyShift action_54
action_75 (8) = happyGoto action_32
action_75 (9) = happyGoto action_33
action_75 (14) = happyGoto action_36
action_75 (15) = happyGoto action_73
action_75 _ = happyReduce_55

action_76 _ = happyReduce_39

action_77 (22) = happyShift action_40
action_77 (23) = happyShift action_41
action_77 (24) = happyShift action_59
action_77 (25) = happyShift action_43
action_77 (27) = happyShift action_44
action_77 (32) = happyShift action_45
action_77 (33) = happyShift action_46
action_77 (34) = happyShift action_47
action_77 (8) = happyGoto action_32
action_77 (9) = happyGoto action_107
action_77 (14) = happyGoto action_36
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_45

action_79 (22) = happyShift action_40
action_79 (23) = happyShift action_41
action_79 (24) = happyShift action_59
action_79 (25) = happyShift action_43
action_79 (27) = happyShift action_44
action_79 (32) = happyShift action_45
action_79 (33) = happyShift action_46
action_79 (34) = happyShift action_47
action_79 (8) = happyGoto action_32
action_79 (9) = happyGoto action_106
action_79 (14) = happyGoto action_36
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (22) = happyShift action_40
action_80 (23) = happyShift action_41
action_80 (24) = happyShift action_59
action_80 (25) = happyShift action_43
action_80 (27) = happyShift action_44
action_80 (32) = happyShift action_45
action_80 (33) = happyShift action_46
action_80 (34) = happyShift action_47
action_80 (8) = happyGoto action_32
action_80 (9) = happyGoto action_105
action_80 (14) = happyGoto action_36
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (22) = happyShift action_40
action_81 (23) = happyShift action_41
action_81 (24) = happyShift action_59
action_81 (25) = happyShift action_43
action_81 (27) = happyShift action_44
action_81 (32) = happyShift action_45
action_81 (33) = happyShift action_46
action_81 (34) = happyShift action_47
action_81 (8) = happyGoto action_32
action_81 (9) = happyGoto action_104
action_81 (14) = happyGoto action_36
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (22) = happyShift action_40
action_82 (23) = happyShift action_41
action_82 (24) = happyShift action_59
action_82 (25) = happyShift action_43
action_82 (27) = happyShift action_44
action_82 (32) = happyShift action_45
action_82 (33) = happyShift action_46
action_82 (34) = happyShift action_47
action_82 (8) = happyGoto action_32
action_82 (9) = happyGoto action_103
action_82 (14) = happyGoto action_36
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (22) = happyShift action_40
action_83 (23) = happyShift action_41
action_83 (24) = happyShift action_59
action_83 (25) = happyShift action_43
action_83 (27) = happyShift action_44
action_83 (32) = happyShift action_45
action_83 (33) = happyShift action_46
action_83 (34) = happyShift action_47
action_83 (8) = happyGoto action_32
action_83 (9) = happyGoto action_102
action_83 (14) = happyGoto action_36
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (22) = happyShift action_40
action_84 (23) = happyShift action_41
action_84 (24) = happyShift action_59
action_84 (25) = happyShift action_43
action_84 (27) = happyShift action_44
action_84 (32) = happyShift action_45
action_84 (33) = happyShift action_46
action_84 (34) = happyShift action_47
action_84 (8) = happyGoto action_32
action_84 (9) = happyGoto action_101
action_84 (14) = happyGoto action_36
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (22) = happyShift action_40
action_85 (23) = happyShift action_41
action_85 (24) = happyShift action_59
action_85 (25) = happyShift action_43
action_85 (27) = happyShift action_44
action_85 (32) = happyShift action_45
action_85 (33) = happyShift action_46
action_85 (34) = happyShift action_47
action_85 (8) = happyGoto action_32
action_85 (9) = happyGoto action_100
action_85 (14) = happyGoto action_36
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (22) = happyShift action_40
action_86 (23) = happyShift action_41
action_86 (24) = happyShift action_59
action_86 (25) = happyShift action_43
action_86 (27) = happyShift action_44
action_86 (32) = happyShift action_45
action_86 (33) = happyShift action_46
action_86 (34) = happyShift action_47
action_86 (8) = happyGoto action_32
action_86 (9) = happyGoto action_99
action_86 (14) = happyGoto action_36
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (22) = happyShift action_40
action_87 (23) = happyShift action_41
action_87 (24) = happyShift action_59
action_87 (25) = happyShift action_43
action_87 (27) = happyShift action_44
action_87 (32) = happyShift action_45
action_87 (33) = happyShift action_46
action_87 (34) = happyShift action_47
action_87 (8) = happyGoto action_32
action_87 (9) = happyGoto action_98
action_87 (14) = happyGoto action_36
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (22) = happyShift action_40
action_88 (23) = happyShift action_41
action_88 (24) = happyShift action_59
action_88 (25) = happyShift action_43
action_88 (27) = happyShift action_44
action_88 (32) = happyShift action_45
action_88 (33) = happyShift action_46
action_88 (34) = happyShift action_47
action_88 (8) = happyGoto action_32
action_88 (9) = happyGoto action_97
action_88 (14) = happyGoto action_36
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (22) = happyShift action_40
action_89 (23) = happyShift action_41
action_89 (24) = happyShift action_59
action_89 (25) = happyShift action_43
action_89 (27) = happyShift action_44
action_89 (32) = happyShift action_45
action_89 (33) = happyShift action_46
action_89 (34) = happyShift action_47
action_89 (8) = happyGoto action_32
action_89 (9) = happyGoto action_96
action_89 (14) = happyGoto action_36
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (22) = happyShift action_40
action_90 (23) = happyShift action_41
action_90 (24) = happyShift action_59
action_90 (25) = happyShift action_43
action_90 (27) = happyShift action_44
action_90 (32) = happyShift action_45
action_90 (33) = happyShift action_46
action_90 (34) = happyShift action_47
action_90 (8) = happyGoto action_32
action_90 (9) = happyGoto action_95
action_90 (14) = happyGoto action_36
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (22) = happyShift action_40
action_91 (23) = happyShift action_41
action_91 (24) = happyShift action_59
action_91 (25) = happyShift action_43
action_91 (27) = happyShift action_44
action_91 (32) = happyShift action_45
action_91 (33) = happyShift action_46
action_91 (34) = happyShift action_47
action_91 (8) = happyGoto action_32
action_91 (9) = happyGoto action_94
action_91 (14) = happyGoto action_36
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (59) = happyShift action_93
action_92 _ = happyFail (happyExpListPerState 92)

action_93 _ = happyReduce_57

action_94 (25) = happyShift action_77
action_94 (33) = happyShift action_79
action_94 (34) = happyShift action_80
action_94 (35) = happyShift action_81
action_94 (36) = happyShift action_82
action_94 (37) = happyShift action_83
action_94 (38) = happyShift action_84
action_94 (39) = happyShift action_85
action_94 (40) = happyShift action_86
action_94 (41) = happyShift action_87
action_94 (42) = happyShift action_88
action_94 (43) = happyShift action_89
action_94 (44) = happyShift action_90
action_94 _ = happyReduce_22

action_95 (25) = happyShift action_77
action_95 (33) = happyShift action_79
action_95 (34) = happyShift action_80
action_95 (35) = happyShift action_81
action_95 (36) = happyShift action_82
action_95 (37) = happyShift action_83
action_95 (38) = happyShift action_84
action_95 (39) = happyShift action_85
action_95 (40) = happyShift action_86
action_95 (41) = happyShift action_87
action_95 (42) = happyShift action_88
action_95 (43) = happyShift action_89
action_95 _ = happyReduce_21

action_96 (25) = happyShift action_77
action_96 (33) = happyShift action_79
action_96 (34) = happyShift action_80
action_96 (35) = happyShift action_81
action_96 (36) = happyShift action_82
action_96 (37) = happyShift action_83
action_96 (38) = happyShift action_84
action_96 (39) = happyShift action_85
action_96 (40) = happyShift action_86
action_96 (41) = happyShift action_87
action_96 _ = happyReduce_20

action_97 (25) = happyShift action_77
action_97 (33) = happyShift action_79
action_97 (34) = happyShift action_80
action_97 (35) = happyShift action_81
action_97 (36) = happyShift action_82
action_97 (37) = happyShift action_83
action_97 (38) = happyShift action_84
action_97 (39) = happyShift action_85
action_97 (40) = happyShift action_86
action_97 (41) = happyShift action_87
action_97 _ = happyReduce_19

action_98 (25) = happyShift action_77
action_98 (33) = happyShift action_79
action_98 (34) = happyShift action_80
action_98 (35) = happyShift action_81
action_98 (36) = happyShift action_82
action_98 (37) = happyShift action_83
action_98 _ = happyReduce_16

action_99 (25) = happyShift action_77
action_99 (33) = happyShift action_79
action_99 (34) = happyShift action_80
action_99 (35) = happyShift action_81
action_99 (36) = happyShift action_82
action_99 (37) = happyShift action_83
action_99 _ = happyReduce_18

action_100 (25) = happyShift action_77
action_100 (33) = happyShift action_79
action_100 (34) = happyShift action_80
action_100 (35) = happyShift action_81
action_100 (36) = happyShift action_82
action_100 (37) = happyShift action_83
action_100 _ = happyReduce_15

action_101 (25) = happyShift action_77
action_101 (33) = happyShift action_79
action_101 (34) = happyShift action_80
action_101 (35) = happyShift action_81
action_101 (36) = happyShift action_82
action_101 (37) = happyShift action_83
action_101 _ = happyReduce_17

action_102 (25) = happyShift action_77
action_102 (33) = happyShift action_79
action_102 (35) = happyShift action_81
action_102 (36) = happyShift action_82
action_102 _ = happyReduce_12

action_103 (25) = happyShift action_77
action_103 _ = happyReduce_14

action_104 (25) = happyShift action_77
action_104 _ = happyReduce_13

action_105 (25) = happyShift action_77
action_105 (33) = happyShift action_79
action_105 (35) = happyShift action_81
action_105 (36) = happyShift action_82
action_105 _ = happyReduce_11

action_106 (25) = happyShift action_77
action_106 _ = happyReduce_10

action_107 (25) = happyShift action_77
action_107 (26) = happyShift action_126
action_107 (33) = happyShift action_79
action_107 (34) = happyShift action_80
action_107 (35) = happyShift action_81
action_107 (36) = happyShift action_82
action_107 (37) = happyShift action_83
action_107 (38) = happyShift action_84
action_107 (39) = happyShift action_85
action_107 (40) = happyShift action_86
action_107 (41) = happyShift action_87
action_107 (42) = happyShift action_88
action_107 (43) = happyShift action_89
action_107 (44) = happyShift action_90
action_107 (45) = happyShift action_91
action_107 _ = happyFail (happyExpListPerState 107)

action_108 _ = happyReduce_38

action_109 (25) = happyShift action_77
action_109 (33) = happyShift action_79
action_109 (34) = happyShift action_80
action_109 (35) = happyShift action_81
action_109 (36) = happyShift action_82
action_109 (37) = happyShift action_83
action_109 (38) = happyShift action_84
action_109 (39) = happyShift action_85
action_109 (40) = happyShift action_86
action_109 (41) = happyShift action_87
action_109 (42) = happyShift action_88
action_109 (43) = happyShift action_89
action_109 (44) = happyShift action_90
action_109 (45) = happyShift action_91
action_109 _ = happyReduce_26

action_110 (28) = happyShift action_125
action_110 (29) = happyShift action_112
action_110 _ = happyFail (happyExpListPerState 110)

action_111 _ = happyReduce_42

action_112 (22) = happyShift action_40
action_112 (23) = happyShift action_41
action_112 (24) = happyShift action_59
action_112 (25) = happyShift action_43
action_112 (27) = happyShift action_44
action_112 (32) = happyShift action_45
action_112 (33) = happyShift action_46
action_112 (34) = happyShift action_47
action_112 (8) = happyGoto action_32
action_112 (9) = happyGoto action_124
action_112 (14) = happyGoto action_36
action_112 _ = happyFail (happyExpListPerState 112)

action_113 _ = happyReduce_31

action_114 (22) = happyShift action_40
action_114 (23) = happyShift action_41
action_114 (24) = happyShift action_59
action_114 (25) = happyShift action_43
action_114 (27) = happyShift action_44
action_114 (32) = happyShift action_45
action_114 (33) = happyShift action_46
action_114 (34) = happyShift action_47
action_114 (49) = happyShift action_48
action_114 (51) = happyShift action_49
action_114 (52) = happyShift action_50
action_114 (53) = happyShift action_51
action_114 (54) = happyShift action_52
action_114 (55) = happyShift action_53
action_114 (56) = happyShift action_54
action_114 (8) = happyGoto action_32
action_114 (9) = happyGoto action_33
action_114 (14) = happyGoto action_36
action_114 (15) = happyGoto action_37
action_114 (16) = happyGoto action_120
action_114 (17) = happyGoto action_123
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (25) = happyShift action_77
action_115 (29) = happyShift action_122
action_115 (33) = happyShift action_79
action_115 (34) = happyShift action_80
action_115 (35) = happyShift action_81
action_115 (36) = happyShift action_82
action_115 (37) = happyShift action_83
action_115 (38) = happyShift action_84
action_115 (39) = happyShift action_85
action_115 (40) = happyShift action_86
action_115 (41) = happyShift action_87
action_115 (42) = happyShift action_88
action_115 (43) = happyShift action_89
action_115 (44) = happyShift action_90
action_115 (45) = happyShift action_91
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (22) = happyShift action_40
action_116 (23) = happyShift action_41
action_116 (24) = happyShift action_59
action_116 (25) = happyShift action_43
action_116 (27) = happyShift action_44
action_116 (32) = happyShift action_45
action_116 (33) = happyShift action_46
action_116 (34) = happyShift action_47
action_116 (49) = happyShift action_48
action_116 (51) = happyShift action_49
action_116 (52) = happyShift action_50
action_116 (53) = happyShift action_51
action_116 (54) = happyShift action_52
action_116 (55) = happyShift action_53
action_116 (56) = happyShift action_54
action_116 (8) = happyGoto action_32
action_116 (9) = happyGoto action_33
action_116 (14) = happyGoto action_36
action_116 (15) = happyGoto action_37
action_116 (16) = happyGoto action_120
action_116 (17) = happyGoto action_121
action_116 _ = happyFail (happyExpListPerState 116)

action_117 _ = happyReduce_47

action_118 (25) = happyShift action_77
action_118 (29) = happyShift action_119
action_118 (33) = happyShift action_79
action_118 (34) = happyShift action_80
action_118 (35) = happyShift action_81
action_118 (36) = happyShift action_82
action_118 (37) = happyShift action_83
action_118 (38) = happyShift action_84
action_118 (39) = happyShift action_85
action_118 (40) = happyShift action_86
action_118 (41) = happyShift action_87
action_118 (42) = happyShift action_88
action_118 (43) = happyShift action_89
action_118 (44) = happyShift action_90
action_118 (45) = happyShift action_91
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (22) = happyShift action_40
action_119 (23) = happyShift action_41
action_119 (24) = happyShift action_59
action_119 (25) = happyShift action_43
action_119 (27) = happyShift action_44
action_119 (32) = happyShift action_45
action_119 (33) = happyShift action_46
action_119 (34) = happyShift action_47
action_119 (8) = happyGoto action_32
action_119 (9) = happyGoto action_130
action_119 (14) = happyGoto action_36
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (22) = happyShift action_40
action_120 (23) = happyShift action_41
action_120 (24) = happyShift action_59
action_120 (25) = happyShift action_43
action_120 (27) = happyShift action_44
action_120 (32) = happyShift action_45
action_120 (33) = happyShift action_46
action_120 (34) = happyShift action_47
action_120 (49) = happyShift action_48
action_120 (51) = happyShift action_49
action_120 (52) = happyShift action_50
action_120 (53) = happyShift action_51
action_120 (54) = happyShift action_52
action_120 (55) = happyShift action_53
action_120 (56) = happyShift action_54
action_120 (8) = happyGoto action_32
action_120 (9) = happyGoto action_33
action_120 (14) = happyGoto action_36
action_120 (15) = happyGoto action_73
action_120 _ = happyReduce_54

action_121 (59) = happyShift action_129
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (22) = happyShift action_40
action_122 (23) = happyShift action_41
action_122 (24) = happyShift action_59
action_122 (25) = happyShift action_43
action_122 (27) = happyShift action_44
action_122 (32) = happyShift action_45
action_122 (33) = happyShift action_46
action_122 (34) = happyShift action_47
action_122 (8) = happyGoto action_32
action_122 (9) = happyGoto action_128
action_122 (14) = happyGoto action_36
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (50) = happyShift action_127
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (25) = happyShift action_77
action_124 (33) = happyShift action_79
action_124 (34) = happyShift action_80
action_124 (35) = happyShift action_81
action_124 (36) = happyShift action_82
action_124 (37) = happyShift action_83
action_124 (38) = happyShift action_84
action_124 (39) = happyShift action_85
action_124 (40) = happyShift action_86
action_124 (41) = happyShift action_87
action_124 (42) = happyShift action_88
action_124 (43) = happyShift action_89
action_124 (44) = happyShift action_90
action_124 (45) = happyShift action_91
action_124 _ = happyReduce_33

action_125 _ = happyReduce_29

action_126 _ = happyReduce_27

action_127 (22) = happyShift action_40
action_127 (23) = happyShift action_41
action_127 (24) = happyShift action_59
action_127 (25) = happyShift action_43
action_127 (27) = happyShift action_44
action_127 (32) = happyShift action_45
action_127 (33) = happyShift action_46
action_127 (34) = happyShift action_47
action_127 (49) = happyShift action_48
action_127 (51) = happyShift action_49
action_127 (52) = happyShift action_50
action_127 (53) = happyShift action_51
action_127 (54) = happyShift action_52
action_127 (55) = happyShift action_53
action_127 (56) = happyShift action_54
action_127 (8) = happyGoto action_32
action_127 (9) = happyGoto action_33
action_127 (14) = happyGoto action_36
action_127 (15) = happyGoto action_37
action_127 (16) = happyGoto action_120
action_127 (17) = happyGoto action_133
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (25) = happyShift action_77
action_128 (29) = happyShift action_132
action_128 (33) = happyShift action_79
action_128 (34) = happyShift action_80
action_128 (35) = happyShift action_81
action_128 (36) = happyShift action_82
action_128 (37) = happyShift action_83
action_128 (38) = happyShift action_84
action_128 (39) = happyShift action_85
action_128 (40) = happyShift action_86
action_128 (41) = happyShift action_87
action_128 (42) = happyShift action_88
action_128 (43) = happyShift action_89
action_128 (44) = happyShift action_90
action_128 (45) = happyShift action_91
action_128 _ = happyFail (happyExpListPerState 128)

action_129 _ = happyReduce_46

action_130 (25) = happyShift action_77
action_130 (29) = happyShift action_131
action_130 (33) = happyShift action_79
action_130 (34) = happyShift action_80
action_130 (35) = happyShift action_81
action_130 (36) = happyShift action_82
action_130 (37) = happyShift action_83
action_130 (38) = happyShift action_84
action_130 (39) = happyShift action_85
action_130 (40) = happyShift action_86
action_130 (41) = happyShift action_87
action_130 (42) = happyShift action_88
action_130 (43) = happyShift action_89
action_130 (44) = happyShift action_90
action_130 (45) = happyShift action_91
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (24) = happyShift action_136
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (22) = happyShift action_40
action_132 (23) = happyShift action_41
action_132 (24) = happyShift action_59
action_132 (25) = happyShift action_43
action_132 (27) = happyShift action_44
action_132 (32) = happyShift action_45
action_132 (33) = happyShift action_46
action_132 (34) = happyShift action_47
action_132 (8) = happyGoto action_32
action_132 (9) = happyGoto action_135
action_132 (14) = happyGoto action_36
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (59) = happyShift action_134
action_133 _ = happyFail (happyExpListPerState 133)

action_134 _ = happyReduce_43

action_135 (25) = happyShift action_77
action_135 (28) = happyShift action_138
action_135 (33) = happyShift action_79
action_135 (34) = happyShift action_80
action_135 (35) = happyShift action_81
action_135 (36) = happyShift action_82
action_135 (37) = happyShift action_83
action_135 (38) = happyShift action_84
action_135 (39) = happyShift action_85
action_135 (40) = happyShift action_86
action_135 (41) = happyShift action_87
action_135 (42) = happyShift action_88
action_135 (43) = happyShift action_89
action_135 (44) = happyShift action_90
action_135 (45) = happyShift action_91
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (28) = happyShift action_137
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (31) = happyShift action_140
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (58) = happyShift action_139
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (22) = happyShift action_40
action_139 (23) = happyShift action_41
action_139 (24) = happyShift action_59
action_139 (25) = happyShift action_43
action_139 (27) = happyShift action_44
action_139 (32) = happyShift action_45
action_139 (33) = happyShift action_46
action_139 (34) = happyShift action_47
action_139 (49) = happyShift action_48
action_139 (51) = happyShift action_49
action_139 (52) = happyShift action_50
action_139 (53) = happyShift action_51
action_139 (54) = happyShift action_52
action_139 (55) = happyShift action_53
action_139 (56) = happyShift action_54
action_139 (8) = happyGoto action_32
action_139 (9) = happyGoto action_33
action_139 (14) = happyGoto action_36
action_139 (15) = happyGoto action_37
action_139 (16) = happyGoto action_120
action_139 (17) = happyGoto action_141
action_139 _ = happyFail (happyExpListPerState 139)

action_140 _ = happyReduce_51

action_141 (59) = happyShift action_142
action_141 _ = happyFail (happyExpListPerState 141)

action_142 _ = happyReduce_44

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (AST (reverse happy_var_1)
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

happyReduce_45 = happySpecReduce_2  15 happyReduction_45
happyReduction_45 _
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn15
		 (ExpressionStatement happy_var_1
	)
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 = happyReduce 5 15 happyReduction_46
happyReduction_46 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (WhileStatement happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_47 = happySpecReduce_3  15 happyReduction_47
happyReduction_47 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (ReturnStatement happy_var_2
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_2  15 happyReduction_48
happyReduction_48 _
	_
	 =  HappyAbsSyn15
		 (VoidReturnStatement
	)

happyReduce_49 = happySpecReduce_2  15 happyReduction_49
happyReduction_49 _
	_
	 =  HappyAbsSyn15
		 (BreakStatement
	)

happyReduce_50 = happySpecReduce_2  15 happyReduction_50
happyReduction_50 _
	_
	 =  HappyAbsSyn15
		 (ContinueStatement
	)

happyReduce_51 = happyReduce 9 15 happyReduction_51
happyReduction_51 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexeme _ (TokenId happy_var_7))) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (BindStatement happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

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
		 (Body happy_var_1
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

happyReduce_57 = happyReduce 10 19 happyReduction_57
happyReduction_57 (_ `HappyStk`
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
		 (Function happy_var_2 (reverse happy_var_4) happy_var_7 happy_var_9
	) `HappyStk` happyRest

happyReduce_58 = happyReduce 9 19 happyReduction_58
happyReduction_58 (_ `HappyStk`
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
	Lexeme _ TokenEOF -> action 60 60 tk (HappyState action) sts stk;
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
	Lexeme _ TokenBind -> cont 56;
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
