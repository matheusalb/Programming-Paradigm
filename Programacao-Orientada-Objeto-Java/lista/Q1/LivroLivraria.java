package lista.Q1;

public class LivroLivraria extends Livro {
    
    private Boolean foiVendido;

    public LivroLivraria() {
        this.foiVendido = false;
    }

    public void venderLivro() {
        
        if (!this.foiVendido){
            // Livro não foi vendido
            System.out.println("Livro: " + this.getTitulo() + " Vendido!\nObrigado pela compra!");
            this.foiVendido = true;
        }
        else {
            // Livro já foi vendido
            System.out.println("Infelizmente o livro: "+ this.getTitulo() +" já foi vendido!");
        }
    }
}
