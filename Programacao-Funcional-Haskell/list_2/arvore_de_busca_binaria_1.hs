data Tree t = Nilt |
              Node t (Tree t) (Tree t)
              deriving (Read)


isBigger :: Ord t => Tree t -> t -> Bool
isBigger Nilt k                 = True
isBigger (Node a b c) k         = k > a && isBigger b k && isBigger c k   

isSmaller :: Ord t => Tree t -> t -> Bool
isSmaller Nilt k                = True
isSmaller (Node a b c) k        = k < a && isSmaller b k && isSmaller c k

isBST :: Ord t => Tree t -> Bool
isBST Nilt               = True
isBST (Node a Nilt Nilt) = True
isBST (Node a (Node b b1 b2) Nilt) = a > b && isBST (Node b b1 b2) && isBigger (Node b b1 b2) a
isBST (Node a Nilt (Node c c1 c2)) = a < c && isBST (Node c c1 c2) && isSmaller (Node c c1 c2) a
isBST (Node a (Node b b1 b2) (Node c c1 c2)) =  a > b && a < c && isBST(Node b b1 b2) 
       && isBigger (Node b b1 b2) a && isBST (Node c c1 c2) && isSmaller (Node c c1 c2) a
main = do
       s <- getLine
       let result = isBST (read s::Tree Int)
       print result
-- (Node 5 Nilt Nilt)
-- (Node 5 (Node 3 (Node 2 Nilt Nilt) Nilt) (Node 7 Nilt Nilt))