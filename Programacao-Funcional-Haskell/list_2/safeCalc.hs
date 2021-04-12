import Prelude hiding (Maybe (..))

data Maybe a = Just a |
               Nothing
               deriving(Show)

isDigit :: Char -> Bool
isDigit a 
    | or [a == 's', a == 'u', a == 'm', a == 'b', a == 'l', a == 'd', a=='i', a=='v']  = False
    | otherwise = True

readNum :: String -> String-> [String]
readNum "" aux = [aux]
readNum (h:t) aux
    | isDigit h     = readNum t (aux ++ [h])
    | aux /= ""     = aux : readNum t ""
    | otherwise     = readNum t ""

readOp :: String -> String
readOp ""           = ""
readOp (h:t)
    | isDigit h     = readOp t
    | otherwise     = h : readOp t

readPattern :: String -> [String]
readPattern a = readOp a : readNum a ""

safeOperation :: [String] -> Maybe Int
safeOperation list
    | op == "sum"           = Just (a + b)
    | op == "sub"           = Just (a - b)
    | op == "mul"           = Just (a * b)
    | op == "div" && b == 0 = Nothing
    | otherwise             = Just (div a b)
        where
            op = head list
            a = read(list !! 1)::Int
            b = read(list !! 2)::Int

safeCalc :: String -> IO ()
safeCalc s = print ans
    where
        list = readPattern s
        ans  = safeOperation list

main = do
       a <- getLine
       safeCalc a
