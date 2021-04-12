# python é um linguagem onde todos os valores são objetos.

# numa lingugem OO, geralmente temos duas opções para criar objetos
# 1. estilo js, utilizando protótipo, escreve direto no código como é um objeto, e cria copias do obj em tempo de execução.
# 2. Ou a mais usada, utilizando classe.

class Tempo:
    # init é o construtor
    def __init__(self, h: int, m: int, s: int):
        # o sumblinado duas vezes antes e dps, é pra indicar que é um método especial
        # seu programa normalmente não chama, convesão de não chamar, como um método private
        # self representa o próprio objeto criado.
        # todos metódos tem self como primeiro parâmetro
        # essas atribuições são as que criam de fato esses atributos no objeto.
        # sempre deve se usar self para se referenciar a atributos e metodos do objeto
        self.segundo = s
        self.minuto = m
        self.hora = h
    # essa função retorna uma forma string desse objeto.
    # essa é uma caracteristica chama de duck typing
    def __str__(self):
        return str(self.hora) + "h" + str(self.minuto) + "m" + str(self.segundo) + "s" 

    def segundos(self):
        return self.hora*360 \
            +  self.minuto*60 \
            +  self.segundo

# em python o OO é bem mais dinânima que em c++ por exemplo.
# você não diz explicitamente os atributos do objetos, e isso fica fixo para sempre
# qaulquer atribuição que você fizer referênciando um objeto, você cria um novo atributo nele.
t = Tempo(21, 42, 24)
# myPy chega tipos
# t:Tempo = Tempo(21, 42, 24)

class C:
    """classe dummy"""
c = C()

# posso criar atributos novos não definidos na classe dinamicamente
c.quantidade = 42
c.idade = 22

# self é equivalente a this em algumas outras linguagens


# passado = tempo(22,59,30)
# agora = tempo(22,59, 30)
# passado == agora # verifica o endereço de memória, vai da False
# precisamos implementar para python saber fazer a comparação

t1 = Tempo(21,10,10)
t2 = Tempo(8,9,43)
# a função __str__ é chamada internamente
print(t1)



# cria u  iterator para a minha classe, para que eu consiga iterar sobre ela
class LinkedListIterator:
    def __init__(self, e):
        self.elements = e
        self.current = e
    def __next__(self):
        if not self.current:
            raise StopIteration
        result = self.current.element
        self.current = self.current.next
        return result

class Node:
    def __init__(self, e):
        self.element = e
        self.next = None

class LinkedList:
    def __init__ (self, e = None):
        if not e:
            self.elements = Node(e)
        else:
            self.elements = None

    def append(self, e):
        current = self.elements
        if not current:
            self.elements = Node(e)
            return
        while current.next:
            current = current.next
        current.next = Node(e)
    
    # Duck typing em ação
    # def __str__(self) -> str:

    # para iterar temos dois metodos __iter__ e __next__, não precisam ambos está definido pela mesma classe
    def __iter__(self):
        # retorna um objeto, pode ser o mesmo obj a partir do qual __iter__ foi chamado
        return LinkedListIterator(self.elements)

l1 = LinkedList()
l2 = LinkedList(42)


ll = LinkedList(3)
ll.append(10)
ll.append(42)
ll.append(50)
ll.append(-1)
for x in ll:
    # primeiro se chama metodo __iter__, depois de pegar o obj retornado por ele
    # chama o método __next__
    print(x)

# em c++ e java, precisariamos defiinr um tipo especifico dos objetos
# que são iteraveis, dizendo as funções que ele precisa implementar


# Instruções assert são úteis porque distinguem o código que lida com condições normais do código que verifica erros.
# def add_time(t1, t2):
#     assert valid_time(t1) and valid_time(t2)
#     seconds = time_to_int(t1) + time_to_int(t2)
#     return int_to_time(seconds)

