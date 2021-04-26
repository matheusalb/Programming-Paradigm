package lista.Q1;

public abstract class Livro {
    private String titulo;
    private String ISBN;
    private String autor;
    private int ano;
    private String editora;

    // Setters
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    
    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }
    
    public void setAutor(String autor) {
        this.autor = autor;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public void setEditora(String editora) {
        this.editora = editora;
    }

    // Getters
    public String getTitulo() {
        return this.titulo;
    }
    
    public String getISBN() {
        return this.ISBN;
    }
    
    public String getAutor() {
        return this.autor;
    }

    public int getAno() {
        return this.ano;
    }

    public String getEditora() {
        return this.editora;
    }
    
}
