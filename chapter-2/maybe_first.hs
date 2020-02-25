-- Eager Beaver's version
first :: (a -> Bool) -> [a] -> Maybe a
first _ [] = Nothing
first p (x:xs)
  | p x = Just x
  | otherwise = first p xs

-- Lazy Susan's version
first' :: (a -> Bool) -> [a] -> Maybe a
first' p xs =
  if null ys
    then Nothing
    else Just (head ys)
  where
    ys = filter p xs
