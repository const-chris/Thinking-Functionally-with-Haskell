splitAt' :: Integer -> [a] -> ([a], [a])
splitAt' _ [] = ([], [])
splitAt' 0 xs = ([], xs)
splitAt' n (x:xs) = (x : ys, zs)
  where
    (ys, zs) = splitAt' (n - 1) xs
