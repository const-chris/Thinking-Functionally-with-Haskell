> (++) :: [a] -> [a]
> [] ++ ys = ys
> (x:xs) ++ ys = x : (xs ++ ys)

> reverse :: [a] -> [a]
> reverse [] = []
> reverse (x:xs) = reverse xs ++ [x]

prove that reverse (xs ++ ys) = reverse ys  ++ reverse xs

case xs = []:

> reverse ([] ++ ys)
= { ++.1 }
> reverse ys

> reverse ys ++ reverse []
= { reverse.1 }
> reverse ys ++ []
= { zs ++ [] = zs }
> reverse ys


case xs = (n:ns):

> reverse ((n:ns) ++ ys)
= { ++.2 }
> reverse (n : (ns ++ ys))
= { reverse.2 }
> reverse (ns ++ ys) ++ [n]

> reverse ys ++ reverse (n:ns)
= { reverse.2 }
> reverse ys ++ (reverse ns ++ [n])
= { associative property of ++ }
> (reverse ys ++ reverse ns) ++ [n]
= { induction }
> reverse (ns ++ ys) ++ [n]
