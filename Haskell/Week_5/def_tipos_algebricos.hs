-- Tipo começa de letra maiúscula
-- Construtores também (que são valores de tipos algébricos)
-- permite diferenciar tipo algebrico de outro tipo como função
-- data Bool = True | False 
data Estacao = Inverno | Verao |
               Outono  | Primavera
data Temp    = Frio | Quente
-- posso fazer casamento de padrões com construtores

clima :: Estacao -> Temp
clima Inverno = Frio
clima _       = Quente

-- type coloca um apelido para um tipo
-- data define um novo tipo

type Nome = String
type Idade = Int
data Pessoas = Pessoa Nome Idade
-- Pessoa é o construtor de pessoas
-- Pessoa é parametrizado sendo String e Int
-- Permite agrupar varias informações com checagem de tipo
-- A agrupação de tudo é um valor de tipo Pessoas

-- exemplo de valor de tipo Pessoas
-- Pessoa "José" 22
-- Pessoa "Maria" 23

showPerson :: Pessoas -> String
showPerson (Pessoa n a) = n ++ " -- " ++ show a

-- Construtor é como se fosse uma função
-- Pessoa :: Nome -> Idade -> Pessoas

data Shape =   Circle Float
             | Rectangle Float Float
             | Triangle Float Float Float

-- Circle 4.9 :: Shape
-- Rectangle 4.2 2.0 :: Shape
isRound :: Shape -> Bool
isRound (Circle _) = True
isRound (Rectangle _ _ ) = False
isRound Triangle {} = False

area :: Shape -> Float
area (Circle r) = pi * r**2
area (Rectangle l r) = l * r
area (Triangle a b c) = sqrt(p*(p-a)*(p-c))
     where p = (a+b+c)/2

-- Definição de tipo algébrico pode ser POLIMÓRFICA


-- Tipos Recursivos
data Expr = Lit Int |
            Add Expr Expr |
            Sub Expr Expr
-- func def recusivamente

eval :: Expr -> Int
eval (Lit n) = n
eval (Add e1 e2) = eval e1 + eval e2
eval (Sub e1 e2) = eval e1 - eval e2

-- Tipos Polimorficos
-- tipo definido com um parâmetro uma variável de tipo.
data Pairs t = Pair t t
-- Pair 6 8 :: Pair Int
-- Pair True True :: Pair Bool
-- Pair [] [1,3] :: Pair [Int]

data List t = Nil | Cons t (List t)
     deriving (Show)

-- data Tree t = NilT |
--               Node t (Tree t) (Tree t)

data Tree t = NilT |
              Node t (Tree t) (Tree t)
              deriving (Eq, Show)
--   o tipo Tree t é instância dessas classes
-- para impl um coport q faz mais sentido é necessário por exemplo pro >, 
-- definit uma istancia da classe ord para o tipo Tree

showExpr :: Expr -> String
showExpr (Lit n) = show n
showExpr (Add e1 e2) = showExpr e1 ++ " + " ++ showExpr e2
showExpr (Sub e1 e2) = showExpr e1 ++ " - " ++ showExpr e2

toList :: List t -> [t]
toList Nil = []
toList (Cons t l) = t : toList l

fromList :: [t] -> List t
fromList [] = Nil
fromList (a:t) = Cons a (fromList t)

depth :: Tree t -> Int
depth NilT = 0
depth (Node c e d) = 1 +  max (depth e) (depth d)

-- showExpr (Add (Lit 4) (Sub (Lit 6) (Lit 9))
-- toList (Cons 5 (Cons 6 Nil))
-- depth (Node 3 (Node 5 NilT NilT) (Node 5 NilT NilT))
-- depth (Node 'b' (Node 'c' (Node 'f' NilT NilT)  NilT) (Node 'a' NilT NilT))
collapse :: Tree t -> [t]
collapse NilT = []
collapse (Node a b c) = [a] ++ collapse b ++ collapse c

-- collapse (Node 'b' (Node 'c' (Node 'f' NilT NilT)  NilT) (Node 'a' NilT NilT))

mapTree :: (t -> u) -> Tree t -> Tree u
mapTree f NilT = NilT
mapTree f (Node a b c) = Node (f a) (mapTree f b) (mapTree f c)

-- mapTree (*2) (Node 2 (Node 3 (Node 4 NilT NilT)  NilT) (Node 5 NilT NilT))

-- data Shape = Circle Float
--              | Rectangle Float Float

perimetro :: Shape -> Float
perimetro (Circle r) = 2*pi*r
perimetro (Rectangle a b) = 2 * (a + b)
perimetro (Triangle a b c) = (a+b+c)/2

-- type ShopItem = (String, Int, Double)
data ShopItem = Produto String Int Double

total :: [ShopItem] -> Double
total [] = 0
total ((Produto n q p) : t) = fromIntegral q * p + total t

-- data Figura =  Circulo Float
--              | Retangulo  Float Float
--              | Triangulo Float Float Float
isRetangular :: Shape -> Bool
isRetangular (Circle _) = True
isRetangular (Rectangle _  _) = True
isRetangular (Triangle a b c) 
     | a == b && b == c  = True
     | otherwise         = False

data Casas t = Casa t 

showCasa :: (Show t) => Casas t -> String
showCasa (Casa t) = show t

data Enderacamento t = Endereco String t 

data Nat = Zero | Suc Nat 
     deriving (Show)


um = Suc Zero
dois = Suc um
tres = Suc dois

nat2integer :: Nat -> Integer 
nat2integer Zero = 0 
nat2integer (Suc a) = 1 + nat2integer a 

integer2nat :: Integer -> Nat
integer2nat 0 = Zero
integer2nat a = Suc (integer2nat (a-1))

natLt :: Nat -> Nat -> Bool
natLt Zero Zero          = False
natLt a Zero             = True
natLt Zero a             = False
natLt (Suc a) (Suc b)    = natLt a b 

natAdd :: Nat -> Nat -> Nat
natAdd Zero Zero = Zero
natAdd (Suc a) Zero = Suc (natAdd  a Zero)
natAdd  Zero   (Suc a) = Suc (natAdd Zero a)
natAdd (Suc a) (Suc b) = Suc (Suc (natAdd a b))

natSub :: Nat -> Nat -> Nat
natSub Zero    Zero      = Zero
natSub (Suc a) Zero      = Suc  (natSub a Zero)
natSub (Suc a) (Suc b)   = natSub a b

natMul :: Nat -> Nat -> Nat
natMul Zero Zero           = Zero
natMul Zero k              = Zero
natMul k Zero              = Zero
natMul k (Suc Zero)        = k
natMul (Suc Zero) k        = k
natMul k (Suc b)           = natAdd k (natMul k b)

natDiv :: Nat -> Nat -> Nat
natDiv k (Suc Zero)  = k
natDiv a b
     | natSub a b == Zero = 