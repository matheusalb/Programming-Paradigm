auxEspacos:: Int -> String -> String
auxEspacos n s
    | n == 0 = s
    | otherwise = auxEspacos (n-1) (s ++ " ")

addEspacos::Int -> String
addEspacos n = auxEspacos n ""

paraDireita :: Int -> String -> String
paraDireita n s = addEspacos n ++ s

vendas :: Int -> Int
vendas n = mod n 13

totalVendas :: Int -> Int
totalVendas n | n == 0    = 0
              | n > 0     = vendas n + totalVendas (n - 1)
              | otherwise = 0

mediaVendas :: Int -> Float
mediaVendas n = fromIntegral(totalVendas n) / fromIntegral n

montaTabela :: Int -> Int  -> String
montaTabela a b 
    | a == b = ""
    | otherwise   = addEspacos 3 ++ show a ++ addEspacos 12 ++ show (vendas a) ++ "\n" ++ montaTabela (a + 1) b  

resumoVenda :: Int -> String
resumoVenda n = "Semana" ++ addEspacos 8 ++ "Venda"++"\n" 
                ++ montaTabela 0 n  
                ++ "Total"  
                ++ addEspacos 11 
                ++ show (totalVendas n) ++ "\n" 
                ++ "Média" ++ addEspacos 11 
                ++ show(mediaVendas n) ++ "\n"