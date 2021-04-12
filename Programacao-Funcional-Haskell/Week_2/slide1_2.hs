-- Também é capaz de inferir tipos de funções
-- função também começa com letra minúscula.
-- O que vem depois da última setinha é o tipo do resultado.
-- O quem vem antes da última são os parâmetros e esses são separados por setinhas.
square :: Int -> Int
square x = x * x
-- Haskell é estaticamente tipificada.
 
-- é como se toda função em haskell tivesse um único parâmetro.
allEqual :: Int -> Int -> Int -> Bool
allEqual n m p = (n == m) && (m == p)

-- já existe uma função max na biblioteca padrão de haskell
maxi :: Int -> Int -> Int
maxi n m | n > m     = n
         | n ==m     = n
         | otherwise = m
-- essas barras são chamadas de 'clausulas de guarda'
-- é como se fosse o if na declaração da função
-- pode ter várias clásulas
-- otherwise == else, o otherwise é a mesma coisa que colocar um True.

-- o if de haskell se parece mais com exp ternaria de C e python
-- a ? b : c Condição ? verdadeiro : falso
-- a if cond else b

-- Função tem precendencia maior que qq outra coisa, em haskell
-- paranteses em função tem sentido de exp aritimética, para dar preferência.

vendas :: Int -> Int
vendas n = mod n 13

totalVendas :: Int -> Int
totalVendas n | n == 0    = 0
              | n > 0     = vendas n + totalVendas (n - 1)
              | otherwise = 0