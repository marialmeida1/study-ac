/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module arithmetic_operation (
    input signed [15:0] dado01, // Primeiro dado (16 bits com sinal)
    input signed [15:0] dado02, // Segundo dado (16 bits com sinal)
    input signed [15:0] dado03, // Terceiro dado (16 bits com sinal)
    input signed [15:0] dado04, // Quarto dado (16 bits com sinal)
    output signed [15:0] dado05 // Resultado (16 bits com sinal)
);
    assign dado05 = dado01 + dado02 + dado03 - dado04; // Realiza a operação aritmética
endmodule

module testbench;
    reg signed [15:0] dado01, dado02, dado03, dado04;
    wire signed [15:0] dado05;

    arithmetic_operation uut (
        .dado01(dado01),
        .dado02(dado02),
        .dado03(dado03),
        .dado04(dado04),
        .dado05(dado05)
    );

    initial begin
        // Teste 1
        dado01 = 16'sh0002; // 2 em hexadecimal
        dado02 = 16'sh0003; // 3 em hexadecimal
        dado03 = 16'sh0004; // 4 em hexadecimal
        dado04 = 16'sh0001; // 1 em hexadecimal
        #10; // Espera 10 unidades de tempo
        $display("Resultado: %d", dado05); // Mostra o resultado como decimal

        // Teste 2 (com números negativos)
        dado01 = 16'shFFFE; // -2 em hexadecimal (complemento de 2)
        dado02 = 16'sh0003; // 3 em hexadecimal
        dado03 = 16'shFFFC; // -4 em hexadecimal (complemento de 2)
        dado04 = 16'sh0001; // 1 em hexadecimal
        #10;
        $display("Resultado: %d", dado05);

        $stop; // Finaliza a simulação
    end
endmodule
