imc :: Float -> Float -> Float
imc peso altura = peso/(altura**2)

-- 

menorq :: Int -> Int -> Int -> Bool
menorq a b c = (a < b) && (b < c)

-- 

vendas :: Int -> Int
vendas n = mod n 13

compvendas :: Int -> Int -> Int
compvendas s n | n == 0         = 0
               | s == vendas n  = compvendas s (n-1) +1
               | otherwise      = compvendas s (n-1)
-- 

divideByPrev :: Int -> Int -> Bool 
divideByPrev n m | n > 1 && m  == 1        = True
                 | mod n m == 0            = False
                 | otherwise               = divideByPrev n (m-1)

isPrimo :: Int -> Bool
isPrimo n | n <= 1 = False
          | otherwise = divideByPrev n (n-1)

loopdiv :: Int -> Int -> Int
loopdiv d r | mod d r == 0    = r
            | otherwise       = loopdiv r (mod d r)        

mdc :: Int -> Int -> Int
mdc n m = loopdiv (min n m) ( mod (max n m) (min n m) )

primosEntreSi :: Int -> Int -> Bool
primosEntreSi n m | mdc n m == 1   = True
                 | otherwise       = False

fat :: Int -> Int
fat n | n < 0      = -1
      | n == 0     = 1
      | otherwise  = n * fat (n - 1)

allEqual :: Int -> Int -> Int -> Bool
allEqual n m p = (n == m) && (m == p)

all4Equal :: Int -> Int -> Int -> Int -> Bool
all4Equal a b c d = allEqual a b c && allEqual b c d

equalCount :: Int -> Int -> Int -> Int
equalCount a b c | allEqual a b c               = 3
                 | a == b || a == c || b == c   = 2
                 | otherwise                    = 0
 
areaTri a b c = c * h /2
    where
        cos_alf = (b^2 + c ^2 - a^2)/(2*b*c)
        sin_alf = sqrt (1-cos_alf^2)
        h = b * sin_alf

fatorial :: Integer -> Integer
fatorial n
    | n == 0 = 1
    | n > 0 = fatorial (n-1) * n

potDois :: Integer -> Integer
potDois n
    | n == 0 = 1
    | otherwise = 2 * potDois (n-1)

fatorialDup :: Integer -> Integer
fatorialDup n
    | n == 0 = 1
    | n == 1 = 1
    | n > 0 = fatorialDup (n-2) * n

mulInt :: Integer -> Integer -> Integer
mulInt m n
    | m < n = m * mulInt (m+1) n
    | m == n = m
    | otherwise = 0

fatnR :: Integer -> Integer
fatnR n = mulInt 1 n

soma :: Integer -> Integer -> Integer
soma a b 
    | b > 0  = soma (succ a) (pred b)
    | b == 0 = a

pot :: Integer -> Integer -> Integer
pot a b 
    | b > 0   = a * pot a (b-1)
    | b == 0  = 1 

calculaMaisProx :: Integer -> Integer -> Integer -> Integer
calculaMaisProx obj at an 
    | at * at == obj = at
    | at * at > obj = an
    | at * at < obj = calculaMaisProx obj (at+1) at


raizQInt :: Integer -> Integer
raizQInt a = calculaMaisProx a 0 0