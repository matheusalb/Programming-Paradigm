// Java é estaticamente tipada: funções tem tipo de resultado, tipo de parâmetro
// Quase todos os valores que o programa java manipula são objetos.
// Tudo que você define num programa em java são definidos em termos de classes, como nesse exemplo.
// OOP is everywhere
// Java gerencia memória automaticamente. Tem um coletor de lixo
// programas de java rodam numa máquina virtual que interpeta bytecode e rodas os programas.
// é a infraestrutura de tempo de execução da linguagem,
// em C/c++ é empacotado no executável.

// variaveis globais geralmente tem o static, e existem em toda execução da JVM.
public class Aula1 {
    // funcoes sempre dentro de classes, exceção para função lambda

    // um método static é o mais próximo do que temos em C e Python, de uma função
    // que não é um método. no sentido que ele pode ser executado, mesmo sem criar objetos da classe.
    // posso chamar ele pelo nome da classe
    public static void main(String args[]) {
        int x = 10;
        // x = "não pode!";  tem que ter casamento de tipos
        double m = 12;
        m = m + x;  // converte o int para double, resultado é double
        // x = m + x;  // não consigo guardar num int
        String text = m + "Sempre posso concatenar objetos que tenham o método 'to string' com string, ";
        
        // String é um tipo de dado diferente, pois String é um objeto
        boolean simNao = true; // boolean é um tipo primitivo. estão fora da ideia de OO.
        int i = 0; // tipos primitovos, são alocados estaticamentes, geralmente, tamanho pré-determinado. não tem métodos a partir deles.
        // tem tipos auxiliares que se converterem automaticamente em objetos, Integer por ex.
        // facilita se quiser usar eles, mas primitivos são mais otimizados.
        // tipo de referência: é qualquer coisa que precise que você crie um objeto, por ex String.
        String souRef = "ABC";
        String souRef2 = 123 + "";
        // Strings são imutáveis.

        // Java veio com uma ideia de um c++ mais simples, com ponteiros implícitos.
        
        // na parte heap da memória fica tudo que foi criado com new, coleta de lixo cuida dessa parte
        System.out.println("Hello World!");
        int q2 = Aula1.devolve42();
        // como estão na mesma classe, posso chamar direto
        int q42 = devolve42();

        System.out.println(primosEntreSi(42, 91));
        System.out.println(primosEntreSi(31, 97));

        int[] souUmArray = new int[100];
        System.out.println(souUmArray.length);
        souUmArray[0] = 42*42;
        System.out.println(souUmArray[0]);
    }

    // geralmente você não usa muito static
    public static int devolve42() {
        return 42;
    }

    
    // para desevolver em java, usar uma ide como intellij idea
    // java tem um padrão de nomenclatura muito fortemente seguido
    // nomé de classe começa com letra maiuscula, nome de metodo começa com letra minuscula
    // Todos os casos usam camelCase

    // execção para camel case são constantes;
    // snake case, separado por _ 
    public static final int SOU_RESPOSTA = 42;


    public static boolean primosEntreSi(int x, int y) {
        int div = x;
        while (div > 1) {
            if (x % div == 0 && y % div == 0) {
                return false;
            }
            
            div -= 1;
        }
        return true;
    }
    // alocação de array em java SEMPRE é dinâmica, diferent de C
}

// Actually, String ob-
// jects in Java are immutable—they cannot be modified after they’re created. Therefore, it’s
// safe to have many references to one String object. This is not normally the case for objects
// of most other classes in Java.