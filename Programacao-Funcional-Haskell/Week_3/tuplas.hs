-- posso usar sinonimos de tipos 'type'
type Name= String
type Age = Int
type Phone = Int
type Person = (Name, Age, Phone)

name :: Person -> Name
name(n,a,p) = n

-- Podemos aplicar casamento de padrões em variáveis locais!
oneRoot :: Float -> Float -> Float -> Float
oneRoot a b c = -b/(2.0*a)

twoRoots :: Float -> Float -> Float ->(Float, Float)
twoRoots a b c = (d-e, d+e)
    where
        d = -b/(2.0*a)
        e = sqrt(b^2-4.0*a*c)/(2.0*a)

root :: (Float, Float, Float) -> (Int, Float, Float)
root (a, b, c)
    | delta < 0   = (0,0,0)
    | delta == 0  = (1,r1,r1)
    | otherwise   = (2,r1,r2)
        where
            delta = b^2-4.0*a*c
            (r1, r2) = twoRoots a b c

-- menor :: Int -> Int -> Int -> Int
-- menor a b c
--     | min a b <= min b c    = min a b
--     | otherwise             = min b c

menorMaior :: Int -> Int -> Int -> (Int, Int)
menorMaior a b c  = (menor a b c, maior a b c) 
    where
        menor a b c
            | min a b <= min b c    = min a b
            | otherwise             = min b c
        maior a b c
            | max a b >= max b c    = max a b
            | otherwise             = max b c
ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (a, b, c) = (head order, order !! 1, order !! 2)
    where
        quickSort :: [Int] -> [Int]
        quickSort [] = []
        quickSort (h:t) = quickSort [x | x <- t, x <= h] ++ [h] ++ quickSort [x | x <- t, x > h] 
        order = quickSort [a, b, c]

type Ponto = (Float, Float)
type Reta  = (Ponto, Ponto)

px :: Ponto -> Float
px = fst 
py :: Ponto -> Float
py = snd 

isVertical :: Reta -> Bool
isVertical r 
    | px (fst r) == px (snd r)  = True
    | otherwise                 = False  

pontoY :: Float -> Reta -> Float
pontoY x ((x1,y1), (x2,y2)) = y
    where
        y = (y2-y1)/(x2-x1) * (x - x1) + y1  
