package lista.Q7_BONUS;

enum TipoExpr {
    Aritmetica, Logica, Ternaria;
}

public class Main {

    public static TipoExpr tipoExpressao(String expr) {
        TipoExpr ans = TipoExpr.Aritmetica;

        Boolean isTernaria = false, isLogica = false;
        for (char ch : expr.toCharArray()) {
            if (ch == '<' || ch == '>' || ch == '=' || ch == '!') 
                isLogica = true;
            else if (ch == '?' || ch == ':')
                isTernaria = true;
        }

        if (isTernaria) ans = TipoExpr.Ternaria;
        else if (isLogica) ans = TipoExpr.Logica;

        return ans;
    }
    public static void main(String[] args) {

        String expr = "2*3+4/6!=3/4?3<5+6:26*7*6/4+3";
        
        TipoExpr tipoExpr = tipoExpressao(expr);

        if (tipoExpr == TipoExpr.Ternaria) {
            ExprTernario exprTernaria = new ExprTernario(expr);

            System.out.println("ao chamar avaliar: "+ exprTernaria.avaliar(expr));
            System.out.print("ao chamar imprimirArvore: ");
            exprTernaria.imprimirArvore(expr);
        }
        else if (tipoExpr == TipoExpr.Logica) {
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
