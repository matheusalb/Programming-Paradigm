package lista.Q7_BONUS;

public class ExprLogica implements Expression {
    protected String exp;
    protected String l;
    protected String r;
    protected ExprAritmetica expL;
    protected ExprAritmetica expR;
    protected String op;

    public ExprLogica() {
        this.exp = this.l = this.r = this.op = "";
    }
    public ExprLogica(String expr) {
        this.exp = expr;
        this.l = this.r = this.op = "";
    }

    private Boolean divideExprOperadorLogico(String expr) {
        String[] exps = exp.split("((?<=[-+*/><=!])|(?=[-+*/><=!]))");
        
        String left = "";
        String right = "";
        int last_index = 0;
        String op = "";
        Boolean find = false;
        Boolean findEqual = false;

        for (int i = exps.length - 1; i >= 0; i--) {
            if (exps[i].equals(">") || exps[i].equals("<") 
                || exps[i].equals("!")) {

                // cond parada
                last_index = i;
                find = true;
                op = exps[i] + op;
                break;
            }
            else if (exps[i].equals("=")) {
                if (findEqual) {
                    // cond parada
                    last_index = i;
                    find = true;
                    op = exps[i] + op;
                    break;
                }
                else {
                    op = exps[i] + op;
                    findEqual = true;
                }
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
            this.expL = new ExprAritmetica(left);
            this.expR = new ExprAritmetica(right);
        }
        
        return find;
    }
    
    protected String formataExpressao(String expr) {
        this.exp = expr;
        String ans = "";
        if (this.divideExprOperadorLogico(expr)) {
            
            String resL = this.expL.formataExpressao(this.l);
            String resR = this.expR.formataExpressao(this.r);

            ans = "("+ resL + this.op+ resR +")"; 
        }
        else {
            if (expr.equals("")){
                System.out.println("Expressão vazia!");
            }
            else {
                System.out.println("Expressão não possui um operador lógico válido!");
            }
        }
        return ans;
    }

    @Override
    public String avaliar(String expr) {
        this.exp = expr;
        String curExpr = expr;
        String ans = "";

        if (divideExprOperadorLogico(expr)) {
            String curL = this.l;
            String curR = this.r;
            String curOp = this.op;
            String resR = this.expR.avaliar(curR);
            String resL = this.expL.avaliar(curL);

            // Retorna ao estado antes das recursões
            this.exp = curExpr;
            this.l = curL;
            this.r = curR;
            this.op = curOp;

            double a = Double.parseDouble(resL);
            double b = Double.parseDouble(resR);

            if (this.op.equals(">")) {
                if (a > b) 
                    ans = "True";
                else
                    ans = "False";
            }
            else if (this.op.equals("<")){
                if (a < b) 
                    ans = "True";
                else
                    ans = "False";
            }
            else if (this.op.equals(">=")){
                if (a >= b) 
                    ans = "True";
                else
                    ans = "False";
            }
            else if (this.op.equals("<=")){
                if (a <= b) 
                    ans = "True";
                else
                    ans = "False";
            }
            else if (this.op.equals("!=")){
                if (a != b) 
                    ans = "True";
                else
                    ans = "False";
            }
            else if (this.op.equals("==")){
                if (a == b) 
                    ans = "True";
                else
                    ans = "False";
            }
            else {
                System.out.println("Operador lógico inválido!");
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
        System.out.println(this.exp);;
        return this.exp;
    }

}
