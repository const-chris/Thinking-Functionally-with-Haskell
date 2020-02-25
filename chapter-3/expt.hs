(^^*) :: (Fractional a, Integral b) => a -> b -> a
x ^^* n =
  if n < 0
    then recip $ x ^ (abs n)
    else x ^ n
