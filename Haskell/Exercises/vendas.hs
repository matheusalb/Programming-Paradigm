vendidas = [4, 2 , 3, 5, 4, 4, 4]

pegaItem n l
    | l == []   = 0 
    | n == 0    = head l
    | otherwise = pegaItem (n - 1) (tail l)




vendas n
    | length vendidas < n = 0
    | otherwise = pegaItem n vendidas



vendasIguais s n 
    | n < 0 = 0
    | s == vendas n = 1 + vendasIguais (s) (n-1)
    | otherwise = vendasIguais (s) (n-1)

-- #######################################################

-- logicomix