public class Carro implements Veiculo {
    private int curVel;

    public int setVelocidade(int velocidade) {
        this.curVel = velocidade;
        return this.curVel;
    }
    public int setVelocidade(int velocidade, int veva) {
        this.curVel = velocidade;
        return this.curVel;
    }
    
    public static void main(String[] args) {
        Carro mobi = new Carro();
        Veiculo curVel = mobi;

        System.out.println(curVel.setVelocidade(50));
    }
}