public class Teste {
    
    public static void main(String[] args) {
        // String meu_nome = "Matheus";
        // dale a = new dale(meu_nome);
        
        // if(meu_nome == a.nome) {
        //     System.out.println("é igual boy");
        // }
        // else {
        //     System.out.println("deu ruim boy");
        // }
        
        // // segundo teste
        // pai paizin = new dale("veva");
        // paizin.printaai(); // printa dale
        // ((pai)paizin).printaai(); // printa dale

        // 3
        Contador cont = new Contador();
        cont.modifica(30);
    }
}

class pai {
    private int veva;

    void printaai() {
        System.out.println("pai...");
    }
}

class dale extends pai {
    public String nome;
    
    dale (String nome) {
        this.nome = nome;
    }

    void printaai() {
        System.out.println("dale");
    }
}

class dale2 extends pai {
    public String nome;
    
    public dale2 () {
        this("veva");
        int v = 10; // a chamada ao construtor deve ser a primeira instrução E SÓ PODE SER CHAMADO NO CONSTRUTOR
        veva = v;
    }

    public dale2 (String nome) {
        this.nome = nome;
    }

    void printaai() {
        System.out.println("dale");
    }
}

abstract class pai2 {
    private int veva;

    void printaai() {
        System.out.println("pai...");
    }
    
    // abstract public int fazai();
}

// quem herda de uma classe abstrata DEVE implementar o método abstrato
class dale3 extends pai2 {
    public String nome;
    // pai2 variav = new pai2(); // não da pra instanciar objeto de classe abstrata
    public dale3 () {
        this("veva");
        int v = 10; // a chamada ao construtor deve ser a primeira instrução
    }

    public dale3 (String nome) {
        this.nome = nome;
    }

    void printaai() {
        System.out.println("dale");
    }
}
// Interface methods are always public
// and abstract , so they do not need to be declared as such

interface Resetavel {
    public void reseta();
    public void modifica(int tamanho);
}

interface Modificavel {
    public void reseta(int origem);
    // public void modifica(int tamanho);
}

class Contador implements Resetavel, Modificavel {
    int valor;

    Contador() {
        System.out.print("criei");
    }
    public void reseta() {
        valor = 1;
    }
    public void reseta(int orig) {
        valor = orig;
    }

    @Override
    public void modifica(int tam) {
        valor = tam;
    }

}

// protected
// O modificador protected torna o membro acessível às classes do mesmo pacote ou através de herança, seus membros herdados não são acessíveis a outras classes fora do pacote em que foram declarados.

