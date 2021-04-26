package lista.Q4;


public class Main {
    public static void main(String[] args) {
        Conta minhaConta = new Conta(1512, 1, new Senha("A1B2C3", 123456));
        
        System.out.println(minhaConta.getSenha().getSenhaLetrasNumeros());
        System.out.println(minhaConta.getNumeroIdentificacao());
        minhaConta.setSenha("ABC123", minhaConta.getSenha().getSenhaNumeros());
        System.out.println(minhaConta.getSenha().getSenhaLetrasNumeros());
    }
}
