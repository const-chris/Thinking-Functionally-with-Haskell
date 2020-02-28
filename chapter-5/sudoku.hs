type Row a = [a]

type Matrix a = [Row a]

type Digit = Char

type Grid = Matrix Digit

digits :: [Char]
digits = ['1' .. '9']

blank :: Digit -> Bool
blank = (== '0')

solve :: Grid -> [Grid]
solve = search . choices

choices :: Grid -> Matrix [Digit]
choices = (map . map) possibleDigits
  where
    possibleDigits d =
      if blank d
        then digits
        else [d]

search :: Matrix [Digit] -> [Grid]
search cm
  | not (safe pm) = []
  | complete pm = [extract pm]
  | otherwise = concat (map search (expand1 pm))
  where
    pm = many prune cm

safe :: Matrix [Digit] -> Bool
safe m = all ok (rows m) && all ok (cols m) && all ok (boxs m)
  where
    ok row = nodups [d | [d] <- row]

nodups :: Eq a => [a] -> Bool
nodups [] = True
nodups (x:xs) = x `notElem` xs && nodups xs

complete :: Matrix [Digit] -> Bool
complete = all (all single)

single :: [a] -> Bool
single [_] = True
single _ = False

extract :: Matrix [Digit] -> Grid
extract = (map . map) head

expand1 :: Matrix [Digit] -> [Matrix [Digit]]
expand1 rows =
  [rowsBefore ++ [cellsBefore ++ [d] : cellsAfter] ++ rowsAfter | d <- cell]
  where
    (rowsBefore, row:rowsAfter) = break (any isSmallestNonsingleton) rows
    (cellsBefore, cell:cellsAfter) = break isSmallestNonsingleton row
    isSmallestNonsingleton xs = length xs == n
    n = minimum $ filter (/= 1) $ map length $ concat rows

prune :: Matrix [Digit] -> Matrix [Digit]
prune = pruneBy boxs . pruneBy cols . pruneBy rows
  where
    pruneBy f = f . map pruneRow . f

pruneRow :: Row [Digit] -> Row [Digit]
pruneRow row = map (remove fixed) row
  where
    fixed = [d | [d] <- row]

remove :: [Digit] -> [Digit] -> [Digit]
remove ds [d] = [d]
remove ds xs = filter (`notElem` ds) xs

rows :: Matrix a -> Matrix a
rows = id

cols :: Matrix a -> Matrix a
cols [] = repeat []
cols (xs:xss) = zipWith (:) xs (cols xss)

boxs :: Matrix a -> Matrix a
boxs = map ungroup . ungroup . map cols . group . map group

group :: [a] -> [[a]]
group [] = []
group xs = ys : group zs
  where
    (ys, zs) = splitAt 3 xs

ungroup :: [[a]] -> [a]
ungroup = concat

many :: Eq a => (a -> a) -> a -> a
many f x =
  if x == x'
    then x
    else many f x'
  where
    x' = f x
