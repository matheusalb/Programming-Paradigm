package lista.Q7_BONUS;

public class ExprTernario implements Expression{
    
    protected String exp;
    protected String expStr1;
    protected String expStr2;
    protected String expStr3;
    protected ExprLogica exp1;
    protected Expression exp2;
    protected Expression exp3;
    protected Boolean isExp2Logical;
    protected Boolean isExp3Logical;

    // exp1 ? exp2 : exp3
    
    public ExprTernario() {
        expStr1 = expStr2 = expStr3 = "";
        isExp2Logical = isExp3Logical = false;
    }
    public ExprTernario(String expr) {
        expStr1 = expStr2 = expStr3 = "";
        isExp2Logical = isExp3Logical = false;
        this.exp = expr;
    }

    private void divideExprTernaria(String expr) {
        String[] exps = exp.split("((?<=[-+*/><=!?:])|(?=[-+*/><=!?:]))");
        
        String expStr1 = "";
        String expStr2 = "";
        String expStr3 = "";
        Boolean isExp2Logical = false;
        Boolean isExp3Logical = false;

        int state = 3;
        for (int i = exps.length - 1; i >= 0; i--) {
            if (state == 3) {
                if (exps[i].equals(":")) {
                    state--;
                    continue;
                }
                else if (exps[i].equals("<")|| exps[i].equals(">") 
                        || exps[i].equals("=") || exps[i].equals("!")) isExp3Logical = true;
                 
                expStr3 = exps[i] + expStr3;
            }
            else if (state == 2) {
                if (exps[i].equals("?")) {
                    state--;
                    continue;
                }
                else if (exps[i].equals("<")|| exps[i].equals(">") 
                        || exps[i].equals("=") || exps[i].equals("!")) isExp2Logical = true;
                 
                expStr2 = exps[i] + expStr2;
            }
            else if (state == 1) {
                expStr1 = exps[i] + expStr1;
            }
        }

        this.expStr1 = expStr1;
        this.expStr2 = expStr2;
        this.expStr3 = expStr3;

        this.isExp2Logical = isExp2Logical;
        this.isExp3Logical = isExp3Logical;

        this.exp1 = new ExprLogica();
        if (isExp3Logical) this.exp3 = new ExprLogica();
        else this.exp3 = new ExprAritmetica();
        if (isExp2Logical) this.exp2 = new ExprLogica();
        else this.exp2 = new ExprAritmetica();

    }

    @Override
    public String avaliar(String expr) {
        this.exp = expr;

        this.divideExprTernaria(expr);

        String res1 = this.exp1.avaliar(this.expStr1);
        String res2 = this.exp2.avaliar(this.expStr2);
        String res3 = this.exp3.avaliar(this.expStr3);
        // res1 ? res2 : res3

        String ans = "";

        if (res1.equals("True")) {
            ans = res2;
        }
        else ans = res3;
        
        return ans;
    }

    @Override
    public void imprimirArvore(String expr) {
        this.exp = expr;
        this.divideExprTernaria(expr);

        String formatado1 = this.exp1.formataExpressao(this.expStr1);
        String formatado2 = "";
        String formatado3 = "";

        if (this.isExp2Logical) formatado2 = ((ExprLogica)this.exp2).formataExpressao(this.expStr2);
        else formatado2 = ((ExprAritmetica)this.exp2).formataExpressao(this.expStr2);

        if (this.isExp3Logical) formatado3 = ((ExprLogica)this.exp3).formataExpressao(this.expStr3);
        else formatado3 = ((ExprAritmetica)this.exp3).formataExpressao(this.expStr3);

        String ans = formatado1 + "?" + formatado2 + ":" + formatado3;
        System.out.println(ans);
    }

    @Override
    public String toString() {
        System.out.println(this.exp);
        return this.exp;
    }
}
