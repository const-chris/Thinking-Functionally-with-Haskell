Specification:
> mss :: [Int] -> Int
> mss = maximum . map sum . subseqs

> subseqs :: [a] -> [[a]]
> subseqs [] = [[]]
> subseqs (x:xs) = xss ++ map (x:) xss
>   where
>     xss = subseqs xs


> subseqs [] = foldr op e []
> e = [[]]

> subseqs (x:xs) = foldr op [[]] (x:xs) -- (1)
= { foldr.2 }
> op x (foldr op [[]] xs)
= { induction }
> op x (subseqs xs)
= { specification }
> op x xss
= { specification }
> xss ++ map (x:) xss -- (2)


> map sum . subseqs
= { (1) }
> map sum . foldr op [[]]
= { fusion }
> foldr h1 b1 -- (3)
>   where
>     b = map sum [[]] = [0]
>     h1 x (map sum xs) = map sum (op x xs)

>     h1 x (map sum xs)
=     { (2) }
>     map sum (xs ++ map (x:) xs)
=     { claim 1 }
>     map sum xs ++ map sum (map (x:) xs)
=     { functor law of map }
>     map sum xs ++ map (sum . (x:)) xs
=     { claim 2 }
>     map sum xs ++ map ((x+) . sum) xs
=     { functor law of map }
>     map sum xs ++ map (x+) (map sum xs)
so,   { renaming }
>     h1 x xs = xs ++ map (x+) xs -- (4)


> maximum . map sum . subseqs
= { (3) }
> maximum . foldr h1 [0]
= { fusion }
> foldr h2 b2
>   where
>     b2 = maximum [0] = 0
>     h2 x (maximum xs) = maximum (h1 x xs)

>     h2 x (maximum xs)
=     { (4) }
>     maximum (xs ++ map (x+) xs)
=     { maximum.1 }
>     foldr1 max (xs ++ map (x+) xs)
=     { [] ∈ subseqs ys
      , so 0 ∈ map sum (subseqs ys)
      , so claim 4
      }
>     foldr max 0 (xs ++ map (x+) xs)
=     { foldr max 0 ys >= 0
      , so foldr identity p.118
      }
>     (foldr max 0 xs) `max` (foldr max 0 (map (x+) xs)
=     { maximum.1 }
>     (maximum xs) `max` (maximum (map (x+) xs))
=     { claim 3 }
>     (maximum xs) `max` (x + maximum xs)
so,   { renaming }
>     h2 x y = y `max` (x + y)


> mss = foldr f 0
>   where
>     f x y = y `max` (x + y)




claim 1:
> map f (xs ++ ys) = map f xs ++ map f ys


case []:

> map f ([] ++ ys)
= { (++).1 }
> map f ys

> map f [] ++ map f ys
= { map.1 }
> [] ++ map f ys
= { (++).1 }
> map f ys


case (x:xs):

> map f ((x:xs) ++ ys)
= { (++).2 }
> map f (x : (xs ++ ys))
= { map.2 }
> f x : (map f (xs ++ ys))

> map f (x:xs) ++ map f ys
= { map.2 }
> (f x : map f xs) ++ map f ys
= { (++).2 }
> f x : (map f xs ++ map f ys)
= { induction }
> f x : (map f (xs ++ ys))




claim 2:
> sum . (x:) = (x+) . sum


case []:

> sum (x:[])
= { sum.2 }
> x + sum []
= { sum.1 }
> x + 0

> x + (sum [])
= { sum.1 }
> x + 0


case (y:ys):

> sum (x:y:ys)
= { sum.2 }
> x + sum (y:ys)




claim 3:
> maximum . map (x+) = (x+) . maximum

case [y]:

> maximum (map (x+) [y])
= { map.2 }
> maximum (x + y : map (x+) [])
= { map.1 }
> maximum (x + y : [])
= { (:).1 }
> maximum [x + y]
= { maximum.1 }
> x + y

> x + maximum [y]
= { maximum.1 }
> x + y


case (y:ys):

> maximum (map (x+) (y:ys))
= { map.2 }
> maximum (x + y : map (x+) ys)
= { maximum.2 }
> (x + y) `max` (maximum (map (x+) ys)

> x + maximum (y:ys)
= { maximum.2 }
> x + (y `max` maximum ys)
= { distribution of + over max }
> (x + y) `max` (x + maximum ys)
= { induction }
> (x + y) `max` (maximum (map (x+) ys)




claim 4:
when 0 ∈ xs,
> foldr1 max xs = foldr max 0 xs
