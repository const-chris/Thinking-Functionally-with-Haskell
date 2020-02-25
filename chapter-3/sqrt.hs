sqrt' :: Float -> Float
sqrt' x = until goodEnough improve 1
  where
    goodEnough y = abs (y * y - x) < epsilon * x
    improve y = avg y (x / y)
    epsilon = 0.000001

avg :: Fractional a => a -> a -> a
avg a b = (a + b) / 2
