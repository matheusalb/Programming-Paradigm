-- toda função em haskell na verdade só tem um parâmetro
-- faz associação a direita na definição da função
-- enquanto na execução da função se faz uma associação a esquerda

-- f a b == (f a) b 
-- t -> u -> v == t -> (u -> v) 
-- t -> u -> v /= (t -> u) -> v
--                único parâmetro, e o resultado é uma função que também só tem um parâmetro    

{-  
map :: (a -> b) -> [a] -> [b]
(*2) :: (Num t) => t -> t
map (*2) :: (Num t) => [t] -> t

Foldable t => (a -> b -> b) -> b -> t a -> b
-}

pares = [(1,8),(2,5),(0,1),(4,4),(3,2)]  
h = sum . map (\(x,y) -> x*y-1) . filter (\(x,_) -> even x) 

