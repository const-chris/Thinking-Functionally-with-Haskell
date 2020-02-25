type Interval = (Integer, Integer)

floor' :: Float -> Integer
floor' x = fst $ until unit (shrinkAround x) (bound x)

unit :: Interval -> Bool
unit (a, b) = a + 1 == b

shrinkAround :: Float -> Interval -> Interval
shrinkAround x (a, b) =
  if x <= m'
    then (a, m)
    else (m, b)
  where
    m = (a + b) `div` 2
    m' = fromIntegral m

bound :: Float -> Interval
bound x = (a, b)
  where
    a = until ((<= x) . fromIntegral) (* 2) (-1)
    b = until ((>= x) . fromIntegral) (* 2) 1
