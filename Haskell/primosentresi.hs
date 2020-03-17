fibonnaci :: Int -> Int
fibonnaci 0 = 1
fibonnaci 1 = 1
fibonnaci n = fibonnaci (n-1) + fibonnaci (n-2)

fibonnaciAteN :: Int -> [Int]
fibonnaciAteN 0 = [1]
fibonnaciAteN n = fibonnaci(n):fibonnaciAteN(n - 1)

-- paresDeFibonnaci :: Int ->[Int]
-- paresDeFibonnaci 0 = 0
-- paresDeFibonnaci 

delta :: (Double, Double, Double) -> Double
delta (a,b,c) = b*b - 4*a*c

raizSegundoGrau :: (Double, Double, Double) -> [Double]
raizSegundoGrau (a, b, c) 
    | delta (a,b,c) >= 0 = ( -1*b+sqrt(delta(a,b,c)) )/(2):  ( -1*b-sqrt(delta(a,b,c)) )/(2) : []
    | otherwise = []