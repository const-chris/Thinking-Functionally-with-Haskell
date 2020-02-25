type CIN = String

valid :: CIN -> Bool
valid cin = addSum (take 8 cin) == cin

addSum :: CIN -> CIN
addSum xs = xs ++ show checksum
  where
    checksum = sum (map getDigit xs)

getDigit :: Char -> Int
getDigit c = read [c]
