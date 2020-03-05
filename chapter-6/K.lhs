1.
> takePrefix :: ([a] -> Bool) -> [a] -> [a]
> takePrefix p = last . takeWhile p . inits

> takePrefix (all p) = takeWhile p




2.
> none . f = none
> map f . none = none
> map f . one = one . f




3.
> fst . fork (f,g) = f
> snd . fork (f,g) = g
> fork (f,g) . h = fork (f.h,g.h)




4.
> test p (f, g) . h= test (p.h) (f . h, g . h)
> h . test p (f, g) = test p (h . f, h . g)

prove:
> filter p = map fst . filter snd . map (fork (id, p))


case []:

> filter p []
= { filter.1 }
> []

> map fst (filter snd (map (fork (id, p)) []))
= { map.1 }
> map fst (filter snd [])
= { filter.1 }
> map fst []
= { map.1 }
> []


case (x:xs):

> filter p (x:xs)
= { p. 135 }
> concat (map (test p (one, none)) (x:xs))
= { map.2 }
> concat (test p (one, none) x : map (test p (one, none)) xs)
= { concat.2 }
> test p (one, none) x ++ concat (map (test p (one, none)) xs)
= { p. 135 }
> test p (one, none) x ++ filter p xs

> map fst (filter snd (map (fork (id, p)) (x:xs)))
= { map.2 }
> map fst (filter snd (fork (id, p) x : map (fork (id, p)) xs))
= { fork.1 }
> map fst (filter snd ((x, px) : map (fork (id, p)) xs))
= { p. 135 }
> map fst (concat (map (test snd (one, none)) ((x, px) : map (fork (id, p)) xs)))
= { map.2 }
> map fst (concat (test snd (one, none) (x, px) : map (test snd (one, none)) (map (fork (id, p)) xs)))
= { concat.2 }
> map fst (test snd (one, none) (x, px) ++ concat (map (test snd (one, none)) (map (fork (id, p)) xs)))
= { p. 135 }
> map fst (test snd (one, none) (x, px) ++ filter snd (map (fork (id, p)) xs))
= { claim }
> map fst (test snd (one, none) (x, px)) ++ map fst (filter snd (map (fork (id, p)) xs))
= { induction }
> map fst (test snd (one, none) (x, px)) ++ filter p xs
= { 4.2 }
> test snd (map fst . one, map fst . none) (x, px) ++ filter p xs
= { 2.2, 2.3 }
> test snd (one . fst, none) (x, px) ++ filter p xs
= { test.1 }
> (if snd (x, px) then one (fst (x, px)) else none (x, px)) ++ filter p xs
= { 2.1 }
> (if snd (x, px) then one (fst (x, px)) else none (fst (x, px))) ++ filter p xs
= { snd.1, fst.1 }
> (if p x then one x else none x) ++ filter p xs
= { test.1 }
> test p (one, none) x ++ filter p xs




5.
> map (fork (f, g)) = uncurry zip . fork (map f, map g)




6.
> takePrefix (p . foldl f e)
= { specification }
> last . filter (p . foldl f e) . inits
= { 4 }
> last . map fst . filter snd . map (fork (id, p . foldl f e)) . inits
= { 5 }
> last . map fst . filter snd . uncurry zip . fork (map id, map (p . foldl f e)) . inits
= { id }
> last . map fst . filter snd . uncurry zip . fork (id, map (p . foldl f e)) . inits
= { 3.3 }
> last . map fst . filter snd . uncurry zip . fork (inits, (map (p . foldl f e)) . inits)
= { functor law of map }
> last . map fst . filter snd . uncurry zip . fork (inits, (map p) . (map (foldl f e)) . inits)
= { scanl specification }
> last . map fst . filter snd . uncurry zip . fork (inits, map p . scanl f e)
