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
happyExpList = Happy_Data_Array.listArray (0,619) ([0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,16384,0,0,0,4096,0,1024,0,272,0,0,57344,901,32000,0,0,0,0,0,53312,4095,0,0,128,0,0,24064,56,2000,0,0,0,0,0,0,0,0,48128,112,4000,0,0,0,512,0,0,0,0,0,0,0,0,18432,0,0,0,14430,0,0,61440,450,0,0,6016,14,0,0,28860,0,0,57344,901,0,0,12032,28,0,0,256,0,0,49152,1803,0,0,24064,60,0,0,8192,0,0,0,256,0,0,0,0,0,0,6144,0,0,0,256,0,0,0,0,8192,0,560,32770,0,32768,4113,0,0,0,0,49152,0,512,0,0,0,0,0,0,0,0,0,0,2048,65530,1,0,256,0,0,0,0,0,0,4096,65520,4099,0,49904,1,0,0,64516,255,4,8192,0,0,0,256,0,0,0,8,0,0,16384,65474,15,0,512,32766,0,0,288,0,0,61440,450,0,0,0,0,0,0,0,0,0,0,64,0,0,12032,28,1000,0,0,0,0,49152,1803,0,0,0,0,0,0,49904,1,0,32768,3607,0,0,48128,112,0,0,34272,3,0,0,7215,0,0,30720,225,0,0,3008,7,0,0,14430,0,0,61440,450,0,0,6016,14,0,0,28860,0,0,57344,901,0,0,12032,28,0,0,57720,0,0,0,65026,127,0,4096,65520,0,0,32896,1023,0,0,64516,7,0,8192,16352,0,0,256,31,0,0,63496,0,0,16384,1984,0,0,512,62,0,0,53264,0,0,32768,0,0,0,1024,0,0,0,40992,1,0,0,1,0,0,6144,65528,1,0,0,0,0,0,48,0,0,0,0,0,0,49904,1,0,0,0,0,0,48128,112,4000,0,4352,16383,0,0,7215,59392,3,0,0,0,0,0,0,0,32768,4113,1024,0,61440,450,16000,0,0,0,0,0,0,0,0,0,0,0,0,2240,8,0,0,16454,0,0,0,0,0,0,0,0,4096,0,0,0,0,32768,3607,62464,1,0,0,0,0,512,0,0,0,0,0,16,0,0,16384,0,3008,7,250,0,0,0,32,61440,450,0,0,0,0,8,0,57376,2047,0,0,0,0,0,0,0,0,0,57720,16384,31,0,65058,127,0,0,0,0,0,49904,32769,62,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,32768,0,3008,7,0,0,0,0,32,0,0,0,0,9216,65532,0,0,0,0,0,0,0,0,1,12032,28,1000,0,0,0,128,0,0,0,0,0
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
action_6 (57) = happyShift action_8
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (24) = happyShift action_33
action_7 (28) = happyShift action_34
action_7 (11) = happyGoto action_31
action_7 (12) = happyGoto action_32
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (22) = happyShift action_17
action_8 (23) = happyShift action_18
action_8 (24) = happyShift action_19
action_8 (25) = happyShift action_20
action_8 (27) = happyShift action_21
action_8 (32) = happyShift action_22
action_8 (33) = happyShift action_23
action_8 (34) = happyShift action_24
action_8 (49) = happyShift action_25
action_8 (51) = happyShift action_26
action_8 (52) = happyShift action_27
action_8 (53) = happyShift action_28
action_8 (54) = happyShift action_29
action_8 (55) = happyShift action_30
action_8 (8) = happyGoto action_9
action_8 (9) = happyGoto action_10
action_8 (11) = happyGoto action_11
action_8 (13) = happyGoto action_12
action_8 (14) = happyGoto action_13
action_8 (15) = happyGoto action_14
action_8 (16) = happyGoto action_15
action_8 (18) = happyGoto action_16
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_30

action_10 (25) = happyShift action_59
action_10 (31) = happyShift action_60
action_10 (33) = happyShift action_61
action_10 (34) = happyShift action_62
action_10 (35) = happyShift action_63
action_10 (36) = happyShift action_64
action_10 (37) = happyShift action_65
action_10 (38) = happyShift action_66
action_10 (39) = happyShift action_67
action_10 (40) = happyShift action_68
action_10 (41) = happyShift action_69
action_10 (42) = happyShift action_70
action_10 (43) = happyShift action_71
action_10 (44) = happyShift action_72
action_10 (45) = happyShift action_73
action_10 (46) = happyShift action_74
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (31) = happyShift action_58
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (22) = happyShift action_17
action_12 (23) = happyShift action_18
action_12 (24) = happyShift action_19
action_12 (25) = happyShift action_20
action_12 (27) = happyShift action_21
action_12 (32) = happyShift action_22
action_12 (33) = happyShift action_23
action_12 (34) = happyShift action_24
action_12 (49) = happyShift action_25
action_12 (51) = happyShift action_26
action_12 (52) = happyShift action_27
action_12 (53) = happyShift action_28
action_12 (54) = happyShift action_29
action_12 (55) = happyShift action_30
action_12 (8) = happyGoto action_9
action_12 (9) = happyGoto action_10
action_12 (11) = happyGoto action_56
action_12 (14) = happyGoto action_13
action_12 (15) = happyGoto action_14
action_12 (16) = happyGoto action_57
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_28

action_14 _ = happyReduce_52

action_15 (22) = happyShift action_17
action_15 (23) = happyShift action_18
action_15 (24) = happyShift action_42
action_15 (25) = happyShift action_20
action_15 (27) = happyShift action_21
action_15 (32) = happyShift action_22
action_15 (33) = happyShift action_23
action_15 (34) = happyShift action_24
action_15 (49) = happyShift action_25
action_15 (51) = happyShift action_26
action_15 (52) = happyShift action_27
action_15 (53) = happyShift action_28
action_15 (54) = happyShift action_29
action_15 (55) = happyShift action_30
action_15 (8) = happyGoto action_9
action_15 (9) = happyGoto action_10
action_15 (14) = happyGoto action_13
action_15 (15) = happyGoto action_55
action_15 _ = happyReduce_55

action_16 (58) = happyShift action_54
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_40

action_18 _ = happyReduce_41

action_19 (27) = happyShift action_53
action_19 (30) = happyShift action_36
action_19 _ = happyReduce_32

action_20 (22) = happyShift action_17
action_20 (23) = happyShift action_18
action_20 (24) = happyShift action_42
action_20 (25) = happyShift action_20
action_20 (27) = happyShift action_21
action_20 (32) = happyShift action_22
action_20 (33) = happyShift action_23
action_20 (34) = happyShift action_24
action_20 (8) = happyGoto action_9
action_20 (9) = happyGoto action_51
action_20 (10) = happyGoto action_52
action_20 (14) = happyGoto action_13
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (22) = happyShift action_17
action_21 (23) = happyShift action_18
action_21 (24) = happyShift action_42
action_21 (25) = happyShift action_20
action_21 (27) = happyShift action_21
action_21 (32) = happyShift action_22
action_21 (33) = happyShift action_23
action_21 (34) = happyShift action_24
action_21 (8) = happyGoto action_9
action_21 (9) = happyGoto action_50
action_21 (14) = happyGoto action_13
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (22) = happyShift action_17
action_22 (23) = happyShift action_18
action_22 (24) = happyShift action_42
action_22 (25) = happyShift action_20
action_22 (27) = happyShift action_21
action_22 (32) = happyShift action_22
action_22 (33) = happyShift action_23
action_22 (34) = happyShift action_24
action_22 (8) = happyGoto action_9
action_22 (9) = happyGoto action_49
action_22 (14) = happyGoto action_13
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (22) = happyShift action_17
action_23 (23) = happyShift action_18
action_23 (24) = happyShift action_42
action_23 (25) = happyShift action_20
action_23 (27) = happyShift action_21
action_23 (32) = happyShift action_22
action_23 (33) = happyShift action_23
action_23 (34) = happyShift action_24
action_23 (8) = happyGoto action_9
action_23 (9) = happyGoto action_48
action_23 (14) = happyGoto action_13
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (22) = happyShift action_17
action_24 (23) = happyShift action_18
action_24 (24) = happyShift action_42
action_24 (25) = happyShift action_20
action_24 (27) = happyShift action_21
action_24 (32) = happyShift action_22
action_24 (33) = happyShift action_23
action_24 (34) = happyShift action_24
action_24 (8) = happyGoto action_9
action_24 (9) = happyGoto action_47
action_24 (14) = happyGoto action_13
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (22) = happyShift action_17
action_25 (23) = happyShift action_18
action_25 (24) = happyShift action_42
action_25 (25) = happyShift action_20
action_25 (27) = happyShift action_21
action_25 (32) = happyShift action_22
action_25 (33) = happyShift action_23
action_25 (34) = happyShift action_24
action_25 (8) = happyGoto action_9
action_25 (9) = happyGoto action_46
action_25 (14) = happyGoto action_13
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (27) = happyShift action_45
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (22) = happyShift action_17
action_27 (23) = happyShift action_18
action_27 (24) = happyShift action_42
action_27 (25) = happyShift action_20
action_27 (27) = happyShift action_21
action_27 (32) = happyShift action_22
action_27 (33) = happyShift action_23
action_27 (34) = happyShift action_24
action_27 (8) = happyGoto action_9
action_27 (9) = happyGoto action_44
action_27 (14) = happyGoto action_13
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (22) = happyShift action_17
action_28 (23) = happyShift action_18
action_28 (24) = happyShift action_42
action_28 (25) = happyShift action_20
action_28 (27) = happyShift action_21
action_28 (31) = happyShift action_43
action_28 (32) = happyShift action_22
action_28 (33) = happyShift action_23
action_28 (34) = happyShift action_24
action_28 (8) = happyGoto action_9
action_28 (9) = happyGoto action_41
action_28 (14) = happyGoto action_13
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (31) = happyShift action_40
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (31) = happyShift action_39
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_37

action_32 (28) = happyShift action_37
action_32 (29) = happyShift action_38
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (30) = happyShift action_36
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (56) = happyShift action_35
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (20) = happyShift action_103
action_35 (21) = happyShift action_104
action_35 (25) = happyShift action_105
action_35 (33) = happyShift action_106
action_35 (47) = happyShift action_109
action_35 (6) = happyGoto action_107
action_35 (7) = happyGoto action_108
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (20) = happyShift action_103
action_36 (21) = happyShift action_104
action_36 (25) = happyShift action_105
action_36 (33) = happyShift action_106
action_36 (6) = happyGoto action_102
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (56) = happyShift action_100
action_37 (57) = happyShift action_101
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (24) = happyShift action_33
action_38 (11) = happyGoto action_99
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_50

action_40 _ = happyReduce_49

action_41 (25) = happyShift action_59
action_41 (31) = happyShift action_98
action_41 (33) = happyShift action_61
action_41 (34) = happyShift action_62
action_41 (35) = happyShift action_63
action_41 (36) = happyShift action_64
action_41 (37) = happyShift action_65
action_41 (38) = happyShift action_66
action_41 (39) = happyShift action_67
action_41 (40) = happyShift action_68
action_41 (41) = happyShift action_69
action_41 (42) = happyShift action_70
action_41 (43) = happyShift action_71
action_41 (44) = happyShift action_72
action_41 (45) = happyShift action_73
action_41 (46) = happyShift action_74
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (27) = happyShift action_53
action_42 _ = happyReduce_32

action_43 _ = happyReduce_48

action_44 (25) = happyShift action_59
action_44 (33) = happyShift action_61
action_44 (34) = happyShift action_62
action_44 (35) = happyShift action_63
action_44 (36) = happyShift action_64
action_44 (37) = happyShift action_65
action_44 (38) = happyShift action_66
action_44 (39) = happyShift action_67
action_44 (40) = happyShift action_68
action_44 (41) = happyShift action_69
action_44 (42) = happyShift action_70
action_44 (43) = happyShift action_71
action_44 (44) = happyShift action_72
action_44 (45) = happyShift action_73
action_44 (46) = happyShift action_74
action_44 (57) = happyShift action_97
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (22) = happyShift action_17
action_45 (23) = happyShift action_18
action_45 (24) = happyShift action_42
action_45 (25) = happyShift action_20
action_45 (27) = happyShift action_21
action_45 (32) = happyShift action_22
action_45 (33) = happyShift action_23
action_45 (34) = happyShift action_24
action_45 (8) = happyGoto action_9
action_45 (9) = happyGoto action_96
action_45 (14) = happyGoto action_13
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (25) = happyShift action_59
action_46 (33) = happyShift action_61
action_46 (34) = happyShift action_62
action_46 (35) = happyShift action_63
action_46 (36) = happyShift action_64
action_46 (37) = happyShift action_65
action_46 (38) = happyShift action_66
action_46 (39) = happyShift action_67
action_46 (40) = happyShift action_68
action_46 (41) = happyShift action_69
action_46 (42) = happyShift action_70
action_46 (43) = happyShift action_71
action_46 (44) = happyShift action_72
action_46 (45) = happyShift action_73
action_46 (46) = happyShift action_74
action_46 (57) = happyShift action_95
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (25) = happyShift action_59
action_47 _ = happyReduce_25

action_48 (25) = happyShift action_59
action_48 _ = happyReduce_24

action_49 (25) = happyShift action_59
action_49 _ = happyReduce_23

action_50 (25) = happyShift action_59
action_50 (28) = happyShift action_94
action_50 (33) = happyShift action_61
action_50 (34) = happyShift action_62
action_50 (35) = happyShift action_63
action_50 (36) = happyShift action_64
action_50 (37) = happyShift action_65
action_50 (38) = happyShift action_66
action_50 (39) = happyShift action_67
action_50 (40) = happyShift action_68
action_50 (41) = happyShift action_69
action_50 (42) = happyShift action_70
action_50 (43) = happyShift action_71
action_50 (44) = happyShift action_72
action_50 (45) = happyShift action_73
action_50 (46) = happyShift action_74
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (25) = happyShift action_59
action_51 (33) = happyShift action_61
action_51 (34) = happyShift action_62
action_51 (35) = happyShift action_63
action_51 (36) = happyShift action_64
action_51 (37) = happyShift action_65
action_51 (38) = happyShift action_66
action_51 (39) = happyShift action_67
action_51 (40) = happyShift action_68
action_51 (41) = happyShift action_69
action_51 (42) = happyShift action_70
action_51 (43) = happyShift action_71
action_51 (44) = happyShift action_72
action_51 (45) = happyShift action_73
action_51 (46) = happyShift action_74
action_51 _ = happyReduce_34

action_52 (26) = happyShift action_92
action_52 (29) = happyShift action_93
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (22) = happyShift action_17
action_53 (23) = happyShift action_18
action_53 (24) = happyShift action_42
action_53 (25) = happyShift action_20
action_53 (27) = happyShift action_21
action_53 (32) = happyShift action_22
action_53 (33) = happyShift action_23
action_53 (34) = happyShift action_24
action_53 (8) = happyGoto action_9
action_53 (9) = happyGoto action_51
action_53 (10) = happyGoto action_91
action_53 (14) = happyGoto action_13
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_58

action_55 _ = happyReduce_51

action_56 (31) = happyShift action_90
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (22) = happyShift action_17
action_57 (23) = happyShift action_18
action_57 (24) = happyShift action_42
action_57 (25) = happyShift action_20
action_57 (27) = happyShift action_21
action_57 (32) = happyShift action_22
action_57 (33) = happyShift action_23
action_57 (34) = happyShift action_24
action_57 (49) = happyShift action_25
action_57 (51) = happyShift action_26
action_57 (52) = happyShift action_27
action_57 (53) = happyShift action_28
action_57 (54) = happyShift action_29
action_57 (55) = happyShift action_30
action_57 (8) = happyGoto action_9
action_57 (9) = happyGoto action_10
action_57 (14) = happyGoto action_13
action_57 (15) = happyGoto action_55
action_57 _ = happyReduce_54

action_58 _ = happyReduce_39

action_59 (22) = happyShift action_17
action_59 (23) = happyShift action_18
action_59 (24) = happyShift action_42
action_59 (25) = happyShift action_20
action_59 (27) = happyShift action_21
action_59 (32) = happyShift action_22
action_59 (33) = happyShift action_23
action_59 (34) = happyShift action_24
action_59 (8) = happyGoto action_9
action_59 (9) = happyGoto action_89
action_59 (14) = happyGoto action_13
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_45

action_61 (22) = happyShift action_17
action_61 (23) = happyShift action_18
action_61 (24) = happyShift action_42
action_61 (25) = happyShift action_20
action_61 (27) = happyShift action_21
action_61 (32) = happyShift action_22
action_61 (33) = happyShift action_23
action_61 (34) = happyShift action_24
action_61 (8) = happyGoto action_9
action_61 (9) = happyGoto action_88
action_61 (14) = happyGoto action_13
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (22) = happyShift action_17
action_62 (23) = happyShift action_18
action_62 (24) = happyShift action_42
action_62 (25) = happyShift action_20
action_62 (27) = happyShift action_21
action_62 (32) = happyShift action_22
action_62 (33) = happyShift action_23
action_62 (34) = happyShift action_24
action_62 (8) = happyGoto action_9
action_62 (9) = happyGoto action_87
action_62 (14) = happyGoto action_13
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (22) = happyShift action_17
action_63 (23) = happyShift action_18
action_63 (24) = happyShift action_42
action_63 (25) = happyShift action_20
action_63 (27) = happyShift action_21
action_63 (32) = happyShift action_22
action_63 (33) = happyShift action_23
action_63 (34) = happyShift action_24
action_63 (8) = happyGoto action_9
action_63 (9) = happyGoto action_86
action_63 (14) = happyGoto action_13
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (22) = happyShift action_17
action_64 (23) = happyShift action_18
action_64 (24) = happyShift action_42
action_64 (25) = happyShift action_20
action_64 (27) = happyShift action_21
action_64 (32) = happyShift action_22
action_64 (33) = happyShift action_23
action_64 (34) = happyShift action_24
action_64 (8) = happyGoto action_9
action_64 (9) = happyGoto action_85
action_64 (14) = happyGoto action_13
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (22) = happyShift action_17
action_65 (23) = happyShift action_18
action_65 (24) = happyShift action_42
action_65 (25) = happyShift action_20
action_65 (27) = happyShift action_21
action_65 (32) = happyShift action_22
action_65 (33) = happyShift action_23
action_65 (34) = happyShift action_24
action_65 (8) = happyGoto action_9
action_65 (9) = happyGoto action_84
action_65 (14) = happyGoto action_13
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (22) = happyShift action_17
action_66 (23) = happyShift action_18
action_66 (24) = happyShift action_42
action_66 (25) = happyShift action_20
action_66 (27) = happyShift action_21
action_66 (32) = happyShift action_22
action_66 (33) = happyShift action_23
action_66 (34) = happyShift action_24
action_66 (8) = happyGoto action_9
action_66 (9) = happyGoto action_83
action_66 (14) = happyGoto action_13
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (22) = happyShift action_17
action_67 (23) = happyShift action_18
action_67 (24) = happyShift action_42
action_67 (25) = happyShift action_20
action_67 (27) = happyShift action_21
action_67 (32) = happyShift action_22
action_67 (33) = happyShift action_23
action_67 (34) = happyShift action_24
action_67 (8) = happyGoto action_9
action_67 (9) = happyGoto action_82
action_67 (14) = happyGoto action_13
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (22) = happyShift action_17
action_68 (23) = happyShift action_18
action_68 (24) = happyShift action_42
action_68 (25) = happyShift action_20
action_68 (27) = happyShift action_21
action_68 (32) = happyShift action_22
action_68 (33) = happyShift action_23
action_68 (34) = happyShift action_24
action_68 (8) = happyGoto action_9
action_68 (9) = happyGoto action_81
action_68 (14) = happyGoto action_13
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (22) = happyShift action_17
action_69 (23) = happyShift action_18
action_69 (24) = happyShift action_42
action_69 (25) = happyShift action_20
action_69 (27) = happyShift action_21
action_69 (32) = happyShift action_22
action_69 (33) = happyShift action_23
action_69 (34) = happyShift action_24
action_69 (8) = happyGoto action_9
action_69 (9) = happyGoto action_80
action_69 (14) = happyGoto action_13
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (22) = happyShift action_17
action_70 (23) = happyShift action_18
action_70 (24) = happyShift action_42
action_70 (25) = happyShift action_20
action_70 (27) = happyShift action_21
action_70 (32) = happyShift action_22
action_70 (33) = happyShift action_23
action_70 (34) = happyShift action_24
action_70 (8) = happyGoto action_9
action_70 (9) = happyGoto action_79
action_70 (14) = happyGoto action_13
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (22) = happyShift action_17
action_71 (23) = happyShift action_18
action_71 (24) = happyShift action_42
action_71 (25) = happyShift action_20
action_71 (27) = happyShift action_21
action_71 (32) = happyShift action_22
action_71 (33) = happyShift action_23
action_71 (34) = happyShift action_24
action_71 (8) = happyGoto action_9
action_71 (9) = happyGoto action_78
action_71 (14) = happyGoto action_13
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (22) = happyShift action_17
action_72 (23) = happyShift action_18
action_72 (24) = happyShift action_42
action_72 (25) = happyShift action_20
action_72 (27) = happyShift action_21
action_72 (32) = happyShift action_22
action_72 (33) = happyShift action_23
action_72 (34) = happyShift action_24
action_72 (8) = happyGoto action_9
action_72 (9) = happyGoto action_77
action_72 (14) = happyGoto action_13
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (22) = happyShift action_17
action_73 (23) = happyShift action_18
action_73 (24) = happyShift action_42
action_73 (25) = happyShift action_20
action_73 (27) = happyShift action_21
action_73 (32) = happyShift action_22
action_73 (33) = happyShift action_23
action_73 (34) = happyShift action_24
action_73 (8) = happyGoto action_9
action_73 (9) = happyGoto action_76
action_73 (14) = happyGoto action_13
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (22) = happyShift action_17
action_74 (23) = happyShift action_18
action_74 (24) = happyShift action_42
action_74 (25) = happyShift action_20
action_74 (27) = happyShift action_21
action_74 (32) = happyShift action_22
action_74 (33) = happyShift action_23
action_74 (34) = happyShift action_24
action_74 (8) = happyGoto action_9
action_74 (9) = happyGoto action_75
action_74 (14) = happyGoto action_13
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (25) = happyShift action_59
action_75 (33) = happyShift action_61
action_75 (34) = happyShift action_62
action_75 (35) = happyShift action_63
action_75 (36) = happyShift action_64
action_75 (37) = happyShift action_65
action_75 (38) = happyShift action_66
action_75 (39) = happyShift action_67
action_75 (40) = happyShift action_68
action_75 (41) = happyShift action_69
action_75 (42) = happyShift action_70
action_75 (43) = happyShift action_71
action_75 (44) = happyShift action_72
action_75 (45) = happyShift action_73
action_75 (46) = happyShift action_74
action_75 _ = happyReduce_26

action_76 (25) = happyShift action_59
action_76 (33) = happyShift action_61
action_76 (34) = happyShift action_62
action_76 (35) = happyShift action_63
action_76 (36) = happyShift action_64
action_76 (37) = happyShift action_65
action_76 (38) = happyShift action_66
action_76 (39) = happyShift action_67
action_76 (40) = happyShift action_68
action_76 (41) = happyShift action_69
action_76 (42) = happyShift action_70
action_76 (43) = happyShift action_71
action_76 (44) = happyShift action_72
action_76 _ = happyReduce_22

action_77 (25) = happyShift action_59
action_77 (33) = happyShift action_61
action_77 (34) = happyShift action_62
action_77 (35) = happyShift action_63
action_77 (36) = happyShift action_64
action_77 (37) = happyShift action_65
action_77 (38) = happyShift action_66
action_77 (39) = happyShift action_67
action_77 (40) = happyShift action_68
action_77 (41) = happyShift action_69
action_77 (42) = happyShift action_70
action_77 (43) = happyShift action_71
action_77 _ = happyReduce_21

action_78 (25) = happyShift action_59
action_78 (33) = happyShift action_61
action_78 (34) = happyShift action_62
action_78 (35) = happyShift action_63
action_78 (36) = happyShift action_64
action_78 (37) = happyShift action_65
action_78 (38) = happyShift action_66
action_78 (39) = happyShift action_67
action_78 (40) = happyShift action_68
action_78 (41) = happyShift action_69
action_78 _ = happyReduce_20

action_79 (25) = happyShift action_59
action_79 (33) = happyShift action_61
action_79 (34) = happyShift action_62
action_79 (35) = happyShift action_63
action_79 (36) = happyShift action_64
action_79 (37) = happyShift action_65
action_79 (38) = happyShift action_66
action_79 (39) = happyShift action_67
action_79 (40) = happyShift action_68
action_79 (41) = happyShift action_69
action_79 _ = happyReduce_19

action_80 (25) = happyShift action_59
action_80 (33) = happyShift action_61
action_80 (34) = happyShift action_62
action_80 (35) = happyShift action_63
action_80 (36) = happyShift action_64
action_80 (37) = happyShift action_65
action_80 _ = happyReduce_16

action_81 (25) = happyShift action_59
action_81 (33) = happyShift action_61
action_81 (34) = happyShift action_62
action_81 (35) = happyShift action_63
action_81 (36) = happyShift action_64
action_81 (37) = happyShift action_65
action_81 _ = happyReduce_18

action_82 (25) = happyShift action_59
action_82 (33) = happyShift action_61
action_82 (34) = happyShift action_62
action_82 (35) = happyShift action_63
action_82 (36) = happyShift action_64
action_82 (37) = happyShift action_65
action_82 _ = happyReduce_15

action_83 (25) = happyShift action_59
action_83 (33) = happyShift action_61
action_83 (34) = happyShift action_62
action_83 (35) = happyShift action_63
action_83 (36) = happyShift action_64
action_83 (37) = happyShift action_65
action_83 _ = happyReduce_17

action_84 (25) = happyShift action_59
action_84 (33) = happyShift action_61
action_84 (35) = happyShift action_63
action_84 (36) = happyShift action_64
action_84 _ = happyReduce_12

action_85 (25) = happyShift action_59
action_85 _ = happyReduce_14

action_86 (25) = happyShift action_59
action_86 _ = happyReduce_13

action_87 (25) = happyShift action_59
action_87 (33) = happyShift action_61
action_87 (35) = happyShift action_63
action_87 (36) = happyShift action_64
action_87 _ = happyReduce_11

action_88 (25) = happyShift action_59
action_88 _ = happyReduce_10

action_89 (25) = happyShift action_59
action_89 (26) = happyShift action_121
action_89 (33) = happyShift action_61
action_89 (34) = happyShift action_62
action_89 (35) = happyShift action_63
action_89 (36) = happyShift action_64
action_89 (37) = happyShift action_65
action_89 (38) = happyShift action_66
action_89 (39) = happyShift action_67
action_89 (40) = happyShift action_68
action_89 (41) = happyShift action_69
action_89 (42) = happyShift action_70
action_89 (43) = happyShift action_71
action_89 (44) = happyShift action_72
action_89 (45) = happyShift action_73
action_89 (46) = happyShift action_74
action_89 _ = happyFail (happyExpListPerState 89)

action_90 _ = happyReduce_38

action_91 (28) = happyShift action_120
action_91 (29) = happyShift action_93
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_42

action_93 (22) = happyShift action_17
action_93 (23) = happyShift action_18
action_93 (24) = happyShift action_42
action_93 (25) = happyShift action_20
action_93 (27) = happyShift action_21
action_93 (32) = happyShift action_22
action_93 (33) = happyShift action_23
action_93 (34) = happyShift action_24
action_93 (8) = happyGoto action_9
action_93 (9) = happyGoto action_119
action_93 (14) = happyGoto action_13
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_31

action_95 (22) = happyShift action_17
action_95 (23) = happyShift action_18
action_95 (24) = happyShift action_42
action_95 (25) = happyShift action_20
action_95 (27) = happyShift action_21
action_95 (32) = happyShift action_22
action_95 (33) = happyShift action_23
action_95 (34) = happyShift action_24
action_95 (49) = happyShift action_25
action_95 (51) = happyShift action_26
action_95 (52) = happyShift action_27
action_95 (53) = happyShift action_28
action_95 (54) = happyShift action_29
action_95 (55) = happyShift action_30
action_95 (8) = happyGoto action_9
action_95 (9) = happyGoto action_10
action_95 (14) = happyGoto action_13
action_95 (15) = happyGoto action_14
action_95 (16) = happyGoto action_115
action_95 (17) = happyGoto action_118
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (25) = happyShift action_59
action_96 (29) = happyShift action_117
action_96 (33) = happyShift action_61
action_96 (34) = happyShift action_62
action_96 (35) = happyShift action_63
action_96 (36) = happyShift action_64
action_96 (37) = happyShift action_65
action_96 (38) = happyShift action_66
action_96 (39) = happyShift action_67
action_96 (40) = happyShift action_68
action_96 (41) = happyShift action_69
action_96 (42) = happyShift action_70
action_96 (43) = happyShift action_71
action_96 (44) = happyShift action_72
action_96 (45) = happyShift action_73
action_96 (46) = happyShift action_74
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (22) = happyShift action_17
action_97 (23) = happyShift action_18
action_97 (24) = happyShift action_42
action_97 (25) = happyShift action_20
action_97 (27) = happyShift action_21
action_97 (32) = happyShift action_22
action_97 (33) = happyShift action_23
action_97 (34) = happyShift action_24
action_97 (49) = happyShift action_25
action_97 (51) = happyShift action_26
action_97 (52) = happyShift action_27
action_97 (53) = happyShift action_28
action_97 (54) = happyShift action_29
action_97 (55) = happyShift action_30
action_97 (8) = happyGoto action_9
action_97 (9) = happyGoto action_10
action_97 (14) = happyGoto action_13
action_97 (15) = happyGoto action_14
action_97 (16) = happyGoto action_115
action_97 (17) = happyGoto action_116
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_47

action_99 _ = happyReduce_36

action_100 (20) = happyShift action_103
action_100 (21) = happyShift action_104
action_100 (25) = happyShift action_105
action_100 (33) = happyShift action_106
action_100 (47) = happyShift action_109
action_100 (6) = happyGoto action_107
action_100 (7) = happyGoto action_114
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (22) = happyShift action_17
action_101 (23) = happyShift action_18
action_101 (24) = happyShift action_19
action_101 (25) = happyShift action_20
action_101 (27) = happyShift action_21
action_101 (32) = happyShift action_22
action_101 (33) = happyShift action_23
action_101 (34) = happyShift action_24
action_101 (49) = happyShift action_25
action_101 (51) = happyShift action_26
action_101 (52) = happyShift action_27
action_101 (53) = happyShift action_28
action_101 (54) = happyShift action_29
action_101 (55) = happyShift action_30
action_101 (8) = happyGoto action_9
action_101 (9) = happyGoto action_10
action_101 (11) = happyGoto action_11
action_101 (13) = happyGoto action_12
action_101 (14) = happyGoto action_13
action_101 (15) = happyGoto action_14
action_101 (16) = happyGoto action_15
action_101 (18) = happyGoto action_113
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_35

action_103 _ = happyReduce_4

action_104 _ = happyReduce_5

action_105 (20) = happyShift action_103
action_105 (21) = happyShift action_104
action_105 (25) = happyShift action_105
action_105 (33) = happyShift action_106
action_105 (6) = happyGoto action_112
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (20) = happyShift action_103
action_106 (21) = happyShift action_104
action_106 (25) = happyShift action_105
action_106 (33) = happyShift action_106
action_106 (6) = happyGoto action_111
action_106 _ = happyFail (happyExpListPerState 106)

action_107 _ = happyReduce_8

action_108 (57) = happyShift action_110
action_108 _ = happyFail (happyExpListPerState 108)

action_109 _ = happyReduce_9

action_110 (22) = happyShift action_17
action_110 (23) = happyShift action_18
action_110 (24) = happyShift action_19
action_110 (25) = happyShift action_20
action_110 (27) = happyShift action_21
action_110 (32) = happyShift action_22
action_110 (33) = happyShift action_23
action_110 (34) = happyShift action_24
action_110 (49) = happyShift action_25
action_110 (51) = happyShift action_26
action_110 (52) = happyShift action_27
action_110 (53) = happyShift action_28
action_110 (54) = happyShift action_29
action_110 (55) = happyShift action_30
action_110 (8) = happyGoto action_9
action_110 (9) = happyGoto action_10
action_110 (11) = happyGoto action_11
action_110 (13) = happyGoto action_12
action_110 (14) = happyGoto action_13
action_110 (15) = happyGoto action_14
action_110 (16) = happyGoto action_15
action_110 (18) = happyGoto action_128
action_110 _ = happyFail (happyExpListPerState 110)

action_111 _ = happyReduce_7

action_112 (26) = happyShift action_127
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (58) = happyShift action_126
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (57) = happyShift action_125
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (22) = happyShift action_17
action_115 (23) = happyShift action_18
action_115 (24) = happyShift action_42
action_115 (25) = happyShift action_20
action_115 (27) = happyShift action_21
action_115 (32) = happyShift action_22
action_115 (33) = happyShift action_23
action_115 (34) = happyShift action_24
action_115 (49) = happyShift action_25
action_115 (51) = happyShift action_26
action_115 (52) = happyShift action_27
action_115 (53) = happyShift action_28
action_115 (54) = happyShift action_29
action_115 (55) = happyShift action_30
action_115 (8) = happyGoto action_9
action_115 (9) = happyGoto action_10
action_115 (14) = happyGoto action_13
action_115 (15) = happyGoto action_55
action_115 _ = happyReduce_53

action_116 (58) = happyShift action_124
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (22) = happyShift action_17
action_117 (23) = happyShift action_18
action_117 (24) = happyShift action_42
action_117 (25) = happyShift action_20
action_117 (27) = happyShift action_21
action_117 (32) = happyShift action_22
action_117 (33) = happyShift action_23
action_117 (34) = happyShift action_24
action_117 (8) = happyGoto action_9
action_117 (9) = happyGoto action_123
action_117 (14) = happyGoto action_13
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (50) = happyShift action_122
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (25) = happyShift action_59
action_119 (33) = happyShift action_61
action_119 (34) = happyShift action_62
action_119 (35) = happyShift action_63
action_119 (36) = happyShift action_64
action_119 (37) = happyShift action_65
action_119 (38) = happyShift action_66
action_119 (39) = happyShift action_67
action_119 (40) = happyShift action_68
action_119 (41) = happyShift action_69
action_119 (42) = happyShift action_70
action_119 (43) = happyShift action_71
action_119 (44) = happyShift action_72
action_119 (45) = happyShift action_73
action_119 (46) = happyShift action_74
action_119 _ = happyReduce_33

action_120 _ = happyReduce_29

action_121 _ = happyReduce_27

action_122 (22) = happyShift action_17
action_122 (23) = happyShift action_18
action_122 (24) = happyShift action_42
action_122 (25) = happyShift action_20
action_122 (27) = happyShift action_21
action_122 (32) = happyShift action_22
action_122 (33) = happyShift action_23
action_122 (34) = happyShift action_24
action_122 (49) = happyShift action_25
action_122 (51) = happyShift action_26
action_122 (52) = happyShift action_27
action_122 (53) = happyShift action_28
action_122 (54) = happyShift action_29
action_122 (55) = happyShift action_30
action_122 (8) = happyGoto action_9
action_122 (9) = happyGoto action_10
action_122 (14) = happyGoto action_13
action_122 (15) = happyGoto action_14
action_122 (16) = happyGoto action_115
action_122 (17) = happyGoto action_132
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (25) = happyShift action_59
action_123 (29) = happyShift action_131
action_123 (33) = happyShift action_61
action_123 (34) = happyShift action_62
action_123 (35) = happyShift action_63
action_123 (36) = happyShift action_64
action_123 (37) = happyShift action_65
action_123 (38) = happyShift action_66
action_123 (39) = happyShift action_67
action_123 (40) = happyShift action_68
action_123 (41) = happyShift action_69
action_123 (42) = happyShift action_70
action_123 (43) = happyShift action_71
action_123 (44) = happyShift action_72
action_123 (45) = happyShift action_73
action_123 (46) = happyShift action_74
action_123 _ = happyFail (happyExpListPerState 123)

action_124 _ = happyReduce_46

action_125 (22) = happyShift action_17
action_125 (23) = happyShift action_18
action_125 (24) = happyShift action_19
action_125 (25) = happyShift action_20
action_125 (27) = happyShift action_21
action_125 (32) = happyShift action_22
action_125 (33) = happyShift action_23
action_125 (34) = happyShift action_24
action_125 (49) = happyShift action_25
action_125 (51) = happyShift action_26
action_125 (52) = happyShift action_27
action_125 (53) = happyShift action_28
action_125 (54) = happyShift action_29
action_125 (55) = happyShift action_30
action_125 (8) = happyGoto action_9
action_125 (9) = happyGoto action_10
action_125 (11) = happyGoto action_11
action_125 (13) = happyGoto action_12
action_125 (14) = happyGoto action_13
action_125 (15) = happyGoto action_14
action_125 (16) = happyGoto action_15
action_125 (18) = happyGoto action_130
action_125 _ = happyFail (happyExpListPerState 125)

action_126 _ = happyReduce_59

action_127 _ = happyReduce_6

action_128 (58) = happyShift action_129
action_128 _ = happyFail (happyExpListPerState 128)

action_129 _ = happyReduce_57

action_130 (58) = happyShift action_135
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (22) = happyShift action_17
action_131 (23) = happyShift action_18
action_131 (24) = happyShift action_42
action_131 (25) = happyShift action_20
action_131 (27) = happyShift action_21
action_131 (32) = happyShift action_22
action_131 (33) = happyShift action_23
action_131 (34) = happyShift action_24
action_131 (8) = happyGoto action_9
action_131 (9) = happyGoto action_134
action_131 (14) = happyGoto action_13
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (58) = happyShift action_133
action_132 _ = happyFail (happyExpListPerState 132)

action_133 _ = happyReduce_43

action_134 (25) = happyShift action_59
action_134 (28) = happyShift action_136
action_134 (33) = happyShift action_61
action_134 (34) = happyShift action_62
action_134 (35) = happyShift action_63
action_134 (36) = happyShift action_64
action_134 (37) = happyShift action_65
action_134 (38) = happyShift action_66
action_134 (39) = happyShift action_67
action_134 (40) = happyShift action_68
action_134 (41) = happyShift action_69
action_134 (42) = happyShift action_70
action_134 (43) = happyShift action_71
action_134 (44) = happyShift action_72
action_134 (45) = happyShift action_73
action_134 (46) = happyShift action_74
action_134 _ = happyFail (happyExpListPerState 134)

action_135 _ = happyReduce_56

action_136 (57) = happyShift action_137
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (22) = happyShift action_17
action_137 (23) = happyShift action_18
action_137 (24) = happyShift action_42
action_137 (25) = happyShift action_20
action_137 (27) = happyShift action_21
action_137 (32) = happyShift action_22
action_137 (33) = happyShift action_23
action_137 (34) = happyShift action_24
action_137 (49) = happyShift action_25
action_137 (51) = happyShift action_26
action_137 (52) = happyShift action_27
action_137 (53) = happyShift action_28
action_137 (54) = happyShift action_29
action_137 (55) = happyShift action_30
action_137 (8) = happyGoto action_9
action_137 (9) = happyGoto action_10
action_137 (14) = happyGoto action_13
action_137 (15) = happyGoto action_14
action_137 (16) = happyGoto action_115
action_137 (17) = happyGoto action_138
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (58) = happyShift action_139
action_138 _ = happyFail (happyExpListPerState 138)

action_139 _ = happyReduce_44

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

happyReduce_51 = happySpecReduce_2  16 happyReduction_51
happyReduction_51 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_2 : happy_var_1
	)
happyReduction_51 _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  16 happyReduction_52
happyReduction_52 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 ([happy_var_1]
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_1  17 happyReduction_53
happyReduction_53 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn17
		 (Body (reverse happy_var_1)
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_2  18 happyReduction_54
happyReduction_54 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn18
		 (FunctionBody (reverse happy_var_1) (reverse happy_var_2)
	)
happyReduction_54 _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  18 happyReduction_55
happyReduction_55 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn18
		 (FunctionBody [] happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happyReduce 10 19 happyReduction_56
happyReduction_56 (_ `HappyStk`
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

happyReduce_57 = happyReduce 9 19 happyReduction_57
happyReduction_57 (_ `HappyStk`
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

happyReduce_58 = happyReduce 5 19 happyReduction_58
happyReduction_58 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexeme _ (TokenId happy_var_2))) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (Function happy_var_2 [] Void happy_var_4
	) `HappyStk` happyRest

happyReduce_59 = happyReduce 8 19 happyReduction_59
happyReduction_59 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexeme _ (TokenId happy_var_2))) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (Function happy_var_2 (reverse happy_var_4) Void happy_var_7
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
