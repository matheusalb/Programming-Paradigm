package lista.Q5;

public abstract class Pessoa {
    protected String nome;
    protected String cpf;
    
    public Pessoa(String nome, String cpf) {
        this.nome = nome;
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public String getCpf() {
        return cpf;
    }
    
    public abstract void setNome(String nome);
    public abstract void setCpf(String cpf);
}
