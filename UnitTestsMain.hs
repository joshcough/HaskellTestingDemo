import Test.Framework.Providers.API
import Test.Framework.Providers.HUnit
import Test.Framework.Runners.Console
import Test.HUnit

main = defaultMain $ [testGroup "Main" tests]

tests = [
  testCase "a passing test!" $ 5 @?= 5
 ,testCase "a failing test!" $ 5 @?= 6 ]
