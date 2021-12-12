module LexerSpec (spec) where
import SpecHelper ( hspec, describe, it, shouldBe, Spec )  
import Prelude hiding(lex)
import Compiler.Parser.Lexer
spec :: Spec
spec = describe "Lexer" $ do
  describe "Comments" $ do
    it "ignores comments" $ do
      lex "~~Some comment" `shouldBe` Right [L (AlexPn (-1) (-1) (-1)) TokenEOF ""]
    it "does not ignore tokens before the comment" $ do
      lex "2~~Some comment" `shouldBe` Right [L (AlexPn 0 1 1) TokenIntLiteral "2",L (AlexPn (-1) (-1) (-1)) TokenEOF ""]
    it "does not ignore tokens after \\n" $ do
      lex "~~Some comment\n2" `shouldBe` Right [L (AlexPn 15 2 1) TokenIntLiteral "2",L (AlexPn (-1) (-1) (-1)) TokenEOF ""]

  describe "Whitespaces" $ do
    it "ignores whitespaces" $ do
      lex "\n\n\n    " `shouldBe` Right [L (AlexPn (-1) (-1) (-1)) TokenEOF ""]

  describe "Keywords" $ do
    it "function scan" $ do 
      runAlex "function" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenKeyword "function")
    it "do scan" $ do 
      runAlex "do" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenKeyword "do")
    it "end scan" $ do 
      runAlex "end" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenKeyword "end")
    it "void scan" $ do 
      runAlex "void" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenKeyword "void")
    it "if scan" $ do 
      runAlex "if" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenKeyword "if")
    it "else scan" $ do 
      runAlex "else" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenKeyword "else")
    it "for scan" $ do 
      runAlex "for" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenKeyword "for")
    it "while scan" $ do 
      runAlex "while" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenKeyword "while")
    it "return scan" $ do 
      runAlex "return" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenKeyword "return")
    it "break scan" $ do 
      runAlex "break" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenKeyword "break")
    it "continue scan" $ do 
      runAlex "continue" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenKeyword "continue")
    it "-> scan" $ do 
      runAlex "->" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenKeyword "->")
    it "differs between keyword and id" $ do
      lex "function function1" `shouldBe` Right [L (AlexPn 0 1 1) TokenKeyword "function",L (AlexPn 9 1 10) TokenId "function1",L (AlexPn (-1) (-1) (-1)) TokenEOF ""]
  
  describe "Ids" $ do
    it "valid id" $ do
      runAlex "___VariablE123" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenId "___VariablE123")
    it "invalid id: wrong beginning" $ do
      runAlex "1variable" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenIntLiteral "1")
    it "Error on non ASCII character" $ do
      runAlex "ą" alexMonadScan `shouldBe` Left "lexical error at line 1, column 1"
    
  describe  "Operators" $ do
    it "+ scan" $ do 
      runAlex "+" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenOperator "+")
    it "- scan" $ do 
      runAlex "-" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenOperator "-")
    it "/ scan" $ do 
      runAlex "/" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenOperator "/")
    it "* scan" $ do 
      runAlex "*" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenOperator "*")
    it "% scan" $ do 
      runAlex "%" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenOperator "%")
    it "< scan" $ do 
      runAlex "<" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenOperator "<")
    it "> scan" $ do 
      runAlex ">" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenOperator ">")
    it ">= scan" $ do 
      runAlex ">=" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenOperator ">=")
    it "<= scan" $ do 
      runAlex "<=" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenOperator "<=")
    it "== scan" $ do 
      runAlex "==" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenOperator "==")
    it "!= scan" $ do 
      runAlex "!=" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenOperator "!=")
    it "! scan" $ do 
      runAlex "!" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenOperator "!")
    it "&& scan" $ do 
      runAlex "&&" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenOperator "&&")
    it "|| scan" $ do 
      runAlex "||" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenOperator "||")

  describe "types and literals" $ do 
    it "int literal scan" $ do
      runAlex "500" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenIntLiteral "500")
    it "bool literal scan" $ do
      runAlex "false" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenBoolLiteral "false")
    it "bool type scan" $ do
      runAlex "bool" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenType "bool")
    it "int type scan" $ do
      runAlex "int" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenType "int")
    it "types are case-sensitive" $ do
      runAlex "Int" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenId "Int")

  describe  "Specials" $ do
    it "( scan" $ do 
      runAlex "(" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenSpecial "(")
    it ") scan" $ do 
      runAlex ")" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenSpecial ")")
    it ", scan" $ do 
      runAlex "," alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenSpecial ",")
    it "; scan" $ do 
      runAlex ";" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenSpecial ";")
    it ": scan" $ do 
      runAlex ":" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenSpecial ":")
    it "[ scan" $ do 
      runAlex "[" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenSpecial "[")
    it "] scan" $ do 
      runAlex "]" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenSpecial "]")
    it "{ scan" $ do 
      runAlex "{" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenSpecial "{")
    it "} scan" $ do 
      runAlex "}" alexMonadScan `shouldBe` Right (L (AlexPn 0 1 1) TokenSpecial "}")

main :: IO ()
main = hspec spec