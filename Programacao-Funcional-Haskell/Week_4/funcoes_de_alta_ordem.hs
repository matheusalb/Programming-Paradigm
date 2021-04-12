-- funções de mapeamento fazem transformações nos dados passados
-- por ex recebe lista tam n e retorna uma lista tam n com elementos ao quadrado
-- função map

-- aplica f em cada elemento de l e retorna a lista de elementos f aplicados em l
-- map f l == [f a | a <- l]

-- Reduce or folding
-- reduz a lista para um único elemento, aplicando operações de dois em 2 nos elementos
-- foldr1 em haskell
-- foldr passa o valor a ser passado no caso base

-- filter
-- aplica uma função de comparação a cada elemenjto da lista 
-- e retornar os elementos que deram true na comparação
-- filter p l = [a| a - < , p a]

isCrescent :: (Int -> Int) -> Int -> Bool
isCrescent f 0 = True
isCrescent f n = f n > f (n-1) && isCrescent f (n-1)

quadrado :: (Num t) => t -> t
quadrado x = x*x

mapping :: (Num t) => (t -> t) ->  [t] -> [t]
mapping f []        = []
mapping f (h:t)     = quadrado h : mapping f t 


foldingAux :: (Num t) => (t -> t-> t) -> [t] -> t
foldingAux f []     = 0
foldingAux f (h:t)  = f h (foldingAux f t)

folding :: (Num t) => (t -> t -> t) -> [t] -> t
folding f l = foldingAux f (mapping quadrado l)

filtering :: (Num t) => (t -> Bool) -> [t] -> [t]
filtering f []      = []
filtering f (h:t)
    | f h       = h : filtering f t
    | otherwise = filtering f t

naosei l = foldr (++) [] (map sing l)
    where sing a = [a]

comparee a b 
    | a > b         = a
    | otherwise     = b

maiores :: [[Int]] -> [Int]
maiores []      = []
maiores (h:t)   = foldr1 comparee h : maiores t

maiores2 :: [[Int]] -> [Int]
maiores2 t = map (foldr1 comparee) t

takeWhile2 :: (Eq t) => (t -> Bool) -> [t] -> [t]
takeWhile2 f []      = []
takeWhile2 f (h:t)
    | f h           = h : takeWhile2 f t
    | otherwise     = []

alfalsex x = False

dropWhile2 :: (Enum t) => (t -> Bool) -> [t] -> [t]
dropWhile2 f []         = []
dropWhile2 f (h:t)
    | not (f h)         = h : dropWhile2 alfalsex t
    | otherwise         = dropWhile2 f t       


getWord :: String -> String
getWord s = takeWhile2 ( /= ' ') s

dropWord :: String -> String
dropWord s = dropWhile2 (/= ' ') s

dropSpace :: String -> String
dropSpace s = dropWhile2 (== ' ') s

type Preco = Int
type Nome  = String
formataCentavos :: Preco -> String
formataCentavos cents 
    | mod cents 100 < 10    = show (div cents 100) ++ ".0" ++ show (mod cents 100)
    | otherwise             = show(div cents 100) ++ "." ++ show (mod cents 100)

tamanhoLinha :: Int
tamanhoLinha = 30
formataLinha :: (Nome,Preco) -> String
formataLinha (n, p) = n ++ (replicate (tamanhoLinha - length n) '.') ++ formataCentavos p ++"\n"

formataLinhas :: [(Nome,Preco)] -> String
formataLinhas []    = ""
formataLinhas l = foldr (++) "" (map formataLinha l)  

formataTotal :: Preco -> String
formataTotal n = "\nTotal" ++ replicate(tamanhoLinha - length(formataCentavos n)) '.' ++ formataCentavos n ++"\n"

soma :: (Nome, Preco) -> Int -> Int
soma a b = snd a + b

type Conta = [(Nome,Preco)]
formataConta :: Conta -> String
formataConta l = formataLinhas l ++ formataTotal (foldr soma 0 l)

calculaTotal [] = 0
calculaTotal l = sum (map func l) 
    where func (a, b) = b

type Codigo = Int
type Mercadorias =[(Codigo,Nome,Preco)]

tabelaMercadorias :: Mercadorias
tabelaMercadorias = [ (4719, "Fish Fingers",121 ), (5643, "Nappies",1010), (3814, "Orange Jelly",56 ), (1111, "Hula Hoops",21 ), (1112, "Hula Hoops (Giant)", 133 ), (1234, "Dry Sherry, 1lt",540 )]


procuraCodigo :: Mercadorias -> Codigo -> (Nome,Preco)
procuraCodigo [] n = ("Unknown Item",0)
procuraCodigo db n 
    | length (list) > 0     = head (map pegasegundo list)
    | length (list) == 0    = ("Unknown Item",0)
    where
        compara :: (Codigo,Nome,Preco) -> Bool
        compara (a,b,c) = a == n 
        list = filter compara db
        pegasegundo :: (Codigo, Nome,Preco) -> (Nome, Preco)
        pegasegundo (a,b,c) = (b,c)

criaConta :: Mercadorias -> Carrinho -> Conta
criaConta db = map (procuraCodigo db)


type Carrinho = [Codigo]
fazCompra :: Mercadorias -> Carrinho -> String
fazCompra db cds = formataConta $ criaConta db cds