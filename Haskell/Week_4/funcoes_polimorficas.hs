-- função polimorifica não obrigatoriamente funciona
-- para qualquer tipo de dado 

-- função monomórfica -> funções nas quais 
-- os parametros e resultados tem tipos de dados fixos.

-- funções polimórfica -> função capaz de lidar com vários
-- tipos de dados distintos.
-- permite o reuso de código

-- polimorfismo paramétrico
-- coloca variaveis de tipos para os tipos das variaveis
-- zip :: [t] -> [u] -> [(t, u)]

-- Num t => t -> a -> [a]
-- "Num t =>" indica que tem uma restrinção sobre o t
-- o t não é qualquer tipo, ele é qualquer tipo que seja Num.
-- Num é uma classe de haskell 

-- polimorfismo de sobrecarga (overloading) -> mesmo nome de função, mas 
-- definições distintas para cada tipo.
-- em haskell precisa ter a mesma quantidade de parametros

-- classe em haskell não é coleção de valores como c++
-- classe é coleção de tipos par os quais uma função está definida.
-- classe Eq -> classe dos tipos os quais o operador (==) está definido.
-- são classes que permitem sobrecarga de nomes 
-- classe define operações definidas para cada tipo que pertence a ela
-- tendo diferentes significados para diferentes tipos.

-- Instâncias são tipos membros de uma classe.
-- um tipo é instância de uma classe se as operações definidas pela classe estão disponíveis nesse tipo.

-- read :: (Read t) => String -> t (a saída pode ser de qualquer tipo que pertença a Read)
-- essa função precisa passar o tipo pois pode ter diferentes interpretações
-- read "123"::Int por exemplo
import Data.List
sumPairA :: (Eq t) => [(t, Int)] -> t -> Int -> (t, Int)
sumPairA [] x count          = (x, count)
sumPairA (h:tl) x count      
    | x == fst h             = (x, snd (sumPairA tl x (count + snd h)))
    | otherwise              = (x, snd (sumPairA tl x count))

sumPairs :: (Eq t) => [(t, Int)] -> [t] -> [(t, Int)]
sumPairs [] elems       = []
sumPairs list []        = []
sumPairs list (cr:ct)   = sumPairA list cr 0 : sumPairs list ct

quebraLista :: (Eq t) => [[t]] -> [(t, Int)]
quebraLista []      = []
quebraLista (h:tl)  = [(x, 1) | x <- h] ++ quebraLista tl

ids :: (Eq t) => [[t]] -> [t]
ids []     = []
ids (h:tl) = [x | x <- h] ++ ids tl

agrupar :: (Eq t) => [[t]] -> [(t, Int)]
agrupar [] = []
agrupar list = sumPairs (quebraLista list) (nub (ids list)) 