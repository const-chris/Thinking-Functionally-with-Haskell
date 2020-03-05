> data Nat = Zero | Succ Nat

> foldNat :: (a -> a) -> a -> Nat -> a
> foldNat f e Zero = e
> foldNat f e (Succ n) = f (foldNat f e x)


> data NEList a = One a | Cons a (NEList a)

> foldNE :: (a -> b -> b) -> (a -> b) -> NEList a -> b
> foldNE f g (One x) = g x
> foldNE f g (Cons x xs) = f x (foldNE f g xs)
