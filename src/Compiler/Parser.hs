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

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,377) ([0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,256,0,0,0,32,0,0,4096,1,0,0,0,0,0,0,48,0,0,0,1,0,0,0,0,16,35840,128,32,0,560,2,0,0,0,0,4,4096,0,0,0,0,0,0,12288,514,128,0,0,0,0,0,0,0,0,0,0,0,0,560,2,0,49152,2056,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,512,0,0,0,0,0,0,0,0,2048,0,0,0,1,64000,0,0,0,4096,0,0,0,0,0,0,0,0,2048,0,0,0,7215,0,0,32768,0,0,0,49904,1,0,49152,1931,0,0,0,2,0,0,2048,0,0,16384,0,16000,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,65530,0,0,0,0,0,0,0,0,0,0,0,0,0,32,256,0,48128,112,0,0,49904,1,0,0,0,0,0,12032,28,0,0,28860,0,0,61440,450,0,0,0,16382,512,0,7215,0,0,0,65504,8195,0,49904,1,0,0,65024,63,0,49152,0,0,0,28860,0,0,61440,450,0,0,3008,7,0,0,7215,0,0,48128,112,0,0,49904,1,0,49152,1803,0,0,12032,28,0,0,28860,0,0,61440,450,0,0,3008,7,0,0,7215,0,0,48128,112,0,0,0,0,0,0,65056,63,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63552,255,0,16384,2,0,0,49904,1,0,49152,1803,0,0,0,0,0,0,57344,1023,0,0,12,0,0,0,0,0,0,7215,0,0,0,0,0,0,64,32768,62,0,0,0,4,12032,28,0,0,0,16384,0,0,65408,7,0,0,4094,0,0,63488,15,0,0,16352,0,0,32768,15,0,0,15872,0,0,0,248,0,0,57344,3,0,0,1664,0,0,0,0,0,0,0,0,0,0,416,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,65416,15,0,0,0,0,0,63488,255,0,0,0,0,0,49904,1,0,0,0,0,4,0,0,0,0,57600,1023,0,0,0,32768,0,0,0,0,0,0,0,16,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Start","Functions","Type","ReturnType","Operator","Expression","Expressions","Declaration","Declarations","Literal","Statement","Statements","Body","FunctionBody","Function","int","bool","intLit","boolLit","name","'['","']'","'('","')'","','","':'","';'","'!'","'*'","'-'","'/'","'%'","'+'","'>'","'<'","'>='","'<='","'=='","'!='","'&&'","'||'","'='","void","function","if","else","for","while","return","break","continue","'->'","do","end","%eof"]
        bit_start = st Prelude.* 58
        bit_end = (st Prelude.+ 1) Prelude.* 58
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..57]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_2
action_0 _ = happyReduce_3

action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (47) = happyShift action_5
action_2 (18) = happyGoto action_4
action_2 _ = happyReduce_1

action_3 (58) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_2

action_5 (23) = happyShift action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (26) = happyShift action_7
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (23) = happyShift action_10
action_7 (27) = happyShift action_11
action_7 (11) = happyGoto action_8
action_7 (12) = happyGoto action_9
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_35

action_9 (27) = happyShift action_14
action_9 (28) = happyShift action_15
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (29) = happyShift action_13
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (55) = happyShift action_12
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (19) = happyShift action_19
action_12 (20) = happyShift action_20
action_12 (24) = happyShift action_21
action_12 (32) = happyShift action_22
action_12 (46) = happyShift action_25
action_12 (6) = happyGoto action_23
action_12 (7) = happyGoto action_24
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (19) = happyShift action_19
action_13 (20) = happyShift action_20
action_13 (24) = happyShift action_21
action_13 (32) = happyShift action_22
action_13 (6) = happyGoto action_18
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (55) = happyShift action_17
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (23) = happyShift action_10
action_15 (11) = happyGoto action_16
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_34

action_17 (19) = happyShift action_19
action_17 (20) = happyShift action_20
action_17 (24) = happyShift action_21
action_17 (32) = happyShift action_22
action_17 (46) = happyShift action_25
action_17 (6) = happyGoto action_23
action_17 (7) = happyGoto action_29
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_33

action_19 _ = happyReduce_4

action_20 _ = happyReduce_5

action_21 (19) = happyShift action_19
action_21 (20) = happyShift action_20
action_21 (24) = happyShift action_21
action_21 (32) = happyShift action_22
action_21 (6) = happyGoto action_28
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (19) = happyShift action_19
action_22 (20) = happyShift action_20
action_22 (24) = happyShift action_21
action_22 (32) = happyShift action_22
action_22 (6) = happyGoto action_27
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_8

action_24 (56) = happyShift action_26
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_9

action_26 (23) = happyShift action_10
action_26 (11) = happyGoto action_8
action_26 (12) = happyGoto action_32
action_26 (15) = happyGoto action_33
action_26 (17) = happyGoto action_34
action_26 _ = happyReduce_47

action_27 _ = happyReduce_7

action_28 (25) = happyShift action_31
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (56) = happyShift action_30
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (23) = happyShift action_10
action_30 (11) = happyGoto action_8
action_30 (12) = happyGoto action_32
action_30 (15) = happyGoto action_33
action_30 (17) = happyGoto action_45
action_30 _ = happyReduce_47

action_31 _ = happyReduce_6

action_32 (28) = happyShift action_15
action_32 (15) = happyGoto action_44
action_32 _ = happyReduce_47

action_33 (23) = happyShift action_37
action_33 (48) = happyShift action_38
action_33 (50) = happyShift action_39
action_33 (51) = happyShift action_40
action_33 (52) = happyShift action_41
action_33 (53) = happyShift action_42
action_33 (54) = happyShift action_43
action_33 (14) = happyGoto action_36
action_33 _ = happyReduce_51

action_34 (57) = happyShift action_35
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_53

action_36 _ = happyReduce_48

action_37 (26) = happyShift action_64
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (21) = happyShift action_52
action_38 (22) = happyShift action_53
action_38 (23) = happyShift action_54
action_38 (24) = happyShift action_55
action_38 (26) = happyShift action_56
action_38 (31) = happyShift action_58
action_38 (32) = happyShift action_59
action_38 (33) = happyShift action_60
action_38 (8) = happyGoto action_49
action_38 (9) = happyGoto action_63
action_38 (13) = happyGoto action_51
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (26) = happyShift action_62
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (21) = happyShift action_52
action_40 (22) = happyShift action_53
action_40 (23) = happyShift action_54
action_40 (24) = happyShift action_55
action_40 (26) = happyShift action_56
action_40 (31) = happyShift action_58
action_40 (32) = happyShift action_59
action_40 (33) = happyShift action_60
action_40 (8) = happyGoto action_49
action_40 (9) = happyGoto action_61
action_40 (13) = happyGoto action_51
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (21) = happyShift action_52
action_41 (22) = happyShift action_53
action_41 (23) = happyShift action_54
action_41 (24) = happyShift action_55
action_41 (26) = happyShift action_56
action_41 (30) = happyShift action_57
action_41 (31) = happyShift action_58
action_41 (32) = happyShift action_59
action_41 (33) = happyShift action_60
action_41 (8) = happyGoto action_49
action_41 (9) = happyGoto action_50
action_41 (13) = happyGoto action_51
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (30) = happyShift action_48
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (30) = happyShift action_47
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (23) = happyShift action_37
action_44 (48) = happyShift action_38
action_44 (50) = happyShift action_39
action_44 (51) = happyShift action_40
action_44 (52) = happyShift action_41
action_44 (53) = happyShift action_42
action_44 (54) = happyShift action_43
action_44 (14) = happyGoto action_36
action_44 _ = happyReduce_50

action_45 (57) = happyShift action_46
action_45 _ = happyFail (happyExpListPerState 45)

action_46 _ = happyReduce_52

action_47 _ = happyReduce_46

action_48 _ = happyReduce_45

action_49 _ = happyReduce_29

action_50 (30) = happyShift action_90
action_50 (32) = happyShift action_67
action_50 (33) = happyShift action_68
action_50 (34) = happyShift action_69
action_50 (35) = happyShift action_70
action_50 (36) = happyShift action_71
action_50 (37) = happyShift action_72
action_50 (38) = happyShift action_73
action_50 (39) = happyShift action_74
action_50 (40) = happyShift action_75
action_50 (41) = happyShift action_76
action_50 (42) = happyShift action_77
action_50 (43) = happyShift action_78
action_50 (44) = happyShift action_79
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_27

action_52 _ = happyReduce_36

action_53 _ = happyReduce_37

action_54 (26) = happyShift action_88
action_54 (45) = happyShift action_89
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (21) = happyShift action_52
action_55 (22) = happyShift action_53
action_55 (23) = happyShift action_54
action_55 (24) = happyShift action_55
action_55 (26) = happyShift action_56
action_55 (31) = happyShift action_58
action_55 (32) = happyShift action_59
action_55 (33) = happyShift action_60
action_55 (8) = happyGoto action_49
action_55 (9) = happyGoto action_65
action_55 (10) = happyGoto action_87
action_55 (13) = happyGoto action_51
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (21) = happyShift action_52
action_56 (22) = happyShift action_53
action_56 (23) = happyShift action_54
action_56 (24) = happyShift action_55
action_56 (26) = happyShift action_56
action_56 (31) = happyShift action_58
action_56 (32) = happyShift action_59
action_56 (33) = happyShift action_60
action_56 (8) = happyGoto action_49
action_56 (9) = happyGoto action_86
action_56 (13) = happyGoto action_51
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_44

action_58 (21) = happyShift action_52
action_58 (22) = happyShift action_53
action_58 (23) = happyShift action_54
action_58 (24) = happyShift action_55
action_58 (26) = happyShift action_56
action_58 (31) = happyShift action_58
action_58 (32) = happyShift action_59
action_58 (33) = happyShift action_60
action_58 (8) = happyGoto action_49
action_58 (9) = happyGoto action_85
action_58 (13) = happyGoto action_51
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (21) = happyShift action_52
action_59 (22) = happyShift action_53
action_59 (23) = happyShift action_54
action_59 (24) = happyShift action_55
action_59 (26) = happyShift action_56
action_59 (31) = happyShift action_58
action_59 (32) = happyShift action_59
action_59 (33) = happyShift action_60
action_59 (8) = happyGoto action_49
action_59 (9) = happyGoto action_84
action_59 (13) = happyGoto action_51
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (21) = happyShift action_52
action_60 (22) = happyShift action_53
action_60 (23) = happyShift action_54
action_60 (24) = happyShift action_55
action_60 (26) = happyShift action_56
action_60 (31) = happyShift action_58
action_60 (32) = happyShift action_59
action_60 (33) = happyShift action_60
action_60 (8) = happyGoto action_49
action_60 (9) = happyGoto action_83
action_60 (13) = happyGoto action_51
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (32) = happyShift action_67
action_61 (33) = happyShift action_68
action_61 (34) = happyShift action_69
action_61 (35) = happyShift action_70
action_61 (36) = happyShift action_71
action_61 (37) = happyShift action_72
action_61 (38) = happyShift action_73
action_61 (39) = happyShift action_74
action_61 (40) = happyShift action_75
action_61 (41) = happyShift action_76
action_61 (42) = happyShift action_77
action_61 (43) = happyShift action_78
action_61 (44) = happyShift action_79
action_61 (56) = happyShift action_82
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (21) = happyShift action_52
action_62 (22) = happyShift action_53
action_62 (23) = happyShift action_54
action_62 (24) = happyShift action_55
action_62 (26) = happyShift action_56
action_62 (31) = happyShift action_58
action_62 (32) = happyShift action_59
action_62 (33) = happyShift action_60
action_62 (8) = happyGoto action_49
action_62 (9) = happyGoto action_81
action_62 (13) = happyGoto action_51
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (32) = happyShift action_67
action_63 (33) = happyShift action_68
action_63 (34) = happyShift action_69
action_63 (35) = happyShift action_70
action_63 (36) = happyShift action_71
action_63 (37) = happyShift action_72
action_63 (38) = happyShift action_73
action_63 (39) = happyShift action_74
action_63 (40) = happyShift action_75
action_63 (41) = happyShift action_76
action_63 (42) = happyShift action_77
action_63 (43) = happyShift action_78
action_63 (44) = happyShift action_79
action_63 (56) = happyShift action_80
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (21) = happyShift action_52
action_64 (22) = happyShift action_53
action_64 (23) = happyShift action_54
action_64 (24) = happyShift action_55
action_64 (26) = happyShift action_56
action_64 (31) = happyShift action_58
action_64 (32) = happyShift action_59
action_64 (33) = happyShift action_60
action_64 (8) = happyGoto action_49
action_64 (9) = happyGoto action_65
action_64 (10) = happyGoto action_66
action_64 (13) = happyGoto action_51
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (32) = happyShift action_67
action_65 (33) = happyShift action_68
action_65 (34) = happyShift action_69
action_65 (35) = happyShift action_70
action_65 (36) = happyShift action_71
action_65 (37) = happyShift action_72
action_65 (38) = happyShift action_73
action_65 (39) = happyShift action_74
action_65 (40) = happyShift action_75
action_65 (41) = happyShift action_76
action_65 (42) = happyShift action_77
action_65 (43) = happyShift action_78
action_65 (44) = happyShift action_79
action_65 _ = happyReduce_32

action_66 (27) = happyShift action_113
action_66 (28) = happyShift action_94
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (21) = happyShift action_52
action_67 (22) = happyShift action_53
action_67 (23) = happyShift action_54
action_67 (24) = happyShift action_55
action_67 (26) = happyShift action_56
action_67 (31) = happyShift action_58
action_67 (32) = happyShift action_59
action_67 (33) = happyShift action_60
action_67 (8) = happyGoto action_49
action_67 (9) = happyGoto action_112
action_67 (13) = happyGoto action_51
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (21) = happyShift action_52
action_68 (22) = happyShift action_53
action_68 (23) = happyShift action_54
action_68 (24) = happyShift action_55
action_68 (26) = happyShift action_56
action_68 (31) = happyShift action_58
action_68 (32) = happyShift action_59
action_68 (33) = happyShift action_60
action_68 (8) = happyGoto action_49
action_68 (9) = happyGoto action_111
action_68 (13) = happyGoto action_51
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (21) = happyShift action_52
action_69 (22) = happyShift action_53
action_69 (23) = happyShift action_54
action_69 (24) = happyShift action_55
action_69 (26) = happyShift action_56
action_69 (31) = happyShift action_58
action_69 (32) = happyShift action_59
action_69 (33) = happyShift action_60
action_69 (8) = happyGoto action_49
action_69 (9) = happyGoto action_110
action_69 (13) = happyGoto action_51
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (21) = happyShift action_52
action_70 (22) = happyShift action_53
action_70 (23) = happyShift action_54
action_70 (24) = happyShift action_55
action_70 (26) = happyShift action_56
action_70 (31) = happyShift action_58
action_70 (32) = happyShift action_59
action_70 (33) = happyShift action_60
action_70 (8) = happyGoto action_49
action_70 (9) = happyGoto action_109
action_70 (13) = happyGoto action_51
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (21) = happyShift action_52
action_71 (22) = happyShift action_53
action_71 (23) = happyShift action_54
action_71 (24) = happyShift action_55
action_71 (26) = happyShift action_56
action_71 (31) = happyShift action_58
action_71 (32) = happyShift action_59
action_71 (33) = happyShift action_60
action_71 (8) = happyGoto action_49
action_71 (9) = happyGoto action_108
action_71 (13) = happyGoto action_51
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (21) = happyShift action_52
action_72 (22) = happyShift action_53
action_72 (23) = happyShift action_54
action_72 (24) = happyShift action_55
action_72 (26) = happyShift action_56
action_72 (31) = happyShift action_58
action_72 (32) = happyShift action_59
action_72 (33) = happyShift action_60
action_72 (8) = happyGoto action_49
action_72 (9) = happyGoto action_107
action_72 (13) = happyGoto action_51
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (21) = happyShift action_52
action_73 (22) = happyShift action_53
action_73 (23) = happyShift action_54
action_73 (24) = happyShift action_55
action_73 (26) = happyShift action_56
action_73 (31) = happyShift action_58
action_73 (32) = happyShift action_59
action_73 (33) = happyShift action_60
action_73 (8) = happyGoto action_49
action_73 (9) = happyGoto action_106
action_73 (13) = happyGoto action_51
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (21) = happyShift action_52
action_74 (22) = happyShift action_53
action_74 (23) = happyShift action_54
action_74 (24) = happyShift action_55
action_74 (26) = happyShift action_56
action_74 (31) = happyShift action_58
action_74 (32) = happyShift action_59
action_74 (33) = happyShift action_60
action_74 (8) = happyGoto action_49
action_74 (9) = happyGoto action_105
action_74 (13) = happyGoto action_51
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (21) = happyShift action_52
action_75 (22) = happyShift action_53
action_75 (23) = happyShift action_54
action_75 (24) = happyShift action_55
action_75 (26) = happyShift action_56
action_75 (31) = happyShift action_58
action_75 (32) = happyShift action_59
action_75 (33) = happyShift action_60
action_75 (8) = happyGoto action_49
action_75 (9) = happyGoto action_104
action_75 (13) = happyGoto action_51
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (21) = happyShift action_52
action_76 (22) = happyShift action_53
action_76 (23) = happyShift action_54
action_76 (24) = happyShift action_55
action_76 (26) = happyShift action_56
action_76 (31) = happyShift action_58
action_76 (32) = happyShift action_59
action_76 (33) = happyShift action_60
action_76 (8) = happyGoto action_49
action_76 (9) = happyGoto action_103
action_76 (13) = happyGoto action_51
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (21) = happyShift action_52
action_77 (22) = happyShift action_53
action_77 (23) = happyShift action_54
action_77 (24) = happyShift action_55
action_77 (26) = happyShift action_56
action_77 (31) = happyShift action_58
action_77 (32) = happyShift action_59
action_77 (33) = happyShift action_60
action_77 (8) = happyGoto action_49
action_77 (9) = happyGoto action_102
action_77 (13) = happyGoto action_51
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (21) = happyShift action_52
action_78 (22) = happyShift action_53
action_78 (23) = happyShift action_54
action_78 (24) = happyShift action_55
action_78 (26) = happyShift action_56
action_78 (31) = happyShift action_58
action_78 (32) = happyShift action_59
action_78 (33) = happyShift action_60
action_78 (8) = happyGoto action_49
action_78 (9) = happyGoto action_101
action_78 (13) = happyGoto action_51
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (21) = happyShift action_52
action_79 (22) = happyShift action_53
action_79 (23) = happyShift action_54
action_79 (24) = happyShift action_55
action_79 (26) = happyShift action_56
action_79 (31) = happyShift action_58
action_79 (32) = happyShift action_59
action_79 (33) = happyShift action_60
action_79 (8) = happyGoto action_49
action_79 (9) = happyGoto action_100
action_79 (13) = happyGoto action_51
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (15) = happyGoto action_96
action_80 (16) = happyGoto action_99
action_80 _ = happyReduce_47

action_81 (28) = happyShift action_98
action_81 (32) = happyShift action_67
action_81 (33) = happyShift action_68
action_81 (34) = happyShift action_69
action_81 (35) = happyShift action_70
action_81 (36) = happyShift action_71
action_81 (37) = happyShift action_72
action_81 (38) = happyShift action_73
action_81 (39) = happyShift action_74
action_81 (40) = happyShift action_75
action_81 (41) = happyShift action_76
action_81 (42) = happyShift action_77
action_81 (43) = happyShift action_78
action_81 (44) = happyShift action_79
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (15) = happyGoto action_96
action_82 (16) = happyGoto action_97
action_82 _ = happyReduce_47

action_83 _ = happyReduce_26

action_84 _ = happyReduce_25

action_85 _ = happyReduce_24

action_86 (27) = happyShift action_95
action_86 (32) = happyShift action_67
action_86 (33) = happyShift action_68
action_86 (34) = happyShift action_69
action_86 (35) = happyShift action_70
action_86 (36) = happyShift action_71
action_86 (37) = happyShift action_72
action_86 (38) = happyShift action_73
action_86 (39) = happyShift action_74
action_86 (40) = happyShift action_75
action_86 (41) = happyShift action_76
action_86 (42) = happyShift action_77
action_86 (43) = happyShift action_78
action_86 (44) = happyShift action_79
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (25) = happyShift action_93
action_87 (28) = happyShift action_94
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (21) = happyShift action_52
action_88 (22) = happyShift action_53
action_88 (23) = happyShift action_54
action_88 (24) = happyShift action_55
action_88 (26) = happyShift action_56
action_88 (31) = happyShift action_58
action_88 (32) = happyShift action_59
action_88 (33) = happyShift action_60
action_88 (8) = happyGoto action_49
action_88 (9) = happyGoto action_65
action_88 (10) = happyGoto action_92
action_88 (13) = happyGoto action_51
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (21) = happyShift action_52
action_89 (22) = happyShift action_53
action_89 (23) = happyShift action_54
action_89 (24) = happyShift action_55
action_89 (26) = happyShift action_56
action_89 (31) = happyShift action_58
action_89 (32) = happyShift action_59
action_89 (33) = happyShift action_60
action_89 (8) = happyGoto action_49
action_89 (9) = happyGoto action_91
action_89 (13) = happyGoto action_51
action_89 _ = happyFail (happyExpListPerState 89)

action_90 _ = happyReduce_43

action_91 (32) = happyShift action_67
action_91 (33) = happyShift action_68
action_91 (34) = happyShift action_69
action_91 (35) = happyShift action_70
action_91 (36) = happyShift action_71
action_91 (37) = happyShift action_72
action_91 (38) = happyShift action_73
action_91 (39) = happyShift action_74
action_91 (40) = happyShift action_75
action_91 (41) = happyShift action_76
action_91 (42) = happyShift action_77
action_91 (43) = happyShift action_78
action_91 (44) = happyShift action_79
action_91 _ = happyReduce_22

action_92 (27) = happyShift action_119
action_92 (28) = happyShift action_94
action_92 _ = happyFail (happyExpListPerState 92)

action_93 _ = happyReduce_38

action_94 (21) = happyShift action_52
action_94 (22) = happyShift action_53
action_94 (23) = happyShift action_54
action_94 (24) = happyShift action_55
action_94 (26) = happyShift action_56
action_94 (31) = happyShift action_58
action_94 (32) = happyShift action_59
action_94 (33) = happyShift action_60
action_94 (8) = happyGoto action_49
action_94 (9) = happyGoto action_118
action_94 (13) = happyGoto action_51
action_94 _ = happyFail (happyExpListPerState 94)

action_95 _ = happyReduce_30

action_96 (23) = happyShift action_37
action_96 (48) = happyShift action_38
action_96 (50) = happyShift action_39
action_96 (51) = happyShift action_40
action_96 (52) = happyShift action_41
action_96 (53) = happyShift action_42
action_96 (54) = happyShift action_43
action_96 (14) = happyGoto action_36
action_96 _ = happyReduce_49

action_97 (57) = happyShift action_117
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (21) = happyShift action_52
action_98 (22) = happyShift action_53
action_98 (23) = happyShift action_54
action_98 (24) = happyShift action_55
action_98 (26) = happyShift action_56
action_98 (31) = happyShift action_58
action_98 (32) = happyShift action_59
action_98 (33) = happyShift action_60
action_98 (8) = happyGoto action_49
action_98 (9) = happyGoto action_116
action_98 (13) = happyGoto action_51
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (49) = happyShift action_115
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (32) = happyShift action_67
action_100 (33) = happyShift action_68
action_100 (34) = happyShift action_69
action_100 (35) = happyShift action_70
action_100 (36) = happyShift action_71
action_100 (37) = happyShift action_72
action_100 (38) = happyShift action_73
action_100 (39) = happyShift action_74
action_100 (40) = happyShift action_75
action_100 (41) = happyShift action_76
action_100 (42) = happyShift action_77
action_100 (43) = happyShift action_78
action_100 _ = happyReduce_23

action_101 (32) = happyShift action_67
action_101 (33) = happyShift action_68
action_101 (34) = happyShift action_69
action_101 (35) = happyShift action_70
action_101 (36) = happyShift action_71
action_101 (37) = happyShift action_72
action_101 (38) = happyShift action_73
action_101 (39) = happyShift action_74
action_101 (40) = happyShift action_75
action_101 (41) = happyShift action_76
action_101 (42) = happyShift action_77
action_101 _ = happyReduce_21

action_102 (32) = happyShift action_67
action_102 (33) = happyShift action_68
action_102 (34) = happyShift action_69
action_102 (35) = happyShift action_70
action_102 (36) = happyShift action_71
action_102 (37) = happyShift action_72
action_102 (38) = happyShift action_73
action_102 (39) = happyShift action_74
action_102 (40) = happyShift action_75
action_102 _ = happyReduce_20

action_103 (32) = happyShift action_67
action_103 (33) = happyShift action_68
action_103 (34) = happyShift action_69
action_103 (35) = happyShift action_70
action_103 (36) = happyShift action_71
action_103 (37) = happyShift action_72
action_103 (38) = happyShift action_73
action_103 (39) = happyShift action_74
action_103 (40) = happyShift action_75
action_103 _ = happyReduce_19

action_104 (32) = happyShift action_67
action_104 (33) = happyShift action_68
action_104 (34) = happyShift action_69
action_104 (35) = happyShift action_70
action_104 (36) = happyShift action_71
action_104 _ = happyReduce_16

action_105 (32) = happyShift action_67
action_105 (33) = happyShift action_68
action_105 (34) = happyShift action_69
action_105 (35) = happyShift action_70
action_105 (36) = happyShift action_71
action_105 _ = happyReduce_18

action_106 (32) = happyShift action_67
action_106 (33) = happyShift action_68
action_106 (34) = happyShift action_69
action_106 (35) = happyShift action_70
action_106 (36) = happyShift action_71
action_106 _ = happyReduce_15

action_107 (32) = happyShift action_67
action_107 (33) = happyShift action_68
action_107 (34) = happyShift action_69
action_107 (35) = happyShift action_70
action_107 (36) = happyShift action_71
action_107 _ = happyReduce_17

action_108 (32) = happyShift action_67
action_108 (34) = happyShift action_69
action_108 (35) = happyShift action_70
action_108 _ = happyReduce_12

action_109 _ = happyReduce_14

action_110 _ = happyReduce_13

action_111 (32) = happyShift action_67
action_111 (34) = happyShift action_69
action_111 (35) = happyShift action_70
action_111 _ = happyReduce_11

action_112 _ = happyReduce_10

action_113 (30) = happyShift action_114
action_113 _ = happyFail (happyExpListPerState 113)

action_114 _ = happyReduce_39

action_115 (15) = happyGoto action_96
action_115 (16) = happyGoto action_121
action_115 _ = happyReduce_47

action_116 (28) = happyShift action_120
action_116 (32) = happyShift action_67
action_116 (33) = happyShift action_68
action_116 (34) = happyShift action_69
action_116 (35) = happyShift action_70
action_116 (36) = happyShift action_71
action_116 (37) = happyShift action_72
action_116 (38) = happyShift action_73
action_116 (39) = happyShift action_74
action_116 (40) = happyShift action_75
action_116 (41) = happyShift action_76
action_116 (42) = happyShift action_77
action_116 (43) = happyShift action_78
action_116 (44) = happyShift action_79
action_116 _ = happyFail (happyExpListPerState 116)

action_117 _ = happyReduce_42

action_118 (32) = happyShift action_67
action_118 (33) = happyShift action_68
action_118 (34) = happyShift action_69
action_118 (35) = happyShift action_70
action_118 (36) = happyShift action_71
action_118 (37) = happyShift action_72
action_118 (38) = happyShift action_73
action_118 (39) = happyShift action_74
action_118 (40) = happyShift action_75
action_118 (41) = happyShift action_76
action_118 (42) = happyShift action_77
action_118 (43) = happyShift action_78
action_118 (44) = happyShift action_79
action_118 _ = happyReduce_31

action_119 _ = happyReduce_28

action_120 (21) = happyShift action_52
action_120 (22) = happyShift action_53
action_120 (23) = happyShift action_54
action_120 (24) = happyShift action_55
action_120 (26) = happyShift action_56
action_120 (31) = happyShift action_58
action_120 (32) = happyShift action_59
action_120 (33) = happyShift action_60
action_120 (8) = happyGoto action_49
action_120 (9) = happyGoto action_123
action_120 (13) = happyGoto action_51
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (57) = happyShift action_122
action_121 _ = happyFail (happyExpListPerState 121)

action_122 _ = happyReduce_40

action_123 (27) = happyShift action_124
action_123 (32) = happyShift action_67
action_123 (33) = happyShift action_68
action_123 (34) = happyShift action_69
action_123 (35) = happyShift action_70
action_123 (36) = happyShift action_71
action_123 (37) = happyShift action_72
action_123 (38) = happyShift action_73
action_123 (39) = happyShift action_74
action_123 (40) = happyShift action_75
action_123 (41) = happyShift action_76
action_123 (42) = happyShift action_77
action_123 (43) = happyShift action_78
action_123 (44) = happyShift action_79
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (56) = happyShift action_125
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (15) = happyGoto action_96
action_125 (16) = happyGoto action_126
action_125 _ = happyReduce_47

action_126 (57) = happyShift action_127
action_126 _ = happyFail (happyExpListPerState 126)

action_127 _ = happyReduce_41

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Start happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  5 happyReduction_2
happyReduction_2 (HappyAbsSyn18  happy_var_2)
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
	(HappyTerminal (Lexeme _ (TokenId happy_var_1)))
	 =  HappyAbsSyn8
		 (Assign happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  8 happyReduction_23
happyReduction_23 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (Or happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  8 happyReduction_24
happyReduction_24 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (Negation happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_2  8 happyReduction_25
happyReduction_25 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (UnwrapPointer happy_var_2
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  8 happyReduction_26
happyReduction_26 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (MinusUnary happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  9 happyReduction_27
happyReduction_27 (HappyAbsSyn13  happy_var_1)
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

happyReduce_31 = happySpecReduce_3  10 happyReduction_31
happyReduction_31 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_3:happy_var_1
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  10 happyReduction_32
happyReduction_32 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  11 happyReduction_33
happyReduction_33 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (Lexeme _ (TokenId happy_var_1)))
	 =  HappyAbsSyn11
		 (Declaration happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  12 happyReduction_34
happyReduction_34 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_3:happy_var_1
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  12 happyReduction_35
happyReduction_35 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  13 happyReduction_36
happyReduction_36 (HappyTerminal (Lexeme _ (TokenIntLiteral happy_var_1)))
	 =  HappyAbsSyn13
		 (IntLiteral happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  13 happyReduction_37
happyReduction_37 (HappyTerminal (Lexeme _ (TokenBoolLiteral happy_var_1)))
	 =  HappyAbsSyn13
		 (BoolLiteral happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  13 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (ArrayLiteral happy_var_2
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happyReduce 5 14 happyReduction_39
happyReduction_39 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexeme _ (TokenId happy_var_1))) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (FunctionCallStatement happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_40 = happyReduce 7 14 happyReduction_40
happyReduction_40 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (IfElseStatement happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_41 = happyReduce 11 14 happyReduction_41
happyReduction_41 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_10) `HappyStk`
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
	 = HappyAbsSyn14
		 (ForStatement happy_var_3 happy_var_5 happy_var_7 happy_var_10
	) `HappyStk` happyRest

happyReduce_42 = happyReduce 5 14 happyReduction_42
happyReduction_42 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (WhileStatement happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_43 = happySpecReduce_3  14 happyReduction_43
happyReduction_43 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (ReturnStatement happy_var_2
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_2  14 happyReduction_44
happyReduction_44 _
	_
	 =  HappyAbsSyn14
		 (VoidReturnStatement
	)

happyReduce_45 = happySpecReduce_2  14 happyReduction_45
happyReduction_45 _
	_
	 =  HappyAbsSyn14
		 (BreakStatement
	)

happyReduce_46 = happySpecReduce_2  14 happyReduction_46
happyReduction_46 _
	_
	 =  HappyAbsSyn14
		 (ContinueStatement
	)

happyReduce_47 = happySpecReduce_0  15 happyReduction_47
happyReduction_47  =  HappyAbsSyn15
		 ([]
	)

happyReduce_48 = happySpecReduce_2  15 happyReduction_48
happyReduction_48 (HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_2 : happy_var_1
	)
happyReduction_48 _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  16 happyReduction_49
happyReduction_49 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 (Body happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_2  17 happyReduction_50
happyReduction_50 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn17
		 (FunctionBody happy_var_1 happy_var_2
	)
happyReduction_50 _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  17 happyReduction_51
happyReduction_51 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn17
		 (FunctionBody [] happy_var_1
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happyReduce 10 18 happyReduction_52
happyReduction_52 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexeme _ (TokenId happy_var_2))) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (Function happy_var_2 happy_var_4 happy_var_7 happy_var_9
	) `HappyStk` happyRest

happyReduce_53 = happyReduce 9 18 happyReduction_53
happyReduction_53 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexeme _ (TokenId happy_var_2))) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (Function happy_var_2 [] happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyNewToken action sts stk
	= lexwrap(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	Lexeme _ TokenEOF -> action 58 58 tk (HappyState action) sts stk;
	Lexeme _ (TokenType "int") -> cont 19;
	Lexeme _ (TokenType "bool") -> cont 20;
	Lexeme _ (TokenIntLiteral happy_dollar_dollar) -> cont 21;
	Lexeme _ (TokenBoolLiteral happy_dollar_dollar) -> cont 22;
	Lexeme _ (TokenId happy_dollar_dollar) -> cont 23;
	Lexeme _ TokenSquareLeftParen -> cont 24;
	Lexeme _ TokenSquareRightParen -> cont 25;
	Lexeme _ TokenLeftParen -> cont 26;
	Lexeme _ TokenRightParen -> cont 27;
	Lexeme _ TokenComma -> cont 28;
	Lexeme _ TokenColon -> cont 29;
	Lexeme _ TokenSemicolon -> cont 30;
	Lexeme _ (TokenOperator "!") -> cont 31;
	Lexeme _ (TokenOperator "*") -> cont 32;
	Lexeme _ (TokenOperator "-") -> cont 33;
	Lexeme _ (TokenOperator "/") -> cont 34;
	Lexeme _ (TokenOperator "%") -> cont 35;
	Lexeme _ (TokenOperator "+") -> cont 36;
	Lexeme _ (TokenOperator ">") -> cont 37;
	Lexeme _ (TokenOperator "<") -> cont 38;
	Lexeme _ (TokenOperator ">=") -> cont 39;
	Lexeme _ (TokenOperator "<=") -> cont 40;
	Lexeme _ (TokenOperator "==") -> cont 41;
	Lexeme _ (TokenOperator "!=") -> cont 42;
	Lexeme _ (TokenOperator "&&") -> cont 43;
	Lexeme _ (TokenOperator "||") -> cont 44;
	Lexeme _ (TokenOperator "=") -> cont 45;
	Lexeme _ TokenVoid -> cont 46;
	Lexeme _ TokenFunction -> cont 47;
	Lexeme _ TokenIf -> cont 48;
	Lexeme _ TokenElse -> cont 49;
	Lexeme _ TokenFor -> cont 50;
	Lexeme _ TokenWhile -> cont 51;
	Lexeme _ TokenReturn -> cont 52;
	Lexeme _ TokenBreak -> cont 53;
	Lexeme _ TokenContinue -> cont 54;
	Lexeme _ TokenArrow -> cont 55;
	Lexeme _ TokenDo -> cont 56;
	Lexeme _ TokenEnd -> cont 57;
	_ -> happyError' (tk, [])
	})

happyError_ explist 58 tk = happyError' (tk, explist)
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

parse :: String -> Either String Start
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
