-- composição:
-- (f . g) x == f (g x)
-- notação lambda: define função anônima
-- \x (lista de parametros) -> f(g x) retorno

sqr2 = \x -> x * x

concat2 = \l1 l2 -> l1 ++ l2

iter :: Int -> (t -> t) -> (t -> t)
iter 0 f = id
iter n f = (iter (n-1) f).f

-- toma função é uma expressão em haskell
-- tem 2 parametros o 'n' e o 'm' na func lambda
addNum n = (\m -> n+m)

func :: (Num t, Num u) => t -> u -> (t, u)
func a b = (a, b)

funrevers = \x y -> func y x  