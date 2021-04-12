data Tree t = Nilt |
               Node t (Tree t) (Tree t)
               deriving (Read, Show)


insertList :: Ord t => Tree t -> [t] -> Tree t
insertList t []                     = t
insertList Nilt (h:t)               = insertList (Node h Nilt Nilt) t
insertList (Node v b c) (h:t) 
    | h < v                         = insertList (Node v (insertList b [h]) c) t
    | h > v                         = insertList (Node v b (insertList c [h])) t
main = do
       a <- getLine
       b <- getLine
       let result = insertList (read a::Tree Int) (read b)
       print result
