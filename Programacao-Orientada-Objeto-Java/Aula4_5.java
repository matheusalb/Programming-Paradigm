
// Herança Objs: Reutilizar código, Reutilizar tipo de uma coisa, criar pontos para ser extendidos, mais fácil de adicionar 
// funcionalidades no futuro.
public class Aula4_5 {
    public static void main(String args[]) {
        // Soma exp = new Soma(new Valor(42), new Mult(new Valor(10), new Valor(3)));
        Expressao exp = new Soma(new Valor(42), new Mult(new Valor(10), new Valor(3)));
        // pois toda Soma e uma Expressao, é uma subclasse de Expressao
        
        // Mult exp2 = new Soma(new Valor(42), new Mult(new Valor(10), new Valor(3)));
        // ^ isso está errado pois Mult e Soma estão separados na hierarquia de classes.
        // não há uma relação de herança entre Soma e Mult
        // Mult exp2 = new Soma(new Valor(42), new Mult(new Valor(10), new Valor(3)));
        // ^ mesmo erro reportado acima, eles não tão tem relação de heranças
    
        // Expressao exp3 = new Soma(new Valor(42), new Mult(new Valor(10), new Valor(3)));
        // Soma sominha = exp;
        // Na cadeia de herença, toda Soma é uma expressão, mas nem toda expressão é uma soma.
        // Porém se você tem certeza que pode atribuir o valor, nesse caso sim, pois exp guarda um objeto soma, da pŕa verificar e 'forçar' com casting.
        if (exp instanceof Soma) {
            // para instaneof Não importa o tipo da variável, mas sim do objeto dentro de exp. 
            Soma sominha = (Soma)exp;
            System.out.println(sominha.avaliar());
        }
        System.out.println(exp);
        System.out.println(exp.avaliar());
        // a pesar de exp tá numa variável Expressão, ao chamar avaliar, Java chama o avaliar certo, que está na subclasse Soma.
        // pra isso, java usa ligação dinâmica e dispatch dinâmico.
        // java só determina o método que vai ser usado de fato, em tempo de execução.
        // OU SEJA, o método chamado não depende do tipo da variável, depende do OBJETO a qual ele é invocado.
        // caso ele não tenha o método avaliar vai buscar na superclasse e subindo.
        System.out.println(new Soma(new Valor(42), new Mult(new Valor(10), new Valor(3))).avaliar());
    }
}

class Expressao {
    public static final Valor RESPOSTA = new Valor(42);

    public String toString() {
        return "Expressao";
    }
    // para fazer o dispatch ser estático se usa a keyword final
    // então você sabe exatamente qual método vai ser executado em tempo de compilação
    // isso causa problema pois as classes filhas estão sobrescrevendo esse função da superclasse
    // apesar de sobrescrito, ele é importante está aqui, pois só é possível fazer
    // Expressao exp = new Soma(...); exp.avaliar(); por causa que Expressao tem o método avaliar
    // Existe uma implementação mais esperta pra isso, pois não queremos de fato ter uma implementação dele em Exp.
    // apenas dizer que ele tem, e as subcalsses implementam. em java se faz por meio de classes abstratas e interfaces
    // Ou seja final pra variaveis: variavel imutavel
    // Para funções : 1. garante que o método não seja sobrescrito, porém ele pode sobrescrever algum 2. garante que o dispatch seja estático
    
    // final public int avaliar() {
    public int avaliar() {
        return 0;
    }
}

// Valor é uma subclasse de Expressao
// Valor herda/estende expressao
// Expressão é uma superclasse de valor
// Se uma classe herda de outra, todos os elementos da super classe
// que são protegidos ou públicos são herdados pela subclasse, mesmo que a subclasse esteja em um pacote diferente
// se a subclasse estiver no mesmo pacote que a superclasse também herda os elementos que tem visibilidade package acess; 
class Valor extends Expressao {
    protected int valor = 0;
    
    Valor(int valor) {
        this.valor = valor;
    }

    // Overrides the methor from the superclass
    public int avaliar() {
        return this.valor;
    }

    public String toString() {
        return "" + this.valor;
    }
}

class ExpressaoBinaria extends Expressao {
    protected Expressao primeiro = new Valor(0);
    protected Expressao segundo = new Valor(0);

    ExpressaoBinaria(Expressao primeiro, Expressao segundo) {
        // Os construtores são polimórficos, nesse exemplo, podemos passar valores do tipo expressão (não muito útil, nesse caso),
        // podemos passar valor do tipo Valor, pois por herança, todo Valor é uma Expressão.
        // Posso passar outra ExpressaoBinaria (também não muito util, nesse caso).
        // Posso passar uma Soma pois por herança, ele também é uma Expressao.
        // Posso passar também uma multiplicação.
        // Polimorfismo de inclusão
        // ou seja pra Expressão, posso passar valor do tipo Expressao, ou valor de qualquer um dos seus subtipos
        // Em C++ para isso acontecer, o método deve ser Virtual, se não o bind e dispatch vão ser determinado em tempo de compilação.
        // Em java eles são sempre dinâmicos, a não ser que use o modificador final.
        this.primeiro = primeiro;
        this.segundo = segundo;
    }
}

