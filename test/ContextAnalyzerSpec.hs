module ContextAnalyzerSpec (spec) where
import SpecHelper ( hspec, describe, it, shouldBe, Spec )

import qualified ContextAnalysis.Analyzer as ANZ
import qualified Necklace.AST as AST
import ContextAnalysis.Analyzer (analyzeFunction, emptyContext)


spec :: Spec
spec = describe "ContextAnalysis" $ do
  let intLit = AST.IntLiteral 2
  let boolLit = AST.BoolLiteral True
  let funcCtx = ANZ.emptyFunctionContext ANZ.Undefined

  describe "expression type" $ do
    it "parses correct int expression" $ do
       let ast = AST.SubExpression (
                  AST.Operation (
                    AST.Plus
                      (AST.LiteralExpression intLit)
                      (AST.LiteralExpression intLit)
                    )
                  )
       analyzeFunction funcCtx (ANZ.expressionType ast) `shouldBe` (Right ANZ.Int, funcCtx)
    it "parses correct bool expression" $ do
       let ast = AST.SubExpression (
                  AST.Operation (
                    AST.And
                      (AST.LiteralExpression boolLit)
                      (AST.LiteralExpression boolLit)
                    )
                  )
       analyzeFunction funcCtx (ANZ.expressionType ast) `shouldBe` (Right ANZ.Bool, funcCtx)
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
       analyzeFunction funcCtx (ANZ.expressionType ast) `shouldBe` (Right ANZ.Bool, funcCtx)
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
       analyzeFunction funcCtx (ANZ.expressionType ast) `shouldBe` (Right ANZ.Bool, funcCtx)

main :: IO ()
main = hspec spec