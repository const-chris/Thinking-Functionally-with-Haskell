import Data.List (sort)

nub :: Eq a => [a] -> [a]
nub [] = []
nub (x:xs) = x : nub (filter (/= x) xs)

nub' :: Ord a => [a] -> [a]
nub' = remdups . sort
  where
    remdups [] = []
    remdups (x:xs) = x : remdups (dropWhile (== x) xs)
