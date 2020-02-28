type Matrix a = [[a]]

mult :: Num a => Matrix a -> Matrix a -> Matrix a
mult m1 m2 = [map (dotProduct r) m2' | r <- m1]
  where
    m2' = transpose m2

transpose :: Matrix a -> Matrix a
transpose [] = repeat []
transpose (x:xs) = zipWith (:) x (transpose xs)

dotProduct :: Num a => [a] -> [a] -> a
dotProduct v1 v2 = sum (zipWith (*) v1 v2)
