> scanr f e = map (foldr f e) . tails


case []:

> map (foldr f e) (tails [])
= { tails.1 }
> map (foldr f e) [[]]
= { map.2 }
> foldr f e [] : map (foldr f e) []
= { foldr.1 }
> e : map (foldr f e) []
= { map.1 }
> e : []
= { (:).1 }
> [e]


case (x:xs):

> map (foldr f e) (tails (x:xs))
= { tails.2 }
> map (foldr f e) ((x:xs) : tails xs)
= { map.2 }
> foldr f e (x:xs) : map (foldr f e) (tails xs)
= { scanr specification }
> foldr f e (x:xs) : scanr f e xs
= { foldr.2 }
> f x (foldr f e xs) : scanr f e xs
= { lemma 1 }
> f x (head (scanr f e xs)) : scanr f e xs
= { pattern matching }
> f x q : qs
    where
      qs @ (q:_) = scanr f e xs


Efficient definition:
> scanr :: (a -> b -> b) -> b -> [a] -> [b]
> scanr f e [] = [e]
> scanr f e (x:xs) = f x q : qs
>   where
>     qs @ (q:_) = scanr f e xs




lemma 1:
> head (scanr f e xs) = foldr f e xs


case []:

> head (scanr f e [])
= { scanr.1 }
> head [e]
= { head.1 }
> e


case (y:ys):

> head (scanr f e (y:ys))
= { scanr specification }
> head (map (foldr f e) (tails (y:ys)))
= { tails.2 }
> head (map (foldr f e) ((y:ys) : tails ys))
= { map.2 }
> head (foldr f e (y:ys) : map (foldr f e) (tails ys))
= { head.1 }
> foldr f e (y:ys)
