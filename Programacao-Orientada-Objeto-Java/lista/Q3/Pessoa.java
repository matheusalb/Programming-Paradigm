package lista.Q3;

public class Pessoa {
    protected String nome;
    protected int idade;
    protected String grauEscolaridade;
    protected IdentidadeGenero identidadeGenero;
    protected String orientacaoSexual;
    protected String sexoBiologico;

    public Pessoa() {
        this.nome = "Richard";
        this.idade = 34;
        this.grauEscolaridade = "Ensino Superior Completo";
        this.identidadeGenero = IdentidadeGenero.cisgênero;
        this.orientacaoSexual = "Heterossexual";
        this.sexoBiologico = "Masculino";
    }

    public Pessoa(String nome, int idade, String grauEscolaridade, 
                  IdentidadeGenero identidadeGenero, String orientacaoSexual,
                  String sexoBiologico) {
        
        this.nome = nome;
        this.idade = idade;
        this.grauEscolaridade = grauEscolaridade;
        this.identidadeGenero = identidadeGenero;
        this.orientacaoSexual = orientacaoSexual;
        this.sexoBiologico = sexoBiologico;
    }

    public String getNome() {
        return this.nome;
    }
    public int getIdade() {
        return this.idade;
    }
    public String getGrauEscolaridade() {
        return this.grauEscolaridade;
    }
    public IdentidadeGenero getIdentidadeGenero() {
        return this.identidadeGenero;
    }
    public String getOrientacaoSexual() {
        return this.orientacaoSexual;
    }
    public String getSexoBiologico() {
        return this.sexoBiologico;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public void setGrauDeEscolaridade(String grauEscolaridade) {
        this.grauEscolaridade = grauEscolaridade;
    }

    public void dormir() {
        System.out.println("Dormindo...");
    }

    public void cagar() {
        System.out.println("Cagando...");
    }

    public void comer() {
        System.out.println("Comendo...");
    }

    public void estudar() {
        System.out.println("Estudando...");
    }

    public void viver() {
        System.out.println("Vivendo...");
    }

    public void sobreviver() {
        System.out.println("Sobrevivendo...");
    }

    public void trabalhar() {
        System.out.println("Trabalhando...");
    }
}
