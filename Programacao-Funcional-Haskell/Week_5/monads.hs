-- tipo maybe é usado para representar computações que podem produzir nada.
-- data Maybe t = Just t | Nothing

safeDiv :: Integral t => t -> t -> Maybe t
safeDiv x y
    | y /= 0    = Just (div x y)
    | otherwise = Nothing

-- temos problemas em fazer chamadas encadeadas usando essa função
-- precisamos desempacotar o valor que tá dentro de Maybe t, no caso o t
-- podemos criar uma função para isso

applyMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
applyMaybe Nothing f = Nothing
applyMaybe (Just x) f = f x

-- o Maybe é uma Monad (computação que envolve sequenciamento e contexto,
-- e que tem o operador chamado then ou bind >>= )
-- o applyMaybe é uma implementação de >>=
