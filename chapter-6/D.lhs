> cp :: [[a]] -> [[a]]
> cp = foldr reduce [[]]
>   where
>     reduce xs yss = [x:ys | x <- xs, ys <- yss]

1) express:
> length . cp = foldr h b

fusion:
> f . foldr g a = foldr h b

f undefined = undefined, so
length must be strict, and it is

f a = b, so
length [[]] = b
b = 1

f (g x y) = h x (f y), so
length (reduce x y) = h x (length y)
length x * length y = h x (length y)
(*) (length x) (length y) = h x (length y)
(*) (length x) = h x
h = (*) . length

length . cp = foldr ((*) . length) 1


2) express:
> map length = foldr h b

map length = foldr ((:) . length) []


3) express:
> product . map length = foldr h b

product must be strict

product [] = b
b = 1

product (((:) . length) x y) = h x (product y)
length x * product y = h x (product y)
(*) (length x) = h x
h = (*) . length
