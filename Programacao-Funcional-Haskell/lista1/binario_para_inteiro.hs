auxbtoi :: [Int] -> Int -> Int
auxbtoi [] i        = 0
auxbtoi (h:t) i     = h * 2^i + auxbtoi t (i-1)

btoi :: String -> Int
btoi s = auxbtoi (map (read . pure :: Char -> Int) s) (length s - 1)


main = do
    s <- getLine
    let result = btoi s
    print result
