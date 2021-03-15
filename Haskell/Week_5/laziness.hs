-- Haskell só avalia uma expressão quando o resultado é necessário para ser 
-- mostrado ao mundo exterior
f :: Int -> Int -> Int
f a b = a + 12
g :: Int -> Int
g c = c + g c

-- recursão de calda evita estouro de pilha
splitWords :: String -> [String]
splitWords s = splitWordsAux s "" []


splitWordsAux :: String -> String -> [String] -> [String]
splitWordsAux [] "" auxl = auxl
splitWordsAux [] aux auxl = auxl ++ [aux]
splitWordsAux (h:t) aux auxl
    | h == ' ' && aux /= "" = splitWordsAux t "" (auxl ++ [aux])
    | h == ' '               = splitWordsAux t aux auxl
    | otherwise              = splitWordsAux t (aux ++ [h]) auxl     