// Soma é subclasse de ExpressãoBinaria (logo, também é de Expressão)
// tudo, c execção de construtores, que seja vísivel na subclasse é herdado da super classe
// Quando uma classe é subclasse da outra, ela também herda o TIPO.
// Se B é subclasse de A, então B é do tipo de A.
// Uma classe em java só pode ter UMA e SOMENTE UMA super classe
class Soma extends ExpressaoBinaria {
    Soma(Expressao primeiro, Expressao segundo) {
        // O construtor da subclasse PRECISA chamar o construtor da superclasse
        // se o construtor da superclasse não tiver parâmetro a chamada é feita automaticamente por java.
        // A primeira coisa que java faz ao começar executar um construtor de uma subclasse, é chamar o construtor da superclasse
        
        super(primeiro, segundo);
        // a chama ao construtor da superclasse DEVE ser a primeira instrução do construtor da subclasse.
        // se tiver um construtor da superclasse que não tenha nenhum parâmetro, você não precisa se preocupar em chamar.

    }

    public int avaliar() {
        return this.primeiro.avaliar() + this.segundo.avaliar();
        // pra ser explicito que to me referindo a superclasse
        // return super.primeiro.avaliar() + super.segundo.avaliar();
        // faz diferença se temos um metodo implementado na sub e na super, podemos escolher qual executar
    }
    
    public String toString() {
        return "(" + this.primeiro.toString() + " + " + this.segundo.toString() + ")";
    }
}

class Mult extends ExpressaoBinaria {
    Mult(Expressao primeiro, Expressao segundo) {
        super(primeiro, segundo);
    }

    public int avaliar() {
        return this.primeiro.avaliar() * this.segundo.avaliar();
    }

    public String toString() {
        return "(" + this.primeiro.toString() + " * " + this.segundo.toString() + ")";
    }
}

// A Subclass’s Constructor Must Call Its Superclass’s Constructor
// Each subclass constructor must implicitly or explicitly call one of its superclass’s construc-
// tors to initialize the instance variables inherited from the superclass
// Construtores da superclasse não são herdados , mas devem ser utilizados (via super)
// Herança simples: só se pode herdar
// uma classe por vez
// Atributos e métodos privados são herdados,
// mas não podem ser acessados diretamente


// If a program needs to perform
// a subclass-specific operation on a subclass object referenced by a superclass variable, the
// program must first cast the superclass reference to a subclass reference through a technique
// known as downcasting. This enables the program to invoke subclass methods that are not
// in the superclass.
// Although it’s allowed, you should generally avoid downcasting.

// When a superclass variable contains a reference to a subclass object, and
// that reference is used to call a method, the subclass version of the method is called.
// The Java compiler allows this “crossover” because an object
// of a subclass is an object of its superclass (but not vice versa).
// If that class contains the proper method decla-
// ration (or inherits one), the call is compiled. At execution time, the type of the object to
// which the variable refers determines the actual method to use. This process, called dynamic
// binding.

// Sometimes it’s useful to declare classes—called abstract classes—for which you never intend to
// create objects. Because they’re used only as superclasses in inheritance hierarchies, we refer
// to them as abstract superclasses
// An abstract class’s purpose is to provide an appropriate superclass from which other classes
// can inherit and thus share a common design.
// Classes that can be used to instantiate objects are called concrete
// classes. Such classes provide implementations of every method they declare (some of the
// implementations can be inherited)

// You make a class abstract by declaring it with keyword abstract . An abstract class nor-
// mally contains one or more abstract methods.
// Abstract methods do not provide implementations.

// A class that contains any abstract
// methods must be explicitly declared abstract even if that class contains some concrete
// (nonabstract) methods.
// Each concrete subclass of an abstract superclass also must provide
// concrete implementations of each of the superclass’s abstract methods.
// Constructors and
// static methods cannot be declared abstract .
// Constructors are not inherited, so an
// abstract constructor could never be implemented.
// Though non- private static
// methods are inherited, they cannot be overridden. Since abstract methods are meant to
// be overridden so that they can process objects based on their types, it would not make
// sense to declare a static method as abstract .
// You also can use abstract superclass names to invoke
// static methods declared in those abstract superclasses.

// Every object knows its own class and
// can access this information through the getClass method, which all classes inherit from
// class Object . Method getClass returns an object of type Class (from package ja-
// va.lang ), which contains information about the object’s type, including its class name.

// lthough the actual method that’s called depends on the runtime type of the object to
// which a variable refers, a variable can be used to invoke only those methods that are
// members of that variable’s type, which the compiler verifies.

// Final Methods Cannot Be Overridden
// Methods that are declared private are implicitly final , because it’s not possi-
// ble to override them in a subclass.

// Final Classes Cannot Be Superclasses
// A final class cannot extended to create a subclass. All methods in a final class are im-
// plicitly final

// We’ve now discussed declaring variables, methods and classes final , and we’ve
// emphasized that if something can be final it should be final

// Do not call overridable methods from constructors. When creating a subclass object, this
// could lead to an overridden method being called before the subclass object is fully initialized.

// Do not call overridable methods from constructors. When creating a subclass object, this
// could lead to an overridden method being called before the subclass object is fully initialized.
// Recall that when you construct a subclass object, its constructor first calls one of the
// direct superclass’s constructors. If the superclass constructor calls an overridable method, the
// subclass’s version of that method will be called by the superclass constructor—before the sub-
// class constructor’s body has a chance to execute. This could lead to subtle, difficult-to-
// detect errors if the subclass method that was called depends on initialization that has not
// yet been performed in the subclass constructor’s body.
// It’s acceptable to call a static method from a constructor. For example, a constructor
// and a set method often perform the same validation for a particular instance variable. If the
// validation code is brief, it’s acceptible to duplicate it in the constructor and the set method.
// If lengthier validation is required, define a static validation method (typically a private
// helper method) then call it from the constructor and the set method. It’s also acceptable
// for a constructor to call a final instance method, provided that the method does not
// directly or indirectly call an overridable instance method.