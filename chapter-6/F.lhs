prove:
> foldl f e xs = foldr (flip f) e (reverse xs)


case []:

> foldl f e []
= { foldl.1 }
> e

> foldr (flip f) e (reverse [])
= { reverse.1 }
> foldr (flip f) e  []
= { foldr.1 }
> e


case (x:xs):

> foldl f e (x:xs)
= { foldl.2 }
> foldl f (f e x) xs

> foldr (flip f) e (reverse (x:xs))
= { reverse.2 }
> foldr (flip f) e (reverse xs ++ [x])
= { lemma 1 }
> foldr (flip f) ((flip f) x e) (reverse xs)
= { definition of flip }
> foldr (flip f) (f e x) (reverse xs)
= { induction }
> foldl f (f e x) xs




lemma 1:
> foldr f e (xs ++ [y]) = foldr f (f y e) xs


case []:

> foldr f e ([] ++ [y])
= { ++.1 }
> foldr f e [y]
= { foldr.2 }
> f x (foldr f e [])
= { foldr.1 }
> f y e

> foldr f (f y e) []
= { foldr.1 }
> f y e


case (x:xs):

> foldr f e ((x:xs) ++ [y])
= { ++.2 }
> foldr f e (x : (xs ++ [y]))
= { foldr.2 }
> f x (foldr f e (xs ++ [y]))

> foldr f (f y e) (x:xs)
= { foldr.2 }
> f x (foldr f (f y e) xs)
= { induction }
> f x (foldr f e (xs ++ [y]))




prove:
> foldl (@) e xs = foldr (<>) e xs
>   when
>     (x <> y) @ z = x <> (y @ z)
>     e @ x = x <> e


case []:

> foldl (@) e []
= { foldl.1 }
> e

> foldr (<>) e []
= { foldr.1 }
> e


case (x:xs):

> foldl (@) e (x:xs)
= { foldl.2 }
> foldl (@) (e @ x) xs
= { proviso 2 }
> foldl (@) (x <> e) xs

>foldr (<>) e (x:xs)
= { foldr.2 }
> x <> (foldr (<>) e xs)
= { induction }
> x <> (foldl (@) e xs)
= { lemma 2 }
> foldl (@) (x <> e) xs




lemma 2:
> foldl (@) (y <> e) xs = y <> (foldl (@) e xs)


case []:

> foldl (@) (y <> e) []
= { foldl.1 }
> y <> e

> y <> (foldl (@) e [])
= { foldl.1 }
> y <> e


case (x:xs):

> foldl (@) (y <> e) (x:xs)
= { foldl.2 }
> foldl (@) ((y <> e) @ x) xs
= { proviso 1 }
> foldl (@) (y <> (e @ x)) xs

> y <> (foldl (@) e (x:xs))
= { foldl.2 }
> y <> (foldl (@) (e @ x) xs)
= { induction }
> foldl (@) (y <> (e @ x)) xs
