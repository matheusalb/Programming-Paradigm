def maiorElemento(numeros):
    if len(numeros) == 0:
        # erro em tempo de execução (RuntimeError)
        # podemos criar nossos próprios tipos de erros para sinalizar melhor a natureza
        # do erro
        # ValueError é um objeto
        raise ValueError("Lista Vazia")
        # como não to tratando o erro, o programa é interrompido
        # existem caso que conseguimos recuperar de um erro, outras vezes não
        # o raise é como um return, ao executar um raise, ele volta pra função que a chamou
        # e executa o raise de novo na função que tinha chamado, e sai fazendo isso em cascata
        # até que tenha uma que trate a exceção, seja captutrada e tratada.
        # se isso não for feito, o programa capota.
        # historicamente erros são chamados de exceções
        # um objeto do tipo RuntimeError é uma exceção
    maior = numeros[0]
    for x in numeros:
        if x > maior:
            maior = x
    return maior

# Para tratar erro coloco a execução dentro de uma zona protegida
try: 
    print(maiorElemento([]))
except ValueError as err:
    # except sendo mais geral, não recomendável, pois qualquer erro cai nele
    # uso de só except é muito ruim pois pode capturar erros por acidente.
    print(err)
    # printar pro usuario não é uma boa ideia em projetos grandes, melhor fazer um log
    # parei em 36

# try :
# except:
# finally: <- o bloco aqui é sempre executado independetemente do que corre na região protegida.