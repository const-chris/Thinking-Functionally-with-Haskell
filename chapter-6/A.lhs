> mult :: Nat -> Nat -> Nat
> mult Zero y = Zero
> mult (Succ x) y = mult x y + y

prove that mult (x + y) z = mult x z  + mult y z

case y = 0:

> mult (x + Zero) z
= { addition.1 }
> mult x z

> mult x z + mult Zero z
= { mult.1 }
> mult x z + Zero
= { addition.1 }
> mult x z


case y = n + 1:

> mult (x + (n + 1)) z
= { associative property of addition }
> mult (Succ (x + n)) z
= { mult.2 }
> mult (x + n) z + z

> mult x z + mult (n + 1) z
= { mult.2 }
> mult x z + (mult n z + z)
= { associative property of addition }
> (mult x z + mult n z) + z
= { induction }
> mult (x + n) z + z
