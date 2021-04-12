# nao tenho palavra chave específica para declarar variável
resposta:int = 42 # notalção de tipo nome_variavel : type
print(42)

# python é uma linguagem dinamicamente tipada/tipificada (assim como várias linguagens consideradas de script.)
# em python variáveis não tem tipo, valores tem.
resposta = "Quarenta' e dois"
print(resposta)
# em programa grande é bom se preocupar com tipos
# python permite que se introduza notações de tipos em um programa
# mas as notações não são verificadas como em C. (a não ser que use uma IDE como pycharm)
# nesse caso a IDE realiza a checagem

pi = 3.14
# python não tem o tipo char
# posso escrever string com aspa simples ou dupla, tanto faz.

respostaPythonica = 'Quarenta" e dois'

# tem variavel booleana
simNao = True

def fatorial(n):
    if n == 0:
        return 1
    else:
        return n * fatorial(n - 1)

print(fatorial((4)))
# python não precisa de função main
# True não é usado apenas para verdadeiro e falso. Basicamente um açúcar sintático para 1
# False é como se fosse o 0

# expressão ternária em python
# 12 if -1 else 0
# varios outros valores reprensetam verdadeiro em comparação
# string não vazia, numero diferente de 0, é True
# string vazia, 0, é False

# Valor especial que é mais próximo de Null, é um valor especial que representa o nada.
# None, também representa o False

# Lista vazia em python é False
# com notação de tipo na função
# para string, tipo é str
# booleanos, é bool
# flutuantes, é float
def somaNumeros(n:int) -> int:
    if n < 0:
        return 0
    else:
        # Lista na vdd é array dinamico, como vector de c++
        soma = 0
        # contador = 0
        # while contador <= n:
        #     soma = soma + contador
        #     contador += 1
        # atribuição não é uma expressão, não da pra colocar no if como em c++
        # for in
        for x in range(1, n+1):
            soma += x
        return soma

print(somaNumeros(10))

# Python não é uma linguagem compilada, é uma linguagem interpretada (verdade para maioria das linguagens de script)
# não tem etapa de compilação, é só rodar.