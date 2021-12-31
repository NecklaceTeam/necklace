module ContextAnalyzerSpec (spec) where
import SpecHelper ( hspec, describe, it, shouldBe, Spec )

import qualified ContextAnalysis.Analyzer as ANZ
import qualified Necklace.AST as AST
import ContextAnalysis.Analyzer (analyze, emptyContext)


spec :: Spec
spec = describe "ContextAnalysis" $ do
  let intLit = AST.IntLiteral 2
  let intLitExpr = AST.LiteralExpression intLit
  let boolLit = AST.BoolLiteral True
  let boolLitExpr = AST.LiteralExpression boolLit
  let ctx = emptyContext
  describe "literal type" $ do
    it "returns int literal types" $ do
      analyze ctx (ANZ.literalType intLit) `shouldBe` (Right ANZ.Int, ctx)
    it "returns bool literal types" $ do
       analyze ctx (ANZ.literalType boolLit) `shouldBe` (Right ANZ.Bool, ctx)
    it "returns int array literal type" $ do
      analyze ctx (ANZ.literalType (AST.ArrayLiteral [intLit, intLit])) `shouldBe` (Right (ANZ.Array ANZ.Int), ctx)
    it "returns empty array literal type" $ do
      analyze ctx (ANZ.literalType (AST.ArrayLiteral [])) `shouldBe` (Right (ANZ.Array ANZ.Any), ctx)

  describe "expression type" $ do
    it "parses literal expr" $ do
       let ast = ANZ.expressionType intLitExpr
       let valid = (Right ANZ.Int, ctx)
       analyze ctx ast `shouldBe` valid
    it "parses plus expr" $ do
       let ast = ANZ.expressionType (AST.Operation (AST.Plus intLitExpr intLitExpr))
       let valid = (Right ANZ.Int, ctx)
       analyze ctx ast `shouldBe` valid
    it "parses plus expr" $ do
       let ast = ANZ.expressionType (AST.Operation (AST.Plus intLitExpr boolLitExpr))
       let valid = (Left "Plus has type Int x Int -> Int", ctx)
       analyze ctx ast `shouldBe` valid
    it "parses complex expression" $ do
      let complexExp = AST.SubExpression (
                  AST.SubExpression (
                    AST.Operation (
                      AST.Plus
                        intLitExpr
                        intLitExpr
                    )
                  )
                )
      analyze ctx (ANZ.expressionType complexExp) `shouldBe`(Right ANZ.Int, ctx)

    it "parses complex expression" $ do
      let complexExp = AST.SubExpression (
                  AST.SubExpression (
                    AST.Operation (
                      AST.Plus
                        intLitExpr
                        (
                          AST.Operation 
                          (
                            AST.Divide intLitExpr intLitExpr
                          )
                        )
                    )
                  )
                )
      analyze ctx (ANZ.expressionType complexExp) `shouldBe`(Right ANZ.Int, ctx)

    it "parses complex expression" $ do
      let complexExp = AST.SubExpression (
                  AST.SubExpression (
                    AST.Operation (
                      AST.Equal
                        intLitExpr
                        (
                          AST.Operation 
                          (
                            AST.Divide intLitExpr intLitExpr
                          )
                        )
                    )
                  )
                )
      analyze ctx (ANZ.expressionType complexExp) `shouldBe`(Left "Minus has type Bool x Bool -> Bool", ctx)


main :: IO ()
main = hspec spec