package lista.Q4;

public class Conta {
    protected int numeroIdentificacao;
    protected int agencia;
    protected Senha senha;
    
    public Conta(int numeroIdentificacao, int agencia, Senha senha) {
        this.numeroIdentificacao = numeroIdentificacao;
        this.agencia = agencia;
        this.senha = senha;
    }

    public int getNumeroIdentificacao() {
        return this.numeroIdentificacao;
    }

    public int getAgencia() {
        return this.agencia;
    }

    public Senha getSenha() {
        return this.senha;
    }

    public void setNumeroIdentificacao(int numeroIdentificacao) {
        this.numeroIdentificacao = numeroIdentificacao;
    }

    public void setAgencia(int agencia) {
        this.agencia = agencia;
    }
    public void setSenha(String senhaLetrasNumeros, int senhaNumeros) {
        this.senha.setSenhaLetrasNumeros(senhaLetrasNumeros);
        this.senha.setSenhaNumeros(senhaNumeros);
    }
}
