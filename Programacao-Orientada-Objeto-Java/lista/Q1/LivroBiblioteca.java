package lista.Q1;

public class LivroBiblioteca extends Livro {
    
    private Boolean foiEmprestado;

    public LivroBiblioteca() {
        this.foiEmprestado = false;
    }

    public void emprestarLivro() {

        if (!this.foiEmprestado) {
            // Livro não foi emprestado
            System.out.println("Livro: " + this.getTitulo() + " Emprestado!\nBoa Leitura!");
            this.foiEmprestado = true;
        }
        else {
            // Livro já foi emprestado
            System.out.println("Infelizmente, o livro: "+ this.getTitulo() +" já foi emprestado!");
        }
    }
}
