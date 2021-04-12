// 

public class Aula2 {
    public static void main(String args[]) {
        // em java sempre que quero criar um objeto eu uso o opertador new
        Horario h1 = new Horario(5, 34, 42);
        // h1.hora = 15;
        // h1.minuto = 34;
        // h1.segundo = 42;
        System.out.println(h1); // chama internamente o método publico toString
        Horario h2 = new Horario(5, 0, 42);
        // h2.hora = 5;
        // h2.minuto = 0;
        // h2.segundo = 42;
        System.out.println(h2); // chama internamente o método publico toString
        Horario h3 = new Horario();
        Horario h4 = new Horario(5, 10);

        // todos objetos em java tem o método toString, por herença.
    }
}

class Horario {
    
    // constante em java -> public static final int nome_constante
    private int hora;
    private int minuto;
    private int segundo;
    // private só consegue ser acessível dentro da classe horário
    // público é acessível pra qualquer outra classe, mesmo que estejam em pacotes diferentes.
    Horario() {}

    Horario(int hora, int minuto) {
        // this.hora = hora;
        // this.minuto = minuto;
        this(hora, minuto , 0);
    }

    Horario(int hora, int minuto, int segundo) {
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

// Todo arquivo que tem método main precisa ter uma classe publica que tem que ter o mesmo
// nome do arquivo, e a main dentro dele