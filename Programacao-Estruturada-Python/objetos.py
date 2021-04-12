# O número inteiro é um objeto em python
# Mesma coisa para string e lista
# Objetos geralmente tem métodos que podemos chamá-los através do operador '.'
# Objetos também tem variáveis dentro deles, chamados de atributos.
# Objetos = estado + comportamento (variaveis + funcoes);
# Objetos são criados a partir de construtores;
# Em python todo tipo define um objeto, mas quando pensamos em objeto
# pensamos em coisas mais complexas como dicionarios, listas, turtles.
# objectos são mecanismos de encapsulamento.

# objetos usam semântica de referência, tanto para função quanto para atribuição

# em Python podemos criar objetos dentro de funções e retorná-los.

# para passar um objeto como copia usamos
# import copy
# p2 = copy.copy(p1); p1 is f2 == False; p1 == p2 == False;
# O operador is indica que p1 e p2 não são o mesmo objeto, que é o que esperamos. Porém, você poderia ter esperado que == fosse apresentado como True, porque esses pontos contêm os mesmos dados. Nesse caso, pode ficar desapontado ao saber que, para instâncias,
# o comportamento padrão do operador == é o mesmo que o do operador is; ele verifica a identidade dos objetos, não a sua equivalência.
#  Isso acontece porque, para tipos definidos pelo programador, o Python não sabe o que deve ser considerado equivalente. Pelo menos, ainda não.

# Se você usar copy.copy para duplicar um retângulo, descobrirá que ele copia o objeto Rectangle, mas não o Point embutido nele:

# >>> box2 = copy.copy(box)
# >>> box2 is box
# False
# >>> box2.corner is box.corner
# True
# Esta operação chama-se cópia superficial porque copia o objeto e qualquer referência que contenha, mas não os objetos integrados.


# Felizmente, o módulo copy oferece um método chamado deepcopy que copia não só o objeto, mas também os objetos aos quais ele se refere, e os objetos aos quais estes se referem, e assim por diante. 
# >> box3 = copy.deepcopy(box)
# >>> box3 is box
# False
# >>> box3.corner is box.corner
# False
# box3 e box são objetos completamente separados.
# type(p) diz o tipo do objeto.
# Você também pode usar isinstance para verificar se um objeto é uma instância de uma classe:
# isinstance(p, Point)

# Caso não tenha certeza se um objeto tem determinado atributo, você pode usar a função integrada hasattr:
# >>> hasattr(p, 'x')
# True
# >>> hasattr(p, 'z')
# False
# O primeiro argumento pode ser qualquer objeto; o segundo argumento é uma string com o nome do atributo.

# Você também pode usar uma instrução try para ver se o objeto tem os atributos de que precisa:

# try:
#     x = p.x
# except AttributeError:
#     x = 0

# Atribuições criam referências para objetos, ao invés de cópias
