import Data.Function
import Data.List
import Data.Ord

anagrams :: Int -> [String] -> String
anagrams n =
  tail .
  concat .
  map (display . combine) .
  groupBy sameLetters . sort . map pairWithOwnLetters . filter ((== n) . length)

pairWithOwnLetters :: String -> (String, String)
pairWithOwnLetters s = (sort s, s)

sameLetters :: (String, String) -> (String, String) -> Bool
sameLetters = (==) `on` fst

combine :: [(String, String)] -> (String, [String])
combine xs = (fst (head xs), map snd xs)

display :: (String, [String]) -> String
display (x, ys) = "\n" ++ x ++ ": " ++ intercalate ", " ys
