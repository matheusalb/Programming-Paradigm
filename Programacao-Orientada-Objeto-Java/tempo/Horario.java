package tempo;
// se o arquivo tá no pacote tempo, ele tem que tá no diretório que tem exatamente
// o mesmo nome desse pacote, no caso, tempo.

// caso tempo existivesse dentro de um pacote chamado existencia
// ou seja, eu teria um diretório existencia, e dentro dele um diretório tempo
// com isso o pacote dele seria assim
// package existencia.tempo;
// o nome do pacote sempre tem que está completo, incluindo os pacotes mais externos
// lembra namespaces de C#, mas não tem esse problema de nome completo

public class Horario {
    
    private int hora;
    private int minuto;
    private int segundo;

    // se eu não coloco o restritor de vis. eles só são vistos dentro do pacote
    // ao importar o pacote e tentar chamar o construtor eu não conseguiria
    // visibilidade de pacote, só vista por outras classes dentro do pacote
    Horario() {}

    public Horario(int hora, int minuto) {
        // this.hora = hora;
        // this.minuto = minuto;
        this(hora, minuto , 0);
    }

    public Horario(int hora, int minuto, int segundo) {
        this.hora = hora;
        this.minuto = minuto;
        this.segundo = segundo;
    }
    public String toString() {
        // qualquer coisa concatenada com string vira uma string
        // int hora = 12;
        return this.hora + "h" + this.minuto + "m" + this.segundo + "s";
    }

}
