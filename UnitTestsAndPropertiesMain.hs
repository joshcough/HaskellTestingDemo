{-# LANGUAGE TemplateHaskell #-}

import Test.Framework.Providers.API
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2
import Test.Framework.Runners.Console
import Test.Framework.TH
import Test.HUnit
import Test.QuickCheck

main = defaultMain $ [unitTests, props]

unitTests = testGroup "HUnit tests" [
  testCase "a passing test!" $ 5 @?= 5
 ,testCase "a failing test!" $ 5 @?= 6 ]

prop_list_reverse_reverse :: [Int] -> Bool
prop_list_reverse_reverse list = list == reverse (reverse list)
props = $testGroupGenerator
