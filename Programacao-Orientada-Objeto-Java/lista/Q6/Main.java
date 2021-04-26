package lista.Q6;

public class Main {

    public static Boolean isExprLogical(String expr) {
        Boolean ans = false;
        for (char ch : expr.toCharArray()) {
            if (ch == '<' || ch == '>' || ch == '=' || ch == '!') {
                ans = true;
                break;
            }
        }
        return ans;
    }
    public static void main(String[] args) {

        String expr = "2*3+4/6/6*4";

        Boolean exprLogical = isExprLogical(expr);

        if (exprLogical) {
            ExprLogica exprLogica = new ExprLogica(expr);

            System.out.println("ao chamar avaliar: "+ exprLogica.avaliar(expr));
            System.out.print("ao chamar imprimirArvore: ");
            exprLogica.imprimirArvore(expr);
        }
        else {
            ExprAritmetica exprAritmetica = new ExprAritmetica(expr);

            System.out.println("ao chamar avaliar: " + exprAritmetica.avaliar(expr));
            System.out.print("ao chamar imprimirArvore: ");
            exprAritmetica.imprimirArvore(expr);
        }
    }


}  
