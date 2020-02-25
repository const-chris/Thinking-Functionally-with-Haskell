type Interval = (Integer, Integer)

isqrt :: Float -> Integer
isqrt x = fst $ until unit (shrinkAroundSqrtOf x) (bound x)

unit :: Interval -> Bool
unit (a, b) = a + 1 == b

shrinkAroundSqrtOf :: Float -> Interval -> Interval
shrinkAroundSqrtOf x (a, b) =
  if x < square m'
    then (a, m)
    else (m, b)
  where
    m = (a + b) `div` 2
    m' = fromIntegral m

bound :: Float -> Interval
bound x = (0, b)
  where
    b = until ((> x) . fromIntegral . square) (* 2) 1

square :: Num a => a -> a
square x = x * x
