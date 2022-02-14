module ContextAnalyzerSpec (spec) where
import SpecHelper ( hspec, describe, it, shouldBe, Spec )

import qualified ContextAnalysis.Analyzer as ANZ
import qualified ContextAnalysis.AnalyzerTypes as ANT
import qualified Necklace.AST as AST
import ContextAnalysis.Analyzer (analyzeFunction, emptyContext, validateFunction)


spec :: Spec
spec = describe "ContextAnalysis" $ do
  let intLit = AST.IntLiteral 2
  let boolLit = AST.BoolLiteral True
  let funcCtx = ANZ.emptyFunctionContext ANT.Undefined

  describe "expression type" $ do
    it "parses correct int expression" $ do
       let ast = AST.SubExpression (
                  AST.Operation (
                    AST.Plus
                      (AST.LiteralExpression intLit)
                      (AST.LiteralExpression intLit)
                    )
                  )
       analyzeFunction funcCtx (ANZ.expressionType ast) `shouldBe` (Right ANT.Int, funcCtx)
    it "parses correct bool expression" $ do
       let ast = AST.SubExpression (
                  AST.Operation (
                    AST.And
                      (AST.LiteralExpression boolLit)
                      (AST.LiteralExpression boolLit)
                    )
                  )
       analyzeFunction funcCtx (ANZ.expressionType ast) `shouldBe` (Right ANT.Bool, funcCtx)
    it "throws error if lits incorrect" $ do
       let ast = AST.SubExpression (
                  AST.Operation (
                    AST.And
                      (AST.LiteralExpression boolLit)
                      (AST.LiteralExpression intLit)
                    )
                  )
       analyzeFunction funcCtx (ANZ.expressionType ast) `shouldBe` (Left "And has type Bool x Bool -> Bool", funcCtx)
    it "performs correct negation" $ do
       let ast = AST.SubExpression (
                  AST.Operation (
                    AST.And
                      (AST.LiteralExpression boolLit)
                      (AST.Operation (
                        AST.Negation (
                          AST.LiteralExpression boolLit
                          )
                        )
                      )
                    )
                  )
       analyzeFunction funcCtx (ANZ.expressionType ast) `shouldBe` (Right ANT.Bool, funcCtx)
    it "performs correct negation" $ do
       let ast = AST.SubExpression (
                  AST.Operation (
                    AST.And
                      (AST.LiteralExpression boolLit)
                      (AST.Operation (
                        AST.Negation (
                          AST.LiteralExpression boolLit
                          )
                        )
                      )
                    )
                  )
       analyzeFunction funcCtx (ANZ.expressionType ast) `shouldBe` (Right ANT.Bool, funcCtx)

    it "throws error if array elements evaluate to different types" $ do
      let ast = AST.SubExpression (
              AST.LiteralExpression (
                AST.ArrayLiteral [
                  AST.LiteralExpression intLit, 
                  AST.Operation (
                          AST.And
                            (AST.LiteralExpression boolLit)
                            (AST.LiteralExpression boolLit)
                            ), AST.LiteralExpression intLit]))               
      analyzeFunction funcCtx (ANZ.expressionType ast) `shouldBe` (Left "All values in array must be of the same type", funcCtx)

    it "parses correctly an array" $ do
      let ast = AST.SubExpression (
              AST.LiteralExpression (
                AST.ArrayLiteral [
                  AST.LiteralExpression boolLit, 
                  AST.Operation (
                          AST.And
                            (AST.LiteralExpression boolLit)
                            (AST.LiteralExpression boolLit)
                            ), AST.LiteralExpression boolLit]))          
      analyzeFunction funcCtx (ANZ.expressionType ast) `shouldBe` (Right (ANT.Array ANT.Bool), funcCtx)
    it "parses correctly one element array" $ do
      let ast = AST.SubExpression (
              AST.LiteralExpression (
                AST.ArrayLiteral [
                  AST.LiteralExpression boolLit ]))
      analyzeFunction funcCtx (ANZ.expressionType ast) `shouldBe` (Right (ANT.Array ANT.Bool), funcCtx)
  
  describe "duplicate names" $ do
    it "throws error on duplicate variable name" $ do
      let ast = AST.Function "test" [AST.Declaration "ab" AST.Int] (AST.Void) (AST.FunctionBody [AST.Declaration "ab" AST.Int] [AST.VoidReturnStatement])
      fst(analyzeFunction funcCtx (validateFunction ast)) `shouldBe` Left "Variable ab is already declared in this scope"

main :: IO ()
main = hspec spec