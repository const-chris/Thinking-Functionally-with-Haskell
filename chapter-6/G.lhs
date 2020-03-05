using:
(1) foldl f e (xs ++ ys) = foldl f (foldl f e xs) ys
(2) foldr f e (xs ++ ys) = foldr f (foldr f e ys) xs

prove:
> foldl f e . concat = foldl (foldl f) e


case []:

> foldl f e (concat [])
= { concat.1 }
> foldl f e []
= { foldl.1 }
> e

> foldl (foldl f) e []
= { foldl.1 }
> e


case (xs:xss):

> foldl f e (concat (xs:xss))
= { concat.2 }
> foldl f e (xs ++ concat xss)
= { (1) }
> foldl f (foldl f e xs) (concat xss)

> foldl (foldl f) e (xs:xss)
= { foldl.2 }
> foldl (foldl f) (foldl f e xs) xss
= { induction }
> foldl f (foldl f e xs) (concat xss)




prove:
> foldr f e . concat = foldr (flip (foldr f)) e


case []:

> foldr f e (concat [])
= { concat.1 }
> foldr f e []
= { foldr.1 }
> e

> foldr (flip (foldr f)) e []
= { foldr.1 }
> e


case (xs:xss):

> foldr f e (concat (xs:xss))
= { concat.2 }
> foldr f e (xs ++ concat xss)
= { (2) }
> foldr f (foldr f e (concat xss)) xs

> foldr (flip (foldr f)) e (xs:xss)
= { foldr.2 }
> (flip (foldr f)) xs (foldr (flip (foldr f)) e xss)
= { induction }
> (flip (foldr f)) xs (foldr f e (concat xss))
= { definition of flip }
> foldr f (foldr f e (concat xss)) xs
