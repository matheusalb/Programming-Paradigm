package lista.Q5;

public class Aluno extends Pessoa{
    protected String matricula;
    protected String curso;

    public Aluno(String nome, String cpf, String matricula, String curso) {
        super(nome, cpf);
        this.matricula = matricula;
        this.curso = curso;
    }
    
    public String getMatricula() {
        return this.matricula;
    }

    public String getCurso() {
        return this.curso;
    }

    @Override
    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
}
