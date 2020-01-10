import Control.Monad
import Data.Char
import Data.List
import Data.Ord

cwords :: Int -> String -> String
cwords n =
  concat .
  map showRun .
  take n . sortBy (comparing Down) . countRuns . sort . words . map toLower

countRuns :: [String] -> [(Int, String)]
countRuns = map (liftM2 (,) length head) . group

showRun :: (Int, String) -> String
showRun (count, word) = word ++ ": " ++ show count ++ "\n"
