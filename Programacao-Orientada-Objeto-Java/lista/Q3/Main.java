package lista.Q3;

public class Main {
    
    public static void main(String[] args) {
        Pessoa p1 = new Pessoa();
        Pessoa p2 = new Pessoa("Michelle", 41, "Ensino Superior Completo", IdentidadeGenero.transgênero, "Heterossexual", "Masculino");
        
        System.out.println(p2.getIdentidadeGenero());
        System.out.println(p1.getIdentidadeGenero());
        p1.setIdade(39);
        p1.setNome("Lion");
        System.out.println(p1.getNome());
        System.out.println(p1.getIdade());
        p2.trabalhar();

    }
}
