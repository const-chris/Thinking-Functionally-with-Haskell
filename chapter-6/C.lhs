prove:
> head . map f = f . head

case []:

> head (map f [])
= { map.1 }
> head []
= { head.0 }
> undefined

> f (head [])
= { head.0 }
> f undefined

so f must be strict for the law to hold


case (x:xs):

> head (map f (x:xs))
= { map.2 }
> head (f x : (map f xs))
= { head.1 }
> f x

> f (head (x:xs))
= { head.1 }
> f x
