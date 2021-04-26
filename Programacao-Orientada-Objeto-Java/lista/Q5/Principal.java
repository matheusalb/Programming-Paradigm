package lista.Q5;

public class Principal {

    private static String[] nomesPessoas(ColecaoVetor colecao) {
        String[] nomes = new String[colecao.tamanhoColecaoNaoNull()];

        for (int i = 0; i < colecao.tamanhoColecaoNaoNull(); ++i) {
            nomes[i] = colecao.getPessoaNome(i);
        }

        return nomes;
    }
    public static void main(String[] args) {
        ColecaoVetor colecao = new ColecaoVetor();
        
        Professor p1 = new Professor("Fernando","123456789", "Ciência da Computação", "Todas");
        Professor p2 = new Professor("Rick", "123333333", "Matemática", "Cálculo");
        Aluno a1 = new Aluno("Michael", "222222222", "987643221", "Engenharia da Computação");

        colecao.inserir(p1);
        System.out.println("Vagas Restantes: " + (colecao.getMaxSize() - colecao.tamanhoColecaoNaoNull()));
        colecao.inserir(p2);
        System.out.println("Vagas Restantes: " + (colecao.getMaxSize() - colecao.tamanhoColecaoNaoNull()));
        colecao.inserir(a1);
        System.out.println("Vagas Restantes: " + (colecao.getMaxSize() - colecao.tamanhoColecaoNaoNull()));

        String[] nomes = nomesPessoas(colecao);

        for (int i = 0; i < colecao.tamanhoColecaoNaoNull(); ++i) {
            System.out.println(nomes[i]);
        }
    }

}
