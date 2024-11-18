/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module arithmetic_expression (
    input signed [7:0] dado01, // Primeiro dado (8 bits com sinal)
    input signed [7:0] dado02, // Segundo dado (8 bits com sinal)
    output signed [7:0] dado03 // Resultado (8 bits com sinal)
);

    wire dado01_mod_2;     // dado01 % 2
    wire signed [7:0] dado02_div_4; // dado02 / 4
    wire signed [7:0] result; // Resultado final

    // Operação dado01 % 2 (verifica se é ímpar ou par)
    assign dado01_mod_2 = dado01[0]; // O bit menos significativo de dado01 nos diz o resto da divisão por 2

    // Divisão por 4 de dado02 (equivalente a deslocar dois bits para a direita)
    assign dado02_div_4 = dado02 >>> 2; // Desloca 2 bits para a direita (divisão por 4)

    // Soma das operações: dado03 = dado01 % 2 + dado02 / 4
    assign result = dado01_mod_2 + dado02_div_4;

    // Atribui o resultado final a dado03
    assign dado03 = result;

endmodule

module testbench;
    reg signed [7:0] dado01, dado02; // Entradas
    wire signed [7:0] dado03;        // Saída

    arithmetic_expression uut (
        .dado01(dado01),
        .dado02(dado02),
        .dado03(dado03)
    );

    initial begin
        // Teste 1
        dado01 = 8'd5;  // 5 (dado01 % 2 = 1)
        dado02 = 8'd8;  // 8 (dado02 / 4 = 2)
        #10;
        $display("Resultado (dado03): %d", dado03); // Esperado: 1 + 2 = 3

        // Teste 2
        dado01 = 8'd6;  // 6 (dado01 % 2 = 0)
        dado02 = 8'd16; // 16 (dado02 / 4 = 4)
        #10;
        $display("Resultado (dado03): %d", dado03); // Esperado: 0 + 4 = 4

        // Teste 3
        dado01 = 8'd7;  // 7 (dado01 % 2 = 1)
        dado02 = 8'd4;  // 4 (dado02 / 4 = 1)
        #10;
        $display("Resultado (dado03): %d", dado03); // Esperado: 1 + 1 = 2

        // Teste 4
        dado01 = 8'd0;  // 0 (dado01 % 2 = 0)
        dado02 = 8'd12; // 12 (dado02 / 4 = 3)
        #10;
        $display("Resultado (dado03): %d", dado03); // Esperado: 0 + 3 = 3

        $stop;
    end
endmodule
