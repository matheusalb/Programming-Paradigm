class Pessoa:
    def __init__(self, idade, sexo, cor_cabelo, cor_olhos):
        self.idade = idade
        self.sexo = sexo
        self.cor_olhos = cor_olhos
        self.cor_cabelo = cor_cabelo
    

if __name__ == "__main__":

    max_idade = -1
    lista_pessoas = []
    quant_req = 0

    idade = int(input())
    while idade != -1:
        inf = input()
        inf = inf.split()
        pess = Pessoa(idade, inf[0], inf[1], inf[2])
        lista_pessoas.append(pess)
        max_idade = idade if idade > max_idade else max_idade
        
        if pess.idade >= 18 and pess.idade <= 35 and pess.cor_cabelo == 'l' \
           and pess.cor_olhos == 'v' and pess.sexo == 'f':
           quant_req += 1

        idade = int(input())
    
    else:
        # else só é executado se entrou no while pelo menos uma vez
        porcent = quant_req / len(lista_pessoas) * 100
        print("Mais velho:", max_idade)
        print(f'Mulheres com olhos verdes, loiras com 18 a 35 anos: {porcent:.2f}%')

