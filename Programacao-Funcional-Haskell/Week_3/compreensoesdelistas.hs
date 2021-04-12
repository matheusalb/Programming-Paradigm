-- [ expressao que usa variavel| variavel <- list, cond]
-- a varivel nova nao precisa ser do mesmo tipo que a lista, tampouco precisa usar
-- [x^2 | x <- [1..10] ]
-- [0 | x <- [1..10]]
-- [x | x <- [1..100], x `mod` 7 == 0 || x `mod` 3 == 0]

type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa,Livro)]

baseExemplo = [("Sergio","O Senhor dos Aneis"),("Tiriri","O Senhor dos Aneis"),("Andre","Duna"),("Fernando","Jonathan Strange & Mr.Norrell"),("Fernando","A Game of Thrones")]

livros :: BancoDados -> Pessoa -> [Livro]
livros bd p = [ ll | (pp, ll) <- bd, pp == p] 

emprestimos :: BancoDados -> Livro -> [Pessoa]
emprestimos bd l = [pp | (pp, ll) <- bd, ll == l]

-- emprestado :: BancoDados -> Livro -> Bool
-- emprestado bd l = not( null([pp| (pp,ll) <- bd, ll == l]))

qtdEmprestimos :: BancoDados -> Pessoa -> Int
qtdEmprestimos bd p = length (livros bd p)

belongsTo :: Livro -> [Livro] -> Bool
belongsTo l [] = False
belongsTo l (h:t)
    | l == h = True
    | otherwise = belongsTo l t

emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
emprestar bd p l 
    | not (belongsTo l (livros bd p)) = (p,l) : bd
    | otherwise = bd

devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
devolver [] p l             = []
devolver ((pp,ll):t) p l
    | p == pp && l == ll    = t
    | otherwise             = (pp,ll) : devolver t p l

getWord :: String -> String
getWord "" = ""
getWord (h:t) 
    | h == ' '      = []
    | otherwise     = h : getWord t

dropWord :: String -> String
dropWord "" = ""
dropWord (h:t)
    | h == ' '          = h : t
    | otherwise         = dropWord t

dropSpace :: String -> String
dropSpace "" = ""
dropSpace (h:t) 
    | h == ' '      = dropSpace t
    | otherwise     = h:t    

splitWords :: String -> [String]
splitWords ""    = []
splitWords s 
    | getWord (dropSpace s) /= "" = getWord (dropSpace s) : splitWords(dropWord (dropSpace s)) 
    | otherwise                   = []