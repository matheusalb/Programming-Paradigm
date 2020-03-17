type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa,Livro)]

meuBanco :: BancoDados
meuBanco = [
    ("Burle", "NAOO"), 
    ("Veva", "NAOO"),
    ("Veva", "Livro do Pele"),
    ("1Berto", "Os 7 patos"),
    ("Veva", "Lord of the Rings")
    ]

livros :: BancoDados -> Pessoa -> [Livro]
livros banco nome = [livro|(nomeCadastrado,livro) <- banco, nome == nomeCadastrado]

emprestimos :: BancoDados -> Livro -> [Pessoa]
emprestimos banco nomeLivro = [pessoa | (pessoa, livro) <- banco, nomeLivro == livro]

emprestado :: BancoDados -> Livro -> Bool
emprestado banco nomeLivro
    | [livro| (pessoa,livro) <- banco, nomeLivro == livro] /= [] = True
    | otherwise = False
 
qtdEmprestimos :: BancoDados -> Pessoa -> Int
qtdEmprestimos banco nomePessoa = length [pessoa| (pessoa,livro) <- banco, nomePessoa == pessoa]

emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
emprestar banco nomePessoa nomeLivro = (nomePessoa, nomeLivro):banco

devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
devolver banco nomePessoa nomeLivro = [(pessoa,livro)| (pessoa,livro) <- banco, ((pessoa /= nomePessoa) || (livro /= nomeLivro))]

membro :: [Int] -> Int -> Bool
membro lista numero 
    | [num| num <- lista, num == numero] /= [] = True
    | otherwise = False