import java.util.ArrayList; // fully-qualified name
// o apelido é sempre o nome da classe, nesse caso, o ArrayList
import tempo.Horario;

public class Aula3 {
    public static void main(String[] args) {
        Horario h1 = new Horario(5, 34, 42);
        Horario h2 = new Horario(5, 0, 42);
        // Horario h3 = new Horario(); // esse da erro por causa que não tá public
        Horario h4 = new Horario(5, 10);

        // em java temos uma classe que implementa o array dinamico
        // o vector para java

        // Polimorfismo paramêtrico
        // java.util.ArrayList<Horario> listinha = new java.util.ArrayList<Horario>();        
        // java.util.ArrayList <- uma hierarquia de pacotes e no final uma classe 
        ArrayList<Horario> listinha = new ArrayList<Horario>();        
        listinha.add(h1);
        listinha.add(h2);
        // listinha.add(h3);
        listinha.add(h4);
        // Pacotes criam restrições de visibilidade, classes só são visiveis p outros pacotes
        // se forem públicos, e seus métodos só podem ser usados se forem públicos.
        // public pode ser usado entre pacotes, privado não pode ser usado nem fora do mesmo arquivo
        // quando não colocamos nenhum identificador -> atributo é visto dentro do pacote, mas não fora dele.
        // Package access is rarely used.
        // Classes in the same source file are part of the same package.

        // Only public types ((classes, interfaces and enums)) can be reused outside the package in which they’re declared.
        // is not public , so it can be used only by class
        // List and any other types declared in the same package. declarada com package acess

        // If a source-code file contains more than one type,
        // all types in the file are placed in the same package when the file is compiled.
        // Each Java source-code file may contain only one package declaration, and it must pre-
        // cede all other declarations and statements.

        // A package name’s parts are separated by dots ( . ), and there typically are two or more parts.
        // To ensure unique package names, you typically begin the name with your institution’s or
        // company’s Internet domain name in reverse order—e.g., our domain name is deitel.com ,
        // so we begin our package names with com.deitel . For the domain name yourcollege .edu ,
        // you’d begin the package name with edu. yourcollege.
        //         After the reversed domain name, you can specify additional parts in a package name.
        // If you’re part of a university with many schools or company with many divisions, you might
        // use the school or division name as the next part of the package name. Similarly, if the types
        // are for a specific project, you might include the project name as part of the package name.
        // We chose datastructures as the next part in our package name to indicate that classes
        // ListNode , List and EmptyListException are from this data structures chapter.
        
        //         You can use this fully qualified name in your
        // programs, or you can import the class and use its simple name (the class name by itself—
        // List ) in the program.
        //         If another package also contains a List class, the fully qualified class
        // names can be used to distinguish between the classes in the program and prevent a name
        // conflict (also called a name collision).
        
        //         When a Java
        // file containing a package declaration is compiled, the resulting class file is placed in a di-
        // rectory specified by the declaration. Classes in the package com.deitel.datastructures
        // are placed in the directory (com -> deitel -> datastructures)
        //         The javac command-line option -d causes the compiler to create the directories
        // based on the package declaration. The option also specifies where the top-level directory
        // in the package name should be placed on your system—you may specify a relative or com-
        // plete path to this location.

        //         Because class ListTest is in a different package from List and EmptyListExcep-
        // tion , you must either import these classes so that class ListTest can use them (lines 3–4
        // of Fig. 21.5) or you must fully qualify the names List and EmptyListException every-
        // where they’re used throughout class ListTest .
        
        //         Lines 3–4 of Fig. 21.5 are single-type-import declarations—they each specify one class to
        // import. When a source-code file uses multiple classes from a package, you can import those
        // classes with a a type-import-on-demand declaration of the form
        // import packagename .*;
        // which uses an asterisk ( * ) at its end to inform the compiler that all public classes from the
        // packagename package can be used in the file containing the import .
        
        // Specifying the Classpath When Compiling a Program
        // By default, the classpath consists only of the current directory. However, the classpath
        // can be modified
    }
}

// class Horario {
    
//     private int hora;
//     private int minuto;
//     private int segundo;

//     Horario() {}

//     Horario(int hora, int minuto) {
//         // this.hora = hora;
//         // this.minuto = minuto;
//         this(hora, minuto , 0);
//     }

//     Horario(int hora, int minuto, int segundo) {
//         this.hora = hora;
//         this.minuto = minuto;
//         this.segundo = segundo;
//     }
//     public String toString() {
//         // qualquer coisa concatenada com string vira uma string
//         // int hora = 12;
//         return this.hora + "h" + this.minuto + "m" + this.segundo + "s";
//     }

// }
