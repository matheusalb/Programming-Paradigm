package lista.Q2;


public class Main {

    public static void main(String[] args) {
        Texto meu = new Texto("       Olá, meu nome é Matheus. \tVou escrever coisas aleatórias: aaAa, aaAa,aaAa;aaaaaAa aaAaaaaaa.  ?123!! 123 \n4321 555 199 joga10? . joga20!?@");
        meu.imprimir();
        System.out.println(meu.numTotalPalavrasTexto());
        System.out.println(meu.freqSubstring("joga1"));
        meu.substituirPalavra("aaAa", "BB");
        meu.imprimir();
    }
    
}
