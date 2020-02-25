import Data.Char (isAlpha, toLower)

main :: IO ()
main = do
  putStrLn "Enter a string"
  input <- getLine
  putStrLn $
    if isPalindrome input
      then "Yes!"
      else "No."

isPalindrome :: String -> Bool
isPalindrome xs = (xs' == reverse xs')
  where
    xs' = map toLower $ filter isAlpha xs
