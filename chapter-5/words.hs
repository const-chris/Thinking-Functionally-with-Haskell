import Data.Char (isSpace)

words' :: String -> [String]
words' cs =
  if null cs'
    then []
    else w : words' cs''
  where
    cs' = dropWhile isSpace cs
    (w, cs'') = break isSpace cs'