# class Time:
#     def print_time(time):
#         print('%.2d:%.2d:%.2d' % (time.hour, time.minute, time.second))
# >>>start = Time()
# >>> start.hour = 9
# >>> start.minute = 45
# >>> start.second = 00
# >>> start.print_time()
# 09:45:00
# Dentro do método, o sujeito é atribuído ao primeiro parâmetro, portanto, neste caso, start é atribuído a time.
# Por convenção, o primeiro parâmetro de um método chama-se self, então seria mais comum escrever print_time desta forma:

# A propósito, um argumento posicional é o que não tem um nome de parâmetro; isto é, não é um argumento de palavra-chave. Nesta chamada da função:
# sketch(parrot, cage, dead=True)
# parrot e cage são posicionais, e dead é um argumento de palavra-chave.


# Reescrever is_after (de “Time”, na página 231) é ligeiramente mais complicado, porque ela recebe dois objetos Time como parâmetros. Nesse caso, a convenção é denominar o primeiro parâmetro self e o segundo parâmetro other
# dentro da classe Time:
# def is_after(self, other):
#     return self.time_to_int() > other.time_to_int()
# >>> end.is_after(start)
# É comum que os parâmetros de __init__ tenham os mesmos nomes que os atributos. A instrução

# __str__ é um método especial, como __init__, usado para retornar uma representação de string de um objeto.

# # dentro da classe Time:

#     def __str__(self):
#         return '%.2d:%.2d:%.2d' % (self.hour, self.minute, self.second)
# >>> time = Time(9, 45)
# >>> print(time)
# 09:45:00
# Quando escrevo uma nova classe, quase sempre começo escrevendo __init__, o que facilita a instanciação de objetos, e __str__, que é útil para a depuração.


# Sobrecarga de operadores
# # dentro da classe Time:

#     def __add__(self, other):
#         seconds = self.time_to_int() + other.time_to_int()
#         return int_to_time(seconds)
# >>> start = Time(9, 45)
# >>> duration = Time(1, 35)
# >>> print(start + duration)
# 11:20:00
# http://docs.python.org/3/reference/datamodel.html#specialnames


#  seguir, veja uma versão de __add__, que verifica o tipo de other e invoca add_time ou increment:

# # dentro da classe Time:
#     def __add__(self, other):
#         if isinstance(other, Time):
#             return self.add_time(other)
#         else:
#             return self.increment(other)

#     def add_time(self, other):
#         seconds = self.time_to_int() + other.time_to_int()
#         return int_to_time(seconds)

#     def increment(self, seconds):
#         seconds += self.time_to_int()
#         return int_to_time(seconds)

# >>> start = Time(9, 45)
# >>> duration = Time(1, 35)
# >>> print(start + duration)
# 11:20:00
# >>> print(start + 1337)
# 10:07:17

# Infelizmente, esta implementação da adição não é comutativa. Se o número inteiro for o primeiro operando, você recebe

# >>> print(1337 + start)
# TypeError: unsupported operand type(s) for +: 'int' and 'instance'

# o método especial __radd__, que significa “adição à direita”. Esse método é invocado quando um objeto Time aparece no lado direito do operador +. Aqui está a definição:
# # dentro da classe Time:
#     def __radd__(self, other):
#         return self.__add__(other)
# >> print(1337 + start)
# 10:07:17

# a função integrada sum, que adiciona os elementos de uma sequência, funciona só se os elementos da sequência forem compatíveis com adição
# Em geral, se todas as operações dentro de uma função forem compatíveis com um dado tipo, não haverá problemas.

# Outra forma de acessar atributos é com a função integrada vars, que recebe um objeto e retorna um dicionário que mapeia os nomes dos atributos (como strings) aos seus valores:

# >>> p = Point(3, 4)
# >>> vars(p)
# {'y': 4, 'x': 3}

# Para facilitar a depuração, pode ser útil usar esta função:

# def print_attributes(obj):
#     for attr in vars(obj):
#         print(attr, getattr(obj, attr))
# print_attributes atravessa o dicionário e imprime cada nome de atributo e o seu valor correspondente.
# A função integrada getattr recebe um objeto e um nome de atributo (como uma string) e devolve o valor do atributo.

