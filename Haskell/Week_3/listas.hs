--  listas = coleção de objetos de um msm tipo.
-- type String = [Char]
-- [] lista vaziade qq tipo
-- estrutura de dados recursivas, são listas encadeadas.

-- a ordem dos elementos é relevante na lista.
-- duplicação de elementos importa

-- operador construtor de lista (:)
-- [5] == 5:[5]
--  (tipo A) : [tipoA] 
-- 2:3:4:5:[] == [2,3,4,5]
-- 4:(5:[])

-- [2..7]; cria uma lista c os numeros entre 2 e 7 
-- [-10..10]
-- ['a'..'z']
-- [1.1..10.1]
-- [1.1, 1.2..10.1] ; começa em 1.1, o segundo é 1.2 e o último é 10.1
-- [1, 3..100] 3-1 é o passo

-- head [1,2,3]
-- tail [4,5,6]
-- length
-- length (a:as) = ... < parenteses obrigatorio

-- case () of permite o casamento de padrões inline

quickSort :: [Int] -> [Int]
quickSort [] = []
quickSort (h:t) = quickSort [x | x <- t, x <= h] ++ [h] ++ quickSort [x | x <- t, x > h] 


fibonacci :: Int -> Int
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

fibonacciAux :: Int -> Int -> [Int]
fibonacciAux n i 
    | n == 0                = []
    | even (fibonacci i)    = fibonacci i : fibonacciAux (n - 1) (i + 1)
    | otherwise             = fibonacciAux n (i + 1)

fibonacciPares :: Int -> [Int]
fibonacciPares n = fibonacciAux n 0


calculaSomaDigitos :: Int -> Int
calculaSomaDigitos n 
    | n == 0 = 0
    | otherwise = calculaSomaDigitos (div n 10) + mod n 10

compMenor :: Int -> Int -> Bool
compMenor a b 
    | calculaSomaDigitos a < calculaSomaDigitos b = True
    | calculaSomaDigitos a == calculaSomaDigitos b  && a == b = True
    | calculaSomaDigitos a == calculaSomaDigitos b  && a < b  = True
    | otherwise = False 

compMaior :: Int -> Int -> Bool
compMaior a b 
    | calculaSomaDigitos a > calculaSomaDigitos b  = True
    --  calculaSomaDigitos a == calculaSomaDigitos b && a > b = True
    | otherwise = False 

ordenar :: [Int] -> [Int]
ordenar [] = []
ordenar (h:t) = ordenar [x | x <- t, compMenor x h] ++ [h] ++ ordenar [x | x <- t, compMaior x h ]