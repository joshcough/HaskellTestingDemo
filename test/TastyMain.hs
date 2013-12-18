import Data.List
import Test.Tasty
import Test.Tasty.SmallCheck as SC
import Test.Tasty.QuickCheck as QC
import Test.Tasty.HUnit

main = defaultMain $ testGroup "Tests" [properties, unitTests]
properties = testGroup "Properties" [scProps, qcProps]

scProps = testGroup "(checked by SmallCheck)"
  [ SC.testProperty "sort == sort . reverse" $ \list -> sort (list :: [Int]) == sort (reverse list) ]

qcProps = testGroup "(checked by QuickCheck)"
  [ QC.testProperty "sort == sort . reverse" $ \list -> sort (list :: [Int]) == sort (reverse list) ]

unitTests = testGroup "Unit tests"
  [ testCase "List comparison (different length)" $ [1, 2, 3] `compare` [1,2] @?= GT ]
