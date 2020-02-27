class Bifunctor p where
  bimap :: (a -> b) -> (c -> d) -> p a c -> p b d

data Either' a b
  = Left' a
  | Right' b

instance Bifunctor Either' where
  bimap f g (Left' a) = Left' (f a)
  bimap f g (Right' b) = Right' (g b)
