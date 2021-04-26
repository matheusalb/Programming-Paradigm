package lista.Q4;

public class Senha {
    protected String senhaLetrasNumeros;
    protected int senhaNumeros;

    public Senha(String senhaLetrasNumeros, int senhaNumeros) {
        this.senhaLetrasNumeros = senhaLetrasNumeros;
        this.senhaNumeros = senhaNumeros;
    }

    public String getSenhaLetrasNumeros() {
        return this.senhaLetrasNumeros;
    }

    public int getSenhaNumeros() {
        return this.senhaNumeros;
    }

    public void setSenhaLetrasNumeros(String senhaLetrasNumeros) {
        this.senhaLetrasNumeros = senhaLetrasNumeros;
    }

    public void setSenhaNumeros(int senhaNumeros) {
        this.senhaNumeros = senhaNumeros;
    }
}
