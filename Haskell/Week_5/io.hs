-- main :: IO ()
-- main = putStr "Oi mundo!"

-- haskell tem efeitos colaterais, mas do ponto de vista da
-- computação você ainda está fazendo computação através da avaliação
-- de expressões.

-- IO t é da classe Monad
-- getLine :: IO String
-- devolve uma String na monad de entrada e saída.

-- putSrt :: String -> IO ()
--  a tupla vazia () indica que retorna nada de útil

-- getChar :: IO Char
-- putStrLn :: String -> IO ()

-- Sequenciando ações de IO (Tipo que pertence a uma monad, é um tipo cuja operações
-- sobre esses valores podem ser sequênciadas).

putStrLn :: String -> IO()
putStrLn str = do putStr str
                  putStr "\n"
-- o 'do' faz essas instruções serem executadas em sequência

put4times :: String -> IO ()
put4times str = do putStr str
                   putStr str
                   putStr str
                   putStr str
    -- o tipo da expressão é definido pela ultima linha avaliada

putNtimes :: Int -> String -> IO ()
putNtimes n str
    = if n <= 1
        then putStr str
        else do putStr str
                putNtimes (n-1) str -- <- essa linha é que retorna valor
    
-- passando sequencialmente valor de retornado de uma execução para outra
getNput :: IO ()
getNput = do line <- getLine
             putStr line
            --  <- funciona como uma "atribuição", não é possível modificar o valor de line dps disso

-- >>= é o operador then
-- getLine >>= putStr
-- pra fazer alterações no que é passado antes de prosseguir:
-- getLine >>= \x -> putStr (x ++ "\n")

-- se quisermos ignorar o resultado da primeira para segunda transição
-- usamos o operador >> 
-- putStr "Eu sou" >> putStr "fã de Haskell"
-- é o mesmo que: putStr "Eu sou" >>= \_ -> putStr "fã de haskell"

-- tudo que funciona par Monadas, em geral, funciona para IO

main :: IO()
main = putStr "Digite seu nome: " >>
       getLine >>= 
       \st -> 
           putStr "Ao contrario é: " >>
           putStr (reverse st)

-- usando o do
main2 :: IO()
main2 = do 
            putStr "Digite seu nome: " 
            st <- getLine
            putStr "Ao contrario é: "
            putStr (reverse st)

-- da pra evitar problema de identação usando ;
main3 :: IO()
main3 = do  {
            putStr "Digite seu nome: " ;
            st <- getLine;
            putStr "Ao contrario é: ";
            putStr (reverse st)
        }
-- em haskell o return pega um valor e retorna esse valor em uma monade

trimIOString :: IO String
trimIOString = do {
            st <- getLine;
            return (trim st)
        }
-- esse return tem nada a ver com o que a gnt conhece, esse vai colocar o valor
-- na monad. 
trim = reverse.dropWhites.reverse.dropWhites
       where 
           dropWhites = dropWhile (== ' ')

