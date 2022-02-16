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
happyExpList = Happy_Data_Array.listArray (0,498) ([0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,16,0,0,0,8,0,0,0,0,8192,0,4352,0,0,0,0,0,0,0,48,0,0,0,4,0,0,0,0,256,0,28860,40960,15,0,0,0,0,8192,65512,7,0,32768,0,0,0,28860,40960,15,0,0,0,0,0,0,0,0,3008,7,250,0,0,0,64,0,0,0,0,0,0,0,0,18432,0,0,0,28860,0,0,49152,1803,0,0,48128,112,0,0,3008,7,0,0,28860,0,0,49152,1803,0,0,32768,0,0,0,3008,7,0,0,30908,0,0,0,128,0,0,0,8,0,0,560,32770,0,0,8227,0,0,0,0,0,1,4096,0,0,0,0,0,0,0,8227,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,8227,0,0,12288,514,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,33280,32766,0,0,128,0,0,0,0,0,0,8192,65504,8199,0,3008,7,0,0,57376,2047,32,0,2,0,0,8192,0,0,0,512,0,0,0,57632,2047,0,0,65026,127,0,16384,2,0,0,3008,7,0,0,0,0,0,0,0,0,0,0,8,0,0,3008,7,250,0,0,0,0,49152,1803,0,0,0,0,0,0,3008,7,0,0,28860,0,0,49152,1803,0,0,48128,112,0,0,3008,7,0,0,28860,0,0,49152,1803,0,0,48128,112,0,0,3008,7,0,0,28860,0,0,49152,1803,0,0,48128,112,0,0,3008,7,0,0,28860,0,0,0,65026,127,0,8192,65504,1,0,512,4094,0,0,57376,63,0,0,65026,3,0,8192,992,0,0,512,62,0,0,57376,3,0,0,15874,0,0,8192,416,0,0,512,0,0,0,32,0,0,0,6658,0,0,8192,0,0,0,1536,32766,0,0,0,0,0,0,48,0,0,0,0,0,0,3008,7,0,0,0,0,0,49152,1803,64000,0,8192,65506,7,0,3008,7,250,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,49152,1803,64000,0,0,0,16384,0,3008,7,0,0,0,16384,0,0,65026,127,0,0,0,0,0,0,0,0,0,28860,40960,15,0,65058,127,0,0,0,0,0,3008,7,0,0,0,0,64,0,0,0,0,8192,65505,7,0,0,0,512,0,28860,40960,15,0,0,0,4,0,0,0,0
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
action_6 _ = happyReduce_60

action_7 (58) = happyShift action_13
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (25) = happyShift action_11
action_8 (29) = happyShift action_12
action_8 (11) = happyGoto action_9
action_8 (12) = happyGoto action_10
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_37

action_10 (29) = happyShift action_38
action_10 (30) = happyShift action_39
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (31) = happyShift action_37
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (57) = happyShift action_36
action_12 _ = happyReduce_59

action_13 (23) = happyShift action_22
action_13 (24) = happyShift action_23
action_13 (25) = happyShift action_24
action_13 (26) = happyShift action_25
action_13 (28) = happyShift action_26
action_13 (33) = happyShift action_27
action_13 (34) = happyShift action_28
action_13 (35) = happyShift action_29
action_13 (50) = happyShift action_30
action_13 (52) = happyShift action_31
action_13 (53) = happyShift action_32
action_13 (54) = happyShift action_33
action_13 (55) = happyShift action_34
action_13 (56) = happyShift action_35
action_13 (8) = happyGoto action_14
action_13 (9) = happyGoto action_15
action_13 (11) = happyGoto action_16
action_13 (13) = happyGoto action_17
action_13 (14) = happyGoto action_18
action_13 (15) = happyGoto action_19
action_13 (16) = happyGoto action_20
action_13 (18) = happyGoto action_21
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_30

action_15 (26) = happyShift action_70
action_15 (32) = happyShift action_71
action_15 (34) = happyShift action_72
action_15 (35) = happyShift action_73
action_15 (36) = happyShift action_74
action_15 (37) = happyShift action_75
action_15 (38) = happyShift action_76
action_15 (39) = happyShift action_77
action_15 (40) = happyShift action_78
action_15 (41) = happyShift action_79
action_15 (42) = happyShift action_80
action_15 (43) = happyShift action_81
action_15 (44) = happyShift action_82
action_15 (45) = happyShift action_83
action_15 (46) = happyShift action_84
action_15 (47) = happyShift action_85
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (32) = happyShift action_69
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (23) = happyShift action_22
action_17 (24) = happyShift action_23
action_17 (25) = happyShift action_24
action_17 (26) = happyShift action_25
action_17 (28) = happyShift action_26
action_17 (33) = happyShift action_27
action_17 (34) = happyShift action_28
action_17 (35) = happyShift action_29
action_17 (50) = happyShift action_30
action_17 (52) = happyShift action_31
action_17 (53) = happyShift action_32
action_17 (54) = happyShift action_33
action_17 (55) = happyShift action_34
action_17 (56) = happyShift action_35
action_17 (8) = happyGoto action_14
action_17 (9) = happyGoto action_15
action_17 (11) = happyGoto action_67
action_17 (14) = happyGoto action_18
action_17 (15) = happyGoto action_19
action_17 (16) = happyGoto action_68
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_28

action_19 _ = happyReduce_52

action_20 (23) = happyShift action_22
action_20 (24) = happyShift action_23
action_20 (25) = happyShift action_53
action_20 (26) = happyShift action_25
action_20 (28) = happyShift action_26
action_20 (33) = happyShift action_27
action_20 (34) = happyShift action_28
action_20 (35) = happyShift action_29
action_20 (50) = happyShift action_30
action_20 (52) = happyShift action_31
action_20 (53) = happyShift action_32
action_20 (54) = happyShift action_33
action_20 (55) = happyShift action_34
action_20 (56) = happyShift action_35
action_20 (8) = happyGoto action_14
action_20 (9) = happyGoto action_15
action_20 (14) = happyGoto action_18
action_20 (15) = happyGoto action_66
action_20 _ = happyReduce_55

action_21 (59) = happyShift action_65
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_40

action_23 _ = happyReduce_41

action_24 (28) = happyShift action_64
action_24 (31) = happyShift action_37
action_24 _ = happyReduce_32

action_25 (23) = happyShift action_22
action_25 (24) = happyShift action_23
action_25 (25) = happyShift action_53
action_25 (26) = happyShift action_25
action_25 (28) = happyShift action_26
action_25 (33) = happyShift action_27
action_25 (34) = happyShift action_28
action_25 (35) = happyShift action_29
action_25 (8) = happyGoto action_14
action_25 (9) = happyGoto action_62
action_25 (10) = happyGoto action_63
action_25 (14) = happyGoto action_18
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (23) = happyShift action_22
action_26 (24) = happyShift action_23
action_26 (25) = happyShift action_53
action_26 (26) = happyShift action_25
action_26 (28) = happyShift action_26
action_26 (33) = happyShift action_27
action_26 (34) = happyShift action_28
action_26 (35) = happyShift action_29
action_26 (8) = happyGoto action_14
action_26 (9) = happyGoto action_61
action_26 (14) = happyGoto action_18
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (23) = happyShift action_22
action_27 (24) = happyShift action_23
action_27 (25) = happyShift action_53
action_27 (26) = happyShift action_25
action_27 (28) = happyShift action_26
action_27 (33) = happyShift action_27
action_27 (34) = happyShift action_28
action_27 (35) = happyShift action_29
action_27 (8) = happyGoto action_14
action_27 (9) = happyGoto action_60
action_27 (14) = happyGoto action_18
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (23) = happyShift action_22
action_28 (24) = happyShift action_23
action_28 (25) = happyShift action_53
action_28 (26) = happyShift action_25
action_28 (28) = happyShift action_26
action_28 (33) = happyShift action_27
action_28 (34) = happyShift action_28
action_28 (35) = happyShift action_29
action_28 (8) = happyGoto action_14
action_28 (9) = happyGoto action_59
action_28 (14) = happyGoto action_18
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (23) = happyShift action_22
action_29 (24) = happyShift action_23
action_29 (25) = happyShift action_53
action_29 (26) = happyShift action_25
action_29 (28) = happyShift action_26
action_29 (33) = happyShift action_27
action_29 (34) = happyShift action_28
action_29 (35) = happyShift action_29
action_29 (8) = happyGoto action_14
action_29 (9) = happyGoto action_58
action_29 (14) = happyGoto action_18
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (23) = happyShift action_22
action_30 (24) = happyShift action_23
action_30 (25) = happyShift action_53
action_30 (26) = happyShift action_25
action_30 (28) = happyShift action_26
action_30 (33) = happyShift action_27
action_30 (34) = happyShift action_28
action_30 (35) = happyShift action_29
action_30 (8) = happyGoto action_14
action_30 (9) = happyGoto action_57
action_30 (14) = happyGoto action_18
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (28) = happyShift action_56
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (23) = happyShift action_22
action_32 (24) = happyShift action_23
action_32 (25) = happyShift action_53
action_32 (26) = happyShift action_25
action_32 (28) = happyShift action_26
action_32 (33) = happyShift action_27
action_32 (34) = happyShift action_28
action_32 (35) = happyShift action_29
action_32 (8) = happyGoto action_14
action_32 (9) = happyGoto action_55
action_32 (14) = happyGoto action_18
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (23) = happyShift action_22
action_33 (24) = happyShift action_23
action_33 (25) = happyShift action_53
action_33 (26) = happyShift action_25
action_33 (28) = happyShift action_26
action_33 (32) = happyShift action_54
action_33 (33) = happyShift action_27
action_33 (34) = happyShift action_28
action_33 (35) = happyShift action_29
action_33 (8) = happyGoto action_14
action_33 (9) = happyGoto action_52
action_33 (14) = happyGoto action_18
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (32) = happyShift action_51
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (32) = happyShift action_50
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (21) = happyShift action_43
action_36 (22) = happyShift action_44
action_36 (26) = happyShift action_45
action_36 (34) = happyShift action_46
action_36 (48) = happyShift action_49
action_36 (6) = happyGoto action_47
action_36 (7) = happyGoto action_48
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (21) = happyShift action_43
action_37 (22) = happyShift action_44
action_37 (26) = happyShift action_45
action_37 (34) = happyShift action_46
action_37 (6) = happyGoto action_42
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (57) = happyShift action_41
action_38 _ = happyReduce_57

action_39 (25) = happyShift action_11
action_39 (11) = happyGoto action_40
action_39 _ = happyFail (happyExpListPerState 39)

action_40 _ = happyReduce_36

action_41 (21) = happyShift action_43
action_41 (22) = happyShift action_44
action_41 (26) = happyShift action_45
action_41 (34) = happyShift action_46
action_41 (48) = happyShift action_49
action_41 (6) = happyGoto action_47
action_41 (7) = happyGoto action_112
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_35

action_43 _ = happyReduce_4

action_44 _ = happyReduce_5

action_45 (21) = happyShift action_43
action_45 (22) = happyShift action_44
action_45 (26) = happyShift action_45
action_45 (34) = happyShift action_46
action_45 (6) = happyGoto action_111
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (21) = happyShift action_43
action_46 (22) = happyShift action_44
action_46 (26) = happyShift action_45
action_46 (34) = happyShift action_46
action_46 (6) = happyGoto action_110
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_8

action_48 _ = happyReduce_58

action_49 _ = happyReduce_9

action_50 _ = happyReduce_50

action_51 _ = happyReduce_49

action_52 (26) = happyShift action_70
action_52 (32) = happyShift action_109
action_52 (34) = happyShift action_72
action_52 (35) = happyShift action_73
action_52 (36) = happyShift action_74
action_52 (37) = happyShift action_75
action_52 (38) = happyShift action_76
action_52 (39) = happyShift action_77
action_52 (40) = happyShift action_78
action_52 (41) = happyShift action_79
action_52 (42) = happyShift action_80
action_52 (43) = happyShift action_81
action_52 (44) = happyShift action_82
action_52 (45) = happyShift action_83
action_52 (46) = happyShift action_84
action_52 (47) = happyShift action_85
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (28) = happyShift action_64
action_53 _ = happyReduce_32

action_54 _ = happyReduce_48

action_55 (26) = happyShift action_70
action_55 (34) = happyShift action_72
action_55 (35) = happyShift action_73
action_55 (36) = happyShift action_74
action_55 (37) = happyShift action_75
action_55 (38) = happyShift action_76
action_55 (39) = happyShift action_77
action_55 (40) = happyShift action_78
action_55 (41) = happyShift action_79
action_55 (42) = happyShift action_80
action_55 (43) = happyShift action_81
action_55 (44) = happyShift action_82
action_55 (45) = happyShift action_83
action_55 (46) = happyShift action_84
action_55 (47) = happyShift action_85
action_55 (58) = happyShift action_108
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (23) = happyShift action_22
action_56 (24) = happyShift action_23
action_56 (25) = happyShift action_53
action_56 (26) = happyShift action_25
action_56 (28) = happyShift action_26
action_56 (33) = happyShift action_27
action_56 (34) = happyShift action_28
action_56 (35) = happyShift action_29
action_56 (8) = happyGoto action_14
action_56 (9) = happyGoto action_107
action_56 (14) = happyGoto action_18
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (26) = happyShift action_70
action_57 (34) = happyShift action_72
action_57 (35) = happyShift action_73
action_57 (36) = happyShift action_74
action_57 (37) = happyShift action_75
action_57 (38) = happyShift action_76
action_57 (39) = happyShift action_77
action_57 (40) = happyShift action_78
action_57 (41) = happyShift action_79
action_57 (42) = happyShift action_80
action_57 (43) = happyShift action_81
action_57 (44) = happyShift action_82
action_57 (45) = happyShift action_83
action_57 (46) = happyShift action_84
action_57 (47) = happyShift action_85
action_57 (58) = happyShift action_106
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (26) = happyShift action_70
action_58 _ = happyReduce_25

action_59 (26) = happyShift action_70
action_59 _ = happyReduce_24

action_60 (26) = happyShift action_70
action_60 _ = happyReduce_23

action_61 (26) = happyShift action_70
action_61 (29) = happyShift action_105
action_61 (34) = happyShift action_72
action_61 (35) = happyShift action_73
action_61 (36) = happyShift action_74
action_61 (37) = happyShift action_75
action_61 (38) = happyShift action_76
action_61 (39) = happyShift action_77
action_61 (40) = happyShift action_78
action_61 (41) = happyShift action_79
action_61 (42) = happyShift action_80
action_61 (43) = happyShift action_81
action_61 (44) = happyShift action_82
action_61 (45) = happyShift action_83
action_61 (46) = happyShift action_84
action_61 (47) = happyShift action_85
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (26) = happyShift action_70
action_62 (34) = happyShift action_72
action_62 (35) = happyShift action_73
action_62 (36) = happyShift action_74
action_62 (37) = happyShift action_75
action_62 (38) = happyShift action_76
action_62 (39) = happyShift action_77
action_62 (40) = happyShift action_78
action_62 (41) = happyShift action_79
action_62 (42) = happyShift action_80
action_62 (43) = happyShift action_81
action_62 (44) = happyShift action_82
action_62 (45) = happyShift action_83
action_62 (46) = happyShift action_84
action_62 (47) = happyShift action_85
action_62 _ = happyReduce_34

action_63 (27) = happyShift action_103
action_63 (30) = happyShift action_104
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (23) = happyShift action_22
action_64 (24) = happyShift action_23
action_64 (25) = happyShift action_53
action_64 (26) = happyShift action_25
action_64 (28) = happyShift action_26
action_64 (33) = happyShift action_27
action_64 (34) = happyShift action_28
action_64 (35) = happyShift action_29
action_64 (8) = happyGoto action_14
action_64 (9) = happyGoto action_62
action_64 (10) = happyGoto action_102
action_64 (14) = happyGoto action_18
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_61

action_66 _ = happyReduce_51

action_67 (32) = happyShift action_101
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (23) = happyShift action_22
action_68 (24) = happyShift action_23
action_68 (25) = happyShift action_53
action_68 (26) = happyShift action_25
action_68 (28) = happyShift action_26
action_68 (33) = happyShift action_27
action_68 (34) = happyShift action_28
action_68 (35) = happyShift action_29
action_68 (50) = happyShift action_30
action_68 (52) = happyShift action_31
action_68 (53) = happyShift action_32
action_68 (54) = happyShift action_33
action_68 (55) = happyShift action_34
action_68 (56) = happyShift action_35
action_68 (8) = happyGoto action_14
action_68 (9) = happyGoto action_15
action_68 (14) = happyGoto action_18
action_68 (15) = happyGoto action_66
action_68 _ = happyReduce_54

action_69 _ = happyReduce_39

action_70 (23) = happyShift action_22
action_70 (24) = happyShift action_23
action_70 (25) = happyShift action_53
action_70 (26) = happyShift action_25
action_70 (28) = happyShift action_26
action_70 (33) = happyShift action_27
action_70 (34) = happyShift action_28
action_70 (35) = happyShift action_29
action_70 (8) = happyGoto action_14
action_70 (9) = happyGoto action_100
action_70 (14) = happyGoto action_18
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_45

action_72 (23) = happyShift action_22
action_72 (24) = happyShift action_23
action_72 (25) = happyShift action_53
action_72 (26) = happyShift action_25
action_72 (28) = happyShift action_26
action_72 (33) = happyShift action_27
action_72 (34) = happyShift action_28
action_72 (35) = happyShift action_29
action_72 (8) = happyGoto action_14
action_72 (9) = happyGoto action_99
action_72 (14) = happyGoto action_18
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (23) = happyShift action_22
action_73 (24) = happyShift action_23
action_73 (25) = happyShift action_53
action_73 (26) = happyShift action_25
action_73 (28) = happyShift action_26
action_73 (33) = happyShift action_27
action_73 (34) = happyShift action_28
action_73 (35) = happyShift action_29
action_73 (8) = happyGoto action_14
action_73 (9) = happyGoto action_98
action_73 (14) = happyGoto action_18
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (23) = happyShift action_22
action_74 (24) = happyShift action_23
action_74 (25) = happyShift action_53
action_74 (26) = happyShift action_25
action_74 (28) = happyShift action_26
action_74 (33) = happyShift action_27
action_74 (34) = happyShift action_28
action_74 (35) = happyShift action_29
action_74 (8) = happyGoto action_14
action_74 (9) = happyGoto action_97
action_74 (14) = happyGoto action_18
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (23) = happyShift action_22
action_75 (24) = happyShift action_23
action_75 (25) = happyShift action_53
action_75 (26) = happyShift action_25
action_75 (28) = happyShift action_26
action_75 (33) = happyShift action_27
action_75 (34) = happyShift action_28
action_75 (35) = happyShift action_29
action_75 (8) = happyGoto action_14
action_75 (9) = happyGoto action_96
action_75 (14) = happyGoto action_18
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (23) = happyShift action_22
action_76 (24) = happyShift action_23
action_76 (25) = happyShift action_53
action_76 (26) = happyShift action_25
action_76 (28) = happyShift action_26
action_76 (33) = happyShift action_27
action_76 (34) = happyShift action_28
action_76 (35) = happyShift action_29
action_76 (8) = happyGoto action_14
action_76 (9) = happyGoto action_95
action_76 (14) = happyGoto action_18
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (23) = happyShift action_22
action_77 (24) = happyShift action_23
action_77 (25) = happyShift action_53
action_77 (26) = happyShift action_25
action_77 (28) = happyShift action_26
action_77 (33) = happyShift action_27
action_77 (34) = happyShift action_28
action_77 (35) = happyShift action_29
action_77 (8) = happyGoto action_14
action_77 (9) = happyGoto action_94
action_77 (14) = happyGoto action_18
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (23) = happyShift action_22
action_78 (24) = happyShift action_23
action_78 (25) = happyShift action_53
action_78 (26) = happyShift action_25
action_78 (28) = happyShift action_26
action_78 (33) = happyShift action_27
action_78 (34) = happyShift action_28
action_78 (35) = happyShift action_29
action_78 (8) = happyGoto action_14
action_78 (9) = happyGoto action_93
action_78 (14) = happyGoto action_18
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (23) = happyShift action_22
action_79 (24) = happyShift action_23
action_79 (25) = happyShift action_53
action_79 (26) = happyShift action_25
action_79 (28) = happyShift action_26
action_79 (33) = happyShift action_27
action_79 (34) = happyShift action_28
action_79 (35) = happyShift action_29
action_79 (8) = happyGoto action_14
action_79 (9) = happyGoto action_92
action_79 (14) = happyGoto action_18
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (23) = happyShift action_22
action_80 (24) = happyShift action_23
action_80 (25) = happyShift action_53
action_80 (26) = happyShift action_25
action_80 (28) = happyShift action_26
action_80 (33) = happyShift action_27
action_80 (34) = happyShift action_28
action_80 (35) = happyShift action_29
action_80 (8) = happyGoto action_14
action_80 (9) = happyGoto action_91
action_80 (14) = happyGoto action_18
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (23) = happyShift action_22
action_81 (24) = happyShift action_23
action_81 (25) = happyShift action_53
action_81 (26) = happyShift action_25
action_81 (28) = happyShift action_26
action_81 (33) = happyShift action_27
action_81 (34) = happyShift action_28
action_81 (35) = happyShift action_29
action_81 (8) = happyGoto action_14
action_81 (9) = happyGoto action_90
action_81 (14) = happyGoto action_18
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (23) = happyShift action_22
action_82 (24) = happyShift action_23
action_82 (25) = happyShift action_53
action_82 (26) = happyShift action_25
action_82 (28) = happyShift action_26
action_82 (33) = happyShift action_27
action_82 (34) = happyShift action_28
action_82 (35) = happyShift action_29
action_82 (8) = happyGoto action_14
action_82 (9) = happyGoto action_89
action_82 (14) = happyGoto action_18
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (23) = happyShift action_22
action_83 (24) = happyShift action_23
action_83 (25) = happyShift action_53
action_83 (26) = happyShift action_25
action_83 (28) = happyShift action_26
action_83 (33) = happyShift action_27
action_83 (34) = happyShift action_28
action_83 (35) = happyShift action_29
action_83 (8) = happyGoto action_14
action_83 (9) = happyGoto action_88
action_83 (14) = happyGoto action_18
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (23) = happyShift action_22
action_84 (24) = happyShift action_23
action_84 (25) = happyShift action_53
action_84 (26) = happyShift action_25
action_84 (28) = happyShift action_26
action_84 (33) = happyShift action_27
action_84 (34) = happyShift action_28
action_84 (35) = happyShift action_29
action_84 (8) = happyGoto action_14
action_84 (9) = happyGoto action_87
action_84 (14) = happyGoto action_18
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (23) = happyShift action_22
action_85 (24) = happyShift action_23
action_85 (25) = happyShift action_53
action_85 (26) = happyShift action_25
action_85 (28) = happyShift action_26
action_85 (33) = happyShift action_27
action_85 (34) = happyShift action_28
action_85 (35) = happyShift action_29
action_85 (8) = happyGoto action_14
action_85 (9) = happyGoto action_86
action_85 (14) = happyGoto action_18
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (26) = happyShift action_70
action_86 (34) = happyShift action_72
action_86 (35) = happyShift action_73
action_86 (36) = happyShift action_74
action_86 (37) = happyShift action_75
action_86 (38) = happyShift action_76
action_86 (39) = happyShift action_77
action_86 (40) = happyShift action_78
action_86 (41) = happyShift action_79
action_86 (42) = happyShift action_80
action_86 (43) = happyShift action_81
action_86 (44) = happyShift action_82
action_86 (45) = happyShift action_83
action_86 (46) = happyShift action_84
action_86 (47) = happyShift action_85
action_86 _ = happyReduce_26

action_87 (26) = happyShift action_70
action_87 (34) = happyShift action_72
action_87 (35) = happyShift action_73
action_87 (36) = happyShift action_74
action_87 (37) = happyShift action_75
action_87 (38) = happyShift action_76
action_87 (39) = happyShift action_77
action_87 (40) = happyShift action_78
action_87 (41) = happyShift action_79
action_87 (42) = happyShift action_80
action_87 (43) = happyShift action_81
action_87 (44) = happyShift action_82
action_87 (45) = happyShift action_83
action_87 _ = happyReduce_22

action_88 (26) = happyShift action_70
action_88 (34) = happyShift action_72
action_88 (35) = happyShift action_73
action_88 (36) = happyShift action_74
action_88 (37) = happyShift action_75
action_88 (38) = happyShift action_76
action_88 (39) = happyShift action_77
action_88 (40) = happyShift action_78
action_88 (41) = happyShift action_79
action_88 (42) = happyShift action_80
action_88 (43) = happyShift action_81
action_88 (44) = happyShift action_82
action_88 _ = happyReduce_21

action_89 (26) = happyShift action_70
action_89 (34) = happyShift action_72
action_89 (35) = happyShift action_73
action_89 (36) = happyShift action_74
action_89 (37) = happyShift action_75
action_89 (38) = happyShift action_76
action_89 (39) = happyShift action_77
action_89 (40) = happyShift action_78
action_89 (41) = happyShift action_79
action_89 (42) = happyShift action_80
action_89 _ = happyReduce_20

action_90 (26) = happyShift action_70
action_90 (34) = happyShift action_72
action_90 (35) = happyShift action_73
action_90 (36) = happyShift action_74
action_90 (37) = happyShift action_75
action_90 (38) = happyShift action_76
action_90 (39) = happyShift action_77
action_90 (40) = happyShift action_78
action_90 (41) = happyShift action_79
action_90 (42) = happyShift action_80
action_90 _ = happyReduce_19

action_91 (26) = happyShift action_70
action_91 (34) = happyShift action_72
action_91 (35) = happyShift action_73
action_91 (36) = happyShift action_74
action_91 (37) = happyShift action_75
action_91 (38) = happyShift action_76
action_91 _ = happyReduce_16

action_92 (26) = happyShift action_70
action_92 (34) = happyShift action_72
action_92 (35) = happyShift action_73
action_92 (36) = happyShift action_74
action_92 (37) = happyShift action_75
action_92 (38) = happyShift action_76
action_92 _ = happyReduce_18

action_93 (26) = happyShift action_70
action_93 (34) = happyShift action_72
action_93 (35) = happyShift action_73
action_93 (36) = happyShift action_74
action_93 (37) = happyShift action_75
action_93 (38) = happyShift action_76
action_93 _ = happyReduce_15

action_94 (26) = happyShift action_70
action_94 (34) = happyShift action_72
action_94 (35) = happyShift action_73
action_94 (36) = happyShift action_74
action_94 (37) = happyShift action_75
action_94 (38) = happyShift action_76
action_94 _ = happyReduce_17

action_95 (26) = happyShift action_70
action_95 (34) = happyShift action_72
action_95 (36) = happyShift action_74
action_95 (37) = happyShift action_75
action_95 _ = happyReduce_12

action_96 (26) = happyShift action_70
action_96 _ = happyReduce_14

action_97 (26) = happyShift action_70
action_97 _ = happyReduce_13

action_98 (26) = happyShift action_70
action_98 (34) = happyShift action_72
action_98 (36) = happyShift action_74
action_98 (37) = happyShift action_75
action_98 _ = happyReduce_11

action_99 (26) = happyShift action_70
action_99 _ = happyReduce_10

action_100 (26) = happyShift action_70
action_100 (27) = happyShift action_120
action_100 (34) = happyShift action_72
action_100 (35) = happyShift action_73
action_100 (36) = happyShift action_74
action_100 (37) = happyShift action_75
action_100 (38) = happyShift action_76
action_100 (39) = happyShift action_77
action_100 (40) = happyShift action_78
action_100 (41) = happyShift action_79
action_100 (42) = happyShift action_80
action_100 (43) = happyShift action_81
action_100 (44) = happyShift action_82
action_100 (45) = happyShift action_83
action_100 (46) = happyShift action_84
action_100 (47) = happyShift action_85
action_100 _ = happyFail (happyExpListPerState 100)

action_101 _ = happyReduce_38

action_102 (29) = happyShift action_119
action_102 (30) = happyShift action_104
action_102 _ = happyFail (happyExpListPerState 102)

action_103 _ = happyReduce_42

action_104 (23) = happyShift action_22
action_104 (24) = happyShift action_23
action_104 (25) = happyShift action_53
action_104 (26) = happyShift action_25
action_104 (28) = happyShift action_26
action_104 (33) = happyShift action_27
action_104 (34) = happyShift action_28
action_104 (35) = happyShift action_29
action_104 (8) = happyGoto action_14
action_104 (9) = happyGoto action_118
action_104 (14) = happyGoto action_18
action_104 _ = happyFail (happyExpListPerState 104)

action_105 _ = happyReduce_31

action_106 (23) = happyShift action_22
action_106 (24) = happyShift action_23
action_106 (25) = happyShift action_53
action_106 (26) = happyShift action_25
action_106 (28) = happyShift action_26
action_106 (33) = happyShift action_27
action_106 (34) = happyShift action_28
action_106 (35) = happyShift action_29
action_106 (50) = happyShift action_30
action_106 (52) = happyShift action_31
action_106 (53) = happyShift action_32
action_106 (54) = happyShift action_33
action_106 (55) = happyShift action_34
action_106 (56) = happyShift action_35
action_106 (8) = happyGoto action_14
action_106 (9) = happyGoto action_15
action_106 (14) = happyGoto action_18
action_106 (15) = happyGoto action_19
action_106 (16) = happyGoto action_114
action_106 (17) = happyGoto action_117
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (26) = happyShift action_70
action_107 (30) = happyShift action_116
action_107 (34) = happyShift action_72
action_107 (35) = happyShift action_73
action_107 (36) = happyShift action_74
action_107 (37) = happyShift action_75
action_107 (38) = happyShift action_76
action_107 (39) = happyShift action_77
action_107 (40) = happyShift action_78
action_107 (41) = happyShift action_79
action_107 (42) = happyShift action_80
action_107 (43) = happyShift action_81
action_107 (44) = happyShift action_82
action_107 (45) = happyShift action_83
action_107 (46) = happyShift action_84
action_107 (47) = happyShift action_85
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (23) = happyShift action_22
action_108 (24) = happyShift action_23
action_108 (25) = happyShift action_53
action_108 (26) = happyShift action_25
action_108 (28) = happyShift action_26
action_108 (33) = happyShift action_27
action_108 (34) = happyShift action_28
action_108 (35) = happyShift action_29
action_108 (50) = happyShift action_30
action_108 (52) = happyShift action_31
action_108 (53) = happyShift action_32
action_108 (54) = happyShift action_33
action_108 (55) = happyShift action_34
action_108 (56) = happyShift action_35
action_108 (8) = happyGoto action_14
action_108 (9) = happyGoto action_15
action_108 (14) = happyGoto action_18
action_108 (15) = happyGoto action_19
action_108 (16) = happyGoto action_114
action_108 (17) = happyGoto action_115
action_108 _ = happyFail (happyExpListPerState 108)

action_109 _ = happyReduce_47

action_110 _ = happyReduce_7

action_111 (27) = happyShift action_113
action_111 _ = happyFail (happyExpListPerState 111)

action_112 _ = happyReduce_56

action_113 _ = happyReduce_6

action_114 (23) = happyShift action_22
action_114 (24) = happyShift action_23
action_114 (25) = happyShift action_53
action_114 (26) = happyShift action_25
action_114 (28) = happyShift action_26
action_114 (33) = happyShift action_27
action_114 (34) = happyShift action_28
action_114 (35) = happyShift action_29
action_114 (50) = happyShift action_30
action_114 (52) = happyShift action_31
action_114 (53) = happyShift action_32
action_114 (54) = happyShift action_33
action_114 (55) = happyShift action_34
action_114 (56) = happyShift action_35
action_114 (8) = happyGoto action_14
action_114 (9) = happyGoto action_15
action_114 (14) = happyGoto action_18
action_114 (15) = happyGoto action_66
action_114 _ = happyReduce_53

action_115 (59) = happyShift action_123
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (23) = happyShift action_22
action_116 (24) = happyShift action_23
action_116 (25) = happyShift action_53
action_116 (26) = happyShift action_25
action_116 (28) = happyShift action_26
action_116 (33) = happyShift action_27
action_116 (34) = happyShift action_28
action_116 (35) = happyShift action_29
action_116 (8) = happyGoto action_14
action_116 (9) = happyGoto action_122
action_116 (14) = happyGoto action_18
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (51) = happyShift action_121
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (26) = happyShift action_70
action_118 (34) = happyShift action_72
action_118 (35) = happyShift action_73
action_118 (36) = happyShift action_74
action_118 (37) = happyShift action_75
action_118 (38) = happyShift action_76
action_118 (39) = happyShift action_77
action_118 (40) = happyShift action_78
action_118 (41) = happyShift action_79
action_118 (42) = happyShift action_80
action_118 (43) = happyShift action_81
action_118 (44) = happyShift action_82
action_118 (45) = happyShift action_83
action_118 (46) = happyShift action_84
action_118 (47) = happyShift action_85
action_118 _ = happyReduce_33

action_119 _ = happyReduce_29

action_120 _ = happyReduce_27

action_121 (23) = happyShift action_22
action_121 (24) = happyShift action_23
action_121 (25) = happyShift action_53
action_121 (26) = happyShift action_25
action_121 (28) = happyShift action_26
action_121 (33) = happyShift action_27
action_121 (34) = happyShift action_28
action_121 (35) = happyShift action_29
action_121 (50) = happyShift action_30
action_121 (52) = happyShift action_31
action_121 (53) = happyShift action_32
action_121 (54) = happyShift action_33
action_121 (55) = happyShift action_34
action_121 (56) = happyShift action_35
action_121 (8) = happyGoto action_14
action_121 (9) = happyGoto action_15
action_121 (14) = happyGoto action_18
action_121 (15) = happyGoto action_19
action_121 (16) = happyGoto action_114
action_121 (17) = happyGoto action_125
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (26) = happyShift action_70
action_122 (30) = happyShift action_124
action_122 (34) = happyShift action_72
action_122 (35) = happyShift action_73
action_122 (36) = happyShift action_74
action_122 (37) = happyShift action_75
action_122 (38) = happyShift action_76
action_122 (39) = happyShift action_77
action_122 (40) = happyShift action_78
action_122 (41) = happyShift action_79
action_122 (42) = happyShift action_80
action_122 (43) = happyShift action_81
action_122 (44) = happyShift action_82
action_122 (45) = happyShift action_83
action_122 (46) = happyShift action_84
action_122 (47) = happyShift action_85
action_122 _ = happyFail (happyExpListPerState 122)

action_123 _ = happyReduce_46

action_124 (23) = happyShift action_22
action_124 (24) = happyShift action_23
action_124 (25) = happyShift action_53
action_124 (26) = happyShift action_25
action_124 (28) = happyShift action_26
action_124 (33) = happyShift action_27
action_124 (34) = happyShift action_28
action_124 (35) = happyShift action_29
action_124 (8) = happyGoto action_14
action_124 (9) = happyGoto action_127
action_124 (14) = happyGoto action_18
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (59) = happyShift action_126
action_125 _ = happyFail (happyExpListPerState 125)

action_126 _ = happyReduce_43

action_127 (26) = happyShift action_70
action_127 (29) = happyShift action_128
action_127 (34) = happyShift action_72
action_127 (35) = happyShift action_73
action_127 (36) = happyShift action_74
action_127 (37) = happyShift action_75
action_127 (38) = happyShift action_76
action_127 (39) = happyShift action_77
action_127 (40) = happyShift action_78
action_127 (41) = happyShift action_79
action_127 (42) = happyShift action_80
action_127 (43) = happyShift action_81
action_127 (44) = happyShift action_82
action_127 (45) = happyShift action_83
action_127 (46) = happyShift action_84
action_127 (47) = happyShift action_85
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (58) = happyShift action_129
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (23) = happyShift action_22
action_129 (24) = happyShift action_23
action_129 (25) = happyShift action_53
action_129 (26) = happyShift action_25
action_129 (28) = happyShift action_26
action_129 (33) = happyShift action_27
action_129 (34) = happyShift action_28
action_129 (35) = happyShift action_29
action_129 (50) = happyShift action_30
action_129 (52) = happyShift action_31
action_129 (53) = happyShift action_32
action_129 (54) = happyShift action_33
action_129 (55) = happyShift action_34
action_129 (56) = happyShift action_35
action_129 (8) = happyGoto action_14
action_129 (9) = happyGoto action_15
action_129 (14) = happyGoto action_18
action_129 (15) = happyGoto action_19
action_129 (16) = happyGoto action_114
action_129 (17) = happyGoto action_130
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (59) = happyShift action_131
action_130 _ = happyFail (happyExpListPerState 130)

action_131 _ = happyReduce_44

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

happyReduce_56 = happyReduce 5 19 happyReduction_56
happyReduction_56 ((HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (FunctionType (reverse happy_var_2) happy_var_5
	) `HappyStk` happyRest

happyReduce_57 = happySpecReduce_3  19 happyReduction_57
happyReduction_57 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (FunctionType (reverse happy_var_2) Void
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happyReduce 4 19 happyReduction_58
happyReduction_58 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (FunctionType [] happy_var_4
	) `HappyStk` happyRest

happyReduce_59 = happySpecReduce_2  19 happyReduction_59
happyReduction_59 _
	_
	 =  HappyAbsSyn19
		 (FunctionType [] Void
	)

happyReduce_60 = happySpecReduce_0  19 happyReduction_60
happyReduction_60  =  HappyAbsSyn19
		 (FunctionType [] Void
	)

happyReduce_61 = happyReduce 6 20 happyReduction_61
happyReduction_61 (_ `HappyStk`
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
