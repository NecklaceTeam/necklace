module LexerSpec (spec) where
import SpecHelper ( hspec, describe, it, shouldBe, Spec )  
import Prelude hiding(lex)
import Compiler.Parser.Lexer
spec :: Spec
spec = describe "Lexer" $ do
  describe "Comments" $ do
    it "ignores comments" $ do
      lex "~~Some comment" `shouldBe` Right [Lexeme (AlexPn (-1) (-1) (-1)) TokenEOF]
    it "ignores block comments" $ do
      lex "/* Some comment \n Some second comment \n Some third comment */" `shouldBe` Right [Lexeme (AlexPn (-1) (-1) (-1)) TokenEOF]
    it "does not ignore tokens before the comment" $ do
      lex "2~~Some comment" `shouldBe` Right [Lexeme (AlexPn 0 1 1) (TokenIntLiteral 2),Lexeme (AlexPn (-1) (-1) (-1)) TokenEOF]
    it "does not ignore tokens after \\n" $ do
      lex "~~Some comment\n2" `shouldBe` Right [Lexeme (AlexPn 15 2 1) (TokenIntLiteral 2),Lexeme (AlexPn (-1) (-1) (-1)) TokenEOF]

  describe "Whitespaces" $ do
    it "ignores whitespaces" $ do
      lex "\n\n\n    " `shouldBe` Right [Lexeme (AlexPn (-1) (-1) (-1)) TokenEOF]

  describe "Keywords" $ do
    it "function scan" $ do 
      runAlex "function" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenKeyword "function"))
    it "do scan" $ do 
      runAlex "do" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenKeyword "do"))
    it "end scan" $ do 
      runAlex "end" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenKeyword "end"))
    it "void scan" $ do 
      runAlex "void" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenKeyword "void"))
    it "if scan" $ do 
      runAlex "if" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenKeyword "if"))
    it "else scan" $ do 
      runAlex "else" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenKeyword "else"))
    it "for scan" $ do 
      runAlex "for" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenKeyword "for"))
    it "while scan" $ do 
      runAlex "while" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenKeyword "while"))
    it "return scan" $ do 
      runAlex "return" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenKeyword "return"))
    it "break scan" $ do 
      runAlex "break" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenKeyword "break"))
    it "continue scan" $ do 
      runAlex "continue" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenKeyword "continue"))
    it "-> scan" $ do 
      runAlex "->" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenKeyword "->"))
    it "differs between keyword and id" $ do
      lex "function function1" `shouldBe` Right [Lexeme (AlexPn 0 1 1) (TokenKeyword "function"),Lexeme (AlexPn 9 1 10) (TokenId "function1"),Lexeme (AlexPn (-1) (-1) (-1)) TokenEOF]
  
  describe "Ids" $ do
    it "valid id" $ do
      runAlex "___VariablE123" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenId "___VariablE123"))
    it "invalid id: wrong beginning" $ do
      runAlex "1variable" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenIntLiteral 1))
    it "Error on non ASCII character" $ do
      runAlex "ą" alexMonadScan `shouldBe` Left "lexical error at line 1, column 1"
    
  describe  "Operators" $ do
    it "+ scan" $ do 
      runAlex "+" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenOperator "+"))
    it "- scan" $ do 
      runAlex "-" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenOperator "-"))
    it "/ scan" $ do 
      runAlex "/" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenOperator "/"))
    it "* scan" $ do 
      runAlex "*" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenOperator "*"))
    it "% scan" $ do 
      runAlex "%" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenOperator "%"))
    it "< scan" $ do 
      runAlex "<" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenOperator "<"))
    it "> scan" $ do 
      runAlex ">" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenOperator ">"))
    it ">= scan" $ do 
      runAlex ">=" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenOperator ">="))
    it "<= scan" $ do 
      runAlex "<=" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenOperator "<="))
    it "== scan" $ do 
      runAlex "==" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenOperator "=="))
    it "!= scan" $ do 
      runAlex "!=" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenOperator "!="))
    it "! scan" $ do 
      runAlex "!" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenOperator "!"))
    it "&& scan" $ do 
      runAlex "&&" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenOperator "&&"))
    it "|| scan" $ do 
      runAlex "||" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenOperator "||"))

  describe "types and literals" $ do 
    it "int literal scan" $ do
      runAlex "500" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenIntLiteral 500))
    it "bool literal scan" $ do
      runAlex "false" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenBoolLiteral "false"))
    it "bool type scan" $ do
      runAlex "bool" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenType "bool"))
    it "int type scan" $ do
      runAlex "int" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenType "int"))
    it "types are case-sensitive" $ do
      runAlex "Int" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) (TokenId "Int"))

  describe  "Specials" $ do
    it "( scan" $ do 
      runAlex "(" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) TokenLeftParen)
    it ") scan" $ do 
      runAlex ")" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) TokenRightParen)
    it ", scan" $ do 
      runAlex "," alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) TokenComma)
    it "; scan" $ do 
      runAlex ";" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) TokenSemicolon)
    it ": scan" $ do 
      runAlex ":" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) TokenColon)
    it "[ scan" $ do 
      runAlex "[" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) TokenSquareLeftParen)
    it "] scan" $ do 
      runAlex "]" alexMonadScan `shouldBe` Right (Lexeme (AlexPn 0 1 1) TokenSquareRightParen)

    describe "Multiple token usage" $ do 
      it "variable declaration" $ do
        lex "int x = 21" `shouldBe` Right [Lexeme (AlexPn 0 1 1) (TokenType "int"),Lexeme (AlexPn 4 1 5) (TokenId "x"),Lexeme (AlexPn 6 1 7) (TokenOperator "="),Lexeme (AlexPn 8 1 9) (TokenIntLiteral 21),Lexeme (AlexPn (-1) (-1) (-1)) TokenEOF]
      it "function declaration" $ do 
        lex "function do_stuff(a: int, b: int) -> int do \n return 2 + 2; \n end" `shouldBe` Right [Lexeme (AlexPn 0 1 1) (TokenKeyword "function"),Lexeme (AlexPn 9 1 10) (TokenId "do_stuff"),Lexeme (AlexPn 17 1 18) TokenLeftParen,Lexeme (AlexPn 18 1 19) (TokenId "a"),Lexeme (AlexPn 19 1 20) TokenColon,Lexeme (AlexPn 21 1 22) (TokenType "int"),Lexeme (AlexPn 24 1 25) TokenComma,Lexeme (AlexPn 26 1 27) (TokenId "b"),Lexeme (AlexPn 27 1 28) TokenColon,Lexeme (AlexPn 29 1 30) (TokenType "int"),Lexeme (AlexPn 32 1 33) TokenRightParen,Lexeme (AlexPn 34 1 35) (TokenKeyword "->"),Lexeme (AlexPn 37 1 38) (TokenType "int"),Lexeme (AlexPn 41 1 42) (TokenKeyword "do"),Lexeme (AlexPn 46 2 2) (TokenKeyword "return"),Lexeme (AlexPn 53 2 9) (TokenIntLiteral 2),Lexeme (AlexPn 55 2 11) (TokenOperator "+"),Lexeme (AlexPn 57 2 13) (TokenIntLiteral 2),Lexeme (AlexPn 58 2 14) TokenSemicolon,Lexeme (AlexPn 62 3 2) (TokenKeyword "end"),Lexeme (AlexPn (-1) (-1) (-1)) TokenEOF]

main :: IO ()
main = hspec spec