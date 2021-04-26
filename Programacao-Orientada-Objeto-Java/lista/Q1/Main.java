package lista.Q1;

public class Main {
    public static void main(String[] args) {
        LivroLivraria livroLivraria1 = new LivroLivraria();
        LivroBiblioteca livroBiblioteca1 = new LivroBiblioteca();
        livroLivraria1.setTitulo("Senhor dos Aneis");
        livroBiblioteca1.setTitulo("Guerra dos Tronos");
        livroLivraria1.venderLivro();
        livroLivraria1.venderLivro();
        livroBiblioteca1.emprestarLivro();
        livroBiblioteca1.emprestarLivro();
    }
}
