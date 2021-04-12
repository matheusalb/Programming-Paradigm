from typing import List
from functools import reduce
from typing import Dict
# preciso incluir para definir um tipo de Dict, List. 
# dicionário, lista, tupla. tipos compostos, precisa incluir.

# lista em python pode armazenar valores de diversos tipos.
# não recomendado!
# são arrays dinâmicos
numeros = [1,2,3,5,6, "Sou uma string"]
numeros2:List[int] = [1,2,3,5,6]

print(numeros[0])
print(numeros[5])
print(len(numeros))
numeros.append("Room for one more")
print(len(numeros))

def somaTudo(lista):
    soma = 0
    for x in lista:
        soma += x
    return soma

# somaTudo(numeros)

textos:List[str] = ["lisa", "rose", "jennie"]

listas:List[List[int]] = [[1,2,3],[4,5,-6]]
# não faz nem sentido chamar isso de matriz, não tem alocação contigua de memória
# uma lista na verdade é uma sequência de ponteiros.

listas[1] = "tiriri"
print(listas)


bagunca = ["caos", 42, False, [7,7,7]]
bagunca.pop(0) # o pop devolve o elemento removido
# também tem o remove, dar uma olhada dps

bagunca.insert(1, "Demogorgon")
bagunca.insert(42, "Beholder") # como 42 é maior que último indice, ele só coloca no final da lista

print(bagunca[-1])
# print(bagunca[len(bagunca)-1]) mesma coisa
# não é circular, se indice for -x e x for maior que o tamanho, vai da erro no acesso do index

listaa = [3.14, 1.41, 1.73, 2.24, 1.62, 0]

listaa2 = list(map((lambda x: x*x), listaa))
# retorna um objeto iteravel, tem q converter p lista
# corpo de uma lambda não pode ter comandos, somente uma expressão
print(list(filter(lambda x: x > 2 ,listaa)))
print(reduce(lambda x, y: x + y, listaa, 0))


# Listas tem semântica de refêrencia
outraLista = listaa # passa como referencia pra ele.
# apotam para o mesmo endereço de memória
outraLista.append(42)
outraLista is listaa
print(listaa)

# pra criar uma copia preciso usar o operador de slice
outraListacopia = listaa[:]

codigos:Dict[str, str] = {'BR':55, 'US':1, 'JP':81, 'UK':44}
codigos['BR']
codigos['TO'] = 676
# não tem ordem entre os elementos, não pode ter duplicação de chaves

for k in codigos:
    print(codigos[k])
# k é a chave de cada elemento
for v in codigos.values():
    print(v)
# v são os valores

len(codigos)


# >>> cheeses = ['Cheddar', 'Edam', 'Gouda']
# >>> 'Edam' in cheeses
# True
# >>> 'Brie' in cheeses
# False

# O operador + concatena listas:

# O operador * repete a lista um dado número de vezes:
# >>> [1, 2, 3] * 3
# [1, 2, 3, 1, 2, 3, 1, 2, 3]

# >>> t = ['a', 'b', 'c', 'd', 'e', 'f']
# >>> t[1:3] = ['x', 'y']

# >>> a = 'banana'
# >>> b = 'banana'
# >>> a is b
# True

# >>> a = [1, 2, 3]
# >>> b = [1, 2, 3]
# >>> a is b
# False

# Para verificar se duas variáveis se referem ao mesmo objeto, use is
# Nesse caso, diríamos que as duas listas são equivalentes, porque elas têm os mesmos elementos, mas não idênticas, porque elas não são o mesmo objeto. Se dois objetos forem idênticos, eles também são equivalentes, mas se eles forem equivalentes, não são necessariamente idênticos.



# >>> a = [1, 2, 3]
# >>> b = a
# >>> b is a
# True

# Apesar de esse comportamento poder ser útil, ele é passível de erros. Em geral, é mais seguro evitar usar alias ao trabalhar com objetos mutáveis.
# Para objetos imutáveis como strings, usar alias não é um problema tão grande. Neste exemplo:
# a = 'banana'
# b = 'banana'
# Quase nunca faz diferença se a e b se referem à mesma string ou não.

def delete_head(t):
    del t[0]

# É importante distinguir entre operações que alteram listas e operações que criam novas listas. Por exemplo, o método append altera a lista, mas o operador + cria uma nova lista:

# >>> t3 = t1 + [4]
# >>> t1
# [1, 2, 3]
# >>> t3
# [1, 2, 3, 4]
# >>> t1

# def bad_delete_head(t):
#     t = t[1:]              # ERRADO!
# #

# def tail(t):
#     return t[1:] # resolve!


# A ordem dos pares chave-valor pode não ser a mesma. Se você digitar o mesmo exemplo no seu computador, pode receber um resultado diferente. Em geral, a ordem dos itens em um dicionário é imprevisível.

# Se a chave não estiver no dicionário, você recebe uma exceção:
# >>> eng2sp['four']
# KeyError: 'four'

# O operador in funciona em dicionários também; ele acusa se algo aparece como chave no dicionário (aparecer como valor não é o suficiente).



# known = {0:0, 1:1}
# def fibonacci(n):
#     if n in known:
#         return known[n]
#     res = fibonacci(n-1) + fibonacci(n-2)
#     known[n] = res
#     return res
# No exemplo anterior, known é criada fora da função, então pertence ao frame especial chamado __main__. As variáveis em __main__ às vezes são chamadas de globais, porque podem ser acessadas de qualquer função. Em contraste com as variáveis locais, que desaparecem quando sua função termina, as variáveis globais persistem de uma chamada da função à seguinte.

# been_called = False
# def example2():
#     been_called = True        # ERRADO
# Porém, se executá-la, você verá que o valor de been_called não se altera. O problema é que example2 cria uma nova variável local chamada been_called. A variável local some quando a função termina e não tem efeito sobre a variável global.

# been_called = False
# def example2():
#     global been_called
#     been_called = True # CERTO

# count = 0
# def example3():
#     count = count + 1        # ERRADO da erro de definir count atribuindo count

# Se uma variável global se referir a um valor mutável, você pode alterar o valor sem declarar a variável:
# known = {0:0, 1:1}
# def example4():
#     known[2] = 1

# Então você pode adicionar, retirar e substituir elementos de uma lista global ou dicionário, mas se quiser reatribuir a variável, precisa declará-la:
# def example5():
#     global known
#     known = dict()
