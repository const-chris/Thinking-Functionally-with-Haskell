import Control.Monad

units =
  [ "zero"
  , "one"
  , "two"
  , "three"
  , "four"
  , "five"
  , "six"
  , "seven"
  , "eight"
  , "nine"
  ]

teens =
  [ "ten"
  , "eleven"
  , "twelve"
  , "thirteen"
  , "fourteen"
  , "fifteen"
  , "sixteen"
  , "seventeen"
  , "eighteen"
  , "nineteen"
  ]

tens =
  [ "zero"
  , "ten"
  , "twenty"
  , "thirty"
  , "forty"
  , "fifty"
  , "sixty"
  , "seventy"
  , "eighty"
  , "ninety"
  ]

orders = ["zero", "thousand", "million", "billion", "trillion", "quadrillion"]

convert :: Int -> String
convert = ap convertMany order

convert2 :: Int -> String
convert2 n
  | t == 0 = units !! u
  | t == 1 = teens !! u
  | u == 0 = tens !! t
  | otherwise = tens !! t ++ "-" ++ units !! u
  where
    (t, u) = n `divMod` 10

convert3 :: Int -> String
convert3 n
  | h == 0 = convert2 t
  | t == 0 = units !! h ++ " hundred"
  | otherwise = units !! h ++ " hundred " ++ convert2 t
  where
    (h, t) = n `divMod` 100

convertMany :: Int -> Int -> String
convertMany n order
  | order < 3 = convert3 n
  | otherwise =
    convert3 h ++ " " ++ orders !! o ++ " " ++ convertMany t (order - 3)
  where
    o = order `div` 3
    (h, t) = n `divMod` (10 ^ (o * 3))

order :: Int -> Int
order 0 = -1
order n = 1 + order (n `div` 10)
