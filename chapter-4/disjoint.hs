disjoint :: Eq a => [a] -> [a] -> Bool
disjoint xs = null . filter (`elem` xs)
