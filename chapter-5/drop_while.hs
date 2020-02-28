dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' p [] = []
dropWhile' p (x:xs) =
  if p x
    then dropWhile' p xs
    else x : xs
