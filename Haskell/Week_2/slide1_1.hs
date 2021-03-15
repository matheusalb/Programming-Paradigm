-- não é preciso indicar explicitamente o tipo da variavel
-- Ele tem a caracteristica de inferência de tipos.
-- Tipo de variável começa com letra maiúscula.
-- Mesmo na definição de tipos novos.
answer :: Int 
answer = 42
-- váriaveis em haskell não são mutáveis, nunca mais muda
-- answer = 50 <- vai da erro, as váriaveis são sempre constantes.

greater :: Bool
greater = (answer > 71)
-- False também começa com letra maiúscula, pois False é um construtor
-- E construtor começa com letra maiúscula.

yes :: Bool
yes = True
-- variáveis precisam começar com letra minúscula.

yES = True

