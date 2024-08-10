class Guia_0201Extra {

    public double bin2double(String bin){

        double result = 0.0;
        int pointIndex = bin.indexOf(','); // encontra aonde está o ponto

        // Para a parte inteira -> se for >= 0 cria uma substring se não não o número é inteiro
        String intPart = (pointIndex >= 0) ? bin.substring(0, pointIndex) : bin;

        for (int i = 0; i < intPart.length(); i++) {
            // se a letra na posição i for igual a 1
            if (intPart.charAt(i) == '1'){
                result += Math.pow(2, intPart.length() - 1 - i);
            }
        }

        // se não é menor que 0 então é binário decimal entra no calculo da parte fracionada
        if(pointIndex >= 0){
            // Cria uma substring para a parte fracionada
            String fracPart = bin.substring(pointIndex + 1);

            for (int i = 0; i < fracPart.length(); i++) {
                if(fracPart.charAt(i) == '1'){
                    result += Math.pow(2, -(i + 1));
                }
            }
        }

        return result;
    }

    public static void main(String[] args) {
        Guia_0201Extra functions = new Guia_0201Extra();

        String[] binarios = {"0,00011", "0,01001", "0,10101", "1,11101", "11,11001"};
        double[] decimais = new double[5];

        for (int i = 0; i < decimais.length; i++) {
            decimais[i] = functions.bin2double(binarios[i]);
        }

        for (int i = 0; i < decimais.length; i++) {
            System.out.println(decimais[i]);
        }

        /*
         0.09375
         0.28125
         0.65625
         1.90625
         3.78125
         */

    }
}