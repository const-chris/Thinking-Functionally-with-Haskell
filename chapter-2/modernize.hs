import Data.Char (toUpper)

modernize :: String -> String
modernize = unwords . map capitalize . words

capitalize :: String -> String
capitalize (x:xs) = toUpper x : xs
