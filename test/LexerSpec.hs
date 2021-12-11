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
    it "differs between keyword and varId" $ do
      lex "function function1" `shouldBe` Right [L (AlexPn 0 1 1) TokenKeyword "function",L (AlexPn 9 1 10) TokenVarId "function1",L (AlexPn (-1) (-1) (-1)) TokenEOF ""]

main :: IO ()
main = hspec spec