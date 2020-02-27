ramanujan :: Integer -> [(Integer, Integer, Integer, Integer)]
ramanujan n =
  [ (a, b, c, d)
  | c <- [1 .. n]
  , a <- [c + 1 .. n]
  , b <- [a .. n]
  , d <- [b + 1 .. n]
  , a ^ 3 + b ^ 3 == c ^ 3 + d ^ 3
  ]
