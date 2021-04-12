public class Teste {
    
    public static void main(String[] args) {
        String meu_nome = "Matheus";
        dale a = new dale(meu_nome);
        
        if(meu_nome == a.nome) {
            System.out.println("é igual boy");
        }
        else {
            System.out.println("deu ruim boy");
        }
    }
}

class dale {
    public String nome;
    
    dale (String nome) {
        this.nome = nome;
    }
}
