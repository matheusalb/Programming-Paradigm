package lista.Q2;

public class Texto {
    
    private String texto;

    public Texto(String texto) {
        this.texto = texto;
    }

    public void imprimir() {
        System.out.println(this.texto);
    }

    public int numTotalPalavrasTexto() {
        String[] palavras = this.texto.split("[\\p{Punct}\\s]+");
        int quantidade = palavras.length;
        if (palavras.length > 0 && palavras[0].length() == 0) quantidade--;
        return quantidade;
    }

    public int freqSubstring(String substr) {
        int frequencia = (this.texto.split(substr, -1).length) - 1;
        return frequencia;
    }

    public void substituirPalavra(String toChange, String toReplace) {
        toChange ="(?<=\\p{Punct}|\\s|^)" + toChange + "(?=\\p{Punct}|\\s)";
        String novoTexto = this.texto.replaceAll(toChange, toReplace);
        this.texto = novoTexto;
    }

}
