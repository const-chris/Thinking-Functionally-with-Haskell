takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' p [] = []
takeWhile' p (x:xs) =
  if p x
    then x : takeWhile' p xs
    else []
