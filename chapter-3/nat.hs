data Nat
  = Zero
  | Succ Nat
  deriving (Eq, Show)

instance Num Nat where
  Zero + x = x
  (Succ x) + y = Succ (x + y)
  Zero * x = Zero
  (Succ x) * y = x * y + y
  abs x = x
  signum Zero = Zero
  signum (Succ x) = Succ Zero
  x - Zero = x
  Zero - Succ x = Zero
  Succ x - Succ y = x - y
  fromInteger x
    | x <= 0 = Zero
    | otherwise = Succ $ fromInteger $ x - 1

instance Ord Nat where
  compare Zero Zero = EQ
  compare Zero (Succ x) = LT
  compare (Succ x) Zero = GT
  compare (Succ x) (Succ y) = compare x y

divMod' :: Nat -> Nat -> (Nat, Nat)
divMod' x y = until ((< y) . snd) next (0, x)
  where
    next (a, b) = (a + 1, b - y)
