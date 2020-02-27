data List a
  = Nil
  | Snoc (List a) a
  deriving (Eq, Ord, Show)

head' :: List a -> a
head' (Snoc Nil x) = x
head' (Snoc xs x) = head' xs

last' :: List a -> a
last' (Snoc _ x) = x

toList :: [a] -> List a
toList = listify . reverse
  where
    listify [] = Nil
    listify (x:xs) = Snoc (listify xs) x

fromList :: List a -> [a]
fromList = reverse . unlistify
  where
    unlistify Nil = []
    unlistify (Snoc xs x) = x : unlistify xs
