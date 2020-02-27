take' :: Integer -> [a] -> [a]
take' 0 _ = []
take' _ [] = []
take' n (x:xs) = x : take' (n - 1) xs

drop' :: Integer -> [a] -> [a]
drop' _ [] = []
drop' 0 xs = xs
drop' n (x:xs) = drop' (n - 1) xs
