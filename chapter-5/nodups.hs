import Data.List (sort)

nodups :: Ord a => [a] -> Bool
nodups xs = and (zipWith (/=) xs' (tail xs'))
  where
    xs' = sort xs
