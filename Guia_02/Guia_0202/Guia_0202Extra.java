class Guia_0202Extra {

    public String bin2double(double dec){

        int partInt = (int) dec; // pega a parte inteira do número
        double partDec = dec - partInt; // pega a parte decimal do número
        StringBuilder binario = new StringBuilder(); // binário final

        if(partInt == 0){
            binario.append('0');
        }

        // Calcula a parte inteira
        while(partInt > 0){
            int binNumber = partInt % 2;

            String binString = String.valueOf(binNumber);
            binario.insert(0, binString);

            partInt = partInt / 2;
        }

        // Divisor
        binario.append('.');

        // Calcula a parte decimal
        String binStringDec = String.valueOf(partDec);
        int aux = 7;

        while (partDec > 0 && aux > 0) {
            if ( partDec * 2 >= 1 ){
                binario.append('1');
                partDec = partDec * 2.0 - 1.0;
            }
            else {
                binario.append('0');
                partDec = partDec * 2.0;
            }
            aux = aux - 1;
        }


        String result = binario.toString();
        return result;
    }

    public static void main(String[] args) {
        Guia_0202Extra functions = new Guia_0202Extra();
        functions.bin2double(0.375);

        double[] decimais = {0.375, 2.125, 3.625, 5.03125, 6.750000};
        String[] binarios = new String[5];

        for (int i = 0; i < binarios.length; i++) {
            binarios[i] = functions.bin2double(decimais[i]);
        }

        for (int i = 0; i < binarios.length; i++) {
            System.out.println(binarios[i]);
        }
    }
}