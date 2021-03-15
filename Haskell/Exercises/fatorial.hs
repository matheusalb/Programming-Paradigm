fat :: Int -> Int
fat n
    | n == 0    = 1   
    | n == 1    = 1
    | otherwise = n * fat (n - 1)

allEqual :: Int -> Int -> Int -> Bool
allEqual a b c
    | a == b && a == c = True
    | otherwise = False

all4Equal :: Int -> Int -> Int -> Int -> Bool
all4Equal a b c d
    | allEqual a b c && allEqual b c d = True
    | otherwise = False

equalCount :: Int -> Int -> Int -> Int
equalCount a b c 
    | allEqual a b c = 3
    | a == b = 2
    | a == c = 2
    | b == c = 2
    | otherwise = 0

mdc :: Int -> Int -> Int
mdc a b
    | b == 0 = a
    | otherwise = mdc (b) (a `mod` b)

primosEntreSi :: Int -> Int -> Bool
primosEntreSi a b 
    | mdc a b == 1 = True
    | otherwise = False


-- primos2ateN :: Int -> [Int]
primos2ateN n
    | n < 2 = 0