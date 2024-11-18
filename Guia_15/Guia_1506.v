/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module arithmetic_expression (
    input signed [7:0] dado01, // Primeiro dado (8 bits com sinal)
    input signed [7:0] dado02, // Segundo dado (8 bits com sinal)
    output signed [7:0] dado03 // Resultado (8 bits com sinal)
);

    wire signed [7:0] mult_dado01; // 3 * dado01
    wire signed [7:0] mult_dado02; // 2 * dado02
    wire signed [7:0] result;      // Resultado final

    // Multiplicação por 3 para dado01
    assign mult_dado01 = (dado01 <<< 1) + dado01; // (dado01 * 2) + dado01

    // Multiplicação por 2 para dado02
    assign mult_dado02 = dado02 <<< 1; // dado02 * 2

    // Subtração para calcular dado03
    assign result = mult_dado01 - mult_dado02;

    // Atribuir resultado final
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
        dado01 = 8'd5;  // 5
        dado02 = 8'd3;  // 3
        #10;
        $display("Resultado (dado03): %d", dado03); // Esperado: 9

        // Teste 2
        dado01 = 8'd-4; // -4
        dado02 = 8'd2;  // 2
        #10;
        $display("Resultado (dado03): %d", dado03); // Esperado: -14

        // Teste 3
        dado01 = 8'd7;  // 7
        dado02 = 8'd1;  // 1
        #10;
        $display("Resultado (dado03): %d", dado03); // Esperado: 19

        $stop;
    end
endmodule
