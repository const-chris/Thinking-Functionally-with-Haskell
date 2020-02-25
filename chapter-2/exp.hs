exp' :: Integer -> Integer -> Integer
exp' x n
  | n == 0 = 1
  | n == 1 = x
  | even n = exp' (x * x) n'
  | odd n = x * exp' (x * x) n'
  where
    n' = n `div` 2
