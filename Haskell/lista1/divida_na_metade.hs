evenHalve :: [a] -> Int -> Int -> [a]
evenHalve [] n len              = []
evenHalve (h:t) n len
    | n == len                  = []
    | even n                    = h : evenHalve t (n + 1) len  
    | otherwise                 = evenHalve t (n + 1) len

oddHalve :: [a] -> Int -> Int -> [a]
oddHalve [] n len               = []
oddHalve (h:t) n len
    | n == len                  = []
    | odd n                     = h : oddHalve t (n + 1) len  
    | otherwise                 = oddHalve t (n + 1) len

halve :: [a] -> ([a],[a])
halve [] = ([],[])
halve l = (evenHalve l 0 (length l), oddHalve l 0 (length l) ) 

main = do
  x <- getLine
  print $ halve (words x)
