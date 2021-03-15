isqrt :: Int -> Int
isqrt = floor . sqrt . fromIntegral

pokemon :: Int -> String
pokemon n 
    | n >= 10000 || n <= 999                                = "Charmander derrotado"
    | (div n 100 + mod n 100) == isqrt n                    = "Charmander vitorioso"
    | otherwise                                             = "Charmander derrotado"

main = do
  x <- getLine
  putStr $ pokemon (read x :: Int)