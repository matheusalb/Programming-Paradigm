package lista.Q6;

public class ExprAritmetica implements Expression {
    protected String exp;
    protected String l;
    protected String r;
    protected String op;

    public ExprAritmetica() {
        this.exp = this.l = this.r = this.op = "";
    }
    public ExprAritmetica(String expr) {
       this.exp = expr;
       this.l = this.r = this.op = "";
    }

    private Boolean divideExprSomaSub(String expr) {
        String[] exps = exp.split("((?<=[-+*/><=!])|(?=[-+*/><=!]))");
        
        String left = "";
        String right = "";
        String op = "";
        int last_index = 0;
        Boolean find = false;

        for (int i = exps.length - 1; i >= 0; i--) {
            if (exps[i].equals("+") || exps[i].equals("-")) {
                // cond parada
                last_index = i;
                find = true;
                op = exps[i];
                break;
            }
            else {
                right = exps[i] + right; 
            }
        }

        for (int i = last_index - 1; i >= 0; i--) {
            left = exps[i] + left;
        }

        if (find) {
            this.r = right;
            this.l = left;
            this.op = op;
        }
        
        return find;
    }

    private Boolean divideExprDivMult(String expr) {
        String[] exps = exp.split("((?<=[-+*/><=!])|(?=[-+*/><=!]))");
        
        String left = "";
        String right = "";
        int last_index = 0;
        String op = "";
        Boolean find = false;

        for (int i = exps.length - 1; i >= 0; i--) {
            if (exps[i].equals("*") || exps[i].equals("/")) {
                // cond parada
                last_index = i;
                find = true;
                op = exps[i];
                break;
            }
            else {
                right = exps[i] + right; 
            }
        }

        for (int i = last_index - 1; i >= 0; i--) {
            left = exps[i] + left;
        }

        if (find) {
            this.r = right;
            this.l = left;
            this.op = op;
        }
        
        return find;
    }

    protected String formataExpressao(String expr) {
        this.exp = expr;
        String curExpr = expr;
        String ans = "";
        if (this.divideExprSomaSub(expr) || this.divideExprDivMult(expr)) {
            String curL = this.l;
            String curR = this.r;
            String curOp = this.op;
            String resR = this.formataExpressao(curR);
            String resL = this.formataExpressao(curL);

            // Retorna ao estado antes das recursões
            this.exp = curExpr;
            this.l = curL;
            this.r = curR;
            this.op = curOp;
            
            ans = "("+ resL + this.op+ resR +")"; 
        }
        else {
            if (expr.equals("")){
                System.out.println("Expressão vazia!");
            }
            else {
                ans = "("+expr+")";
            }
        }
        return ans;
    }   

    @Override
    public String avaliar(String expr) {
        
        this.exp = expr;
        String curExpr = expr;
        String ans = "";
        if (this.divideExprSomaSub(expr) || this.divideExprDivMult(expr)) {
            String curL = this.l;
            String curR = this.r;
            String curOp = this.op;
            String resR = this.avaliar(curR);
            String resL = this.avaliar(curL);

            // Retorna ao estado antes das recursões
            this.exp = curExpr;
            this.l = curL;
            this.r = curR;
            this.op = curOp;
            
            double a = Double.parseDouble(resL);
            double b = Double.parseDouble(resR);

            if (this.op.equals("+")) {
                ans = (a + b) + ""; 
            }
            else if (this.op.equals("-")) {
                ans = (a - b) + "";
            }
            else if (this.op.equals("*")) {
                ans = (a * b) + "";
            }
            else if (this.op.equals("/")) {
                ans = (a / b) + "";
            }
        }
        else {
            if (expr.equals("")){
                System.out.println("Expressão vazia!");
            }
            else {
                ans = expr;
            }
        }

        return ans;
    }

    @Override
    public void imprimirArvore(String expr) {       
        System.out.println(this.formataExpressao(expr));
    }

    @Override
    public String toString() {
        System.out.println(this.exp);
        return this.exp;
    }
}
