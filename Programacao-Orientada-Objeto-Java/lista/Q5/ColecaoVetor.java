package lista.Q5;

public class ColecaoVetor implements Colecao{
    protected Pessoa[] pessoas;
    protected int length; 
    
    public ColecaoVetor() {
        this.pessoas = new Pessoa[5];
        this.length = 0;
    }

    public String getPessoaNome(int index) {
        if (index < this.length) {
            return this.pessoas[index].getNome();
        }
        System.out.println("Out of Range!");
        return null;
    }

    public int getMaxSize() {
        return 5;
    }

    @Override
    public void inserir(Pessoa p) {
        if (this.length < 5) {
            pessoas[this.length] = p;
            this.length++;
        }
        else {
            System.out.println("Vector está cheio!");
        }
    }

    @Override
    public int tamanhoColecaoNaoNull() {
        return this.length;
    }
}
