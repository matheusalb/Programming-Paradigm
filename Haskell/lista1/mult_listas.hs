mul2 :: [Int] -> [Int] -> [Int]
mul2 [] []              = []
mul2 [] (hb:tb)         = hb * 0 : mul2 [] tb
mul2 (ha:ta) []         = ha * 0 : mul2 ta []
mul2 (ha:ta) (hb:tb)    = ha*hb  : mul2 ta tb


main = do
    sa <- getLine
    let a = read sa :: [Int]
    sb <- getLine
    let b = read sb :: [Int]
    let result = mul2 a b
    print result
