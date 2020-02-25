first :: (a -> Bool) -> [a] -> a
first _ [] = error "Empty list"
first p (x:xs)
  | p x = x
  | otherwise = first p xs
