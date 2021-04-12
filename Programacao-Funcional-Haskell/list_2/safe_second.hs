import Prelude hiding (Maybe (..))

data Maybe a = Just a |
               Nothing
               deriving(Show)
               
safeSecond :: [a] -> Maybe a
safeSecond [] = Nothing
safeSecond (h:t) 
    | null t    = Nothing 
    | otherwise = Just (head t)

main = do
       a <- getLine
       let result = safeSecond (read a::[Int])
       print result
