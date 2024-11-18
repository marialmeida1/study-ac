/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module arithmetic_expression (
    input signed [7:0] dado01, // Primeiro dado (8 bits com sinal)
    input signed [7:0] dado02, // Segundo dado (8 bits com sinal)
    output signed [7:0] dado03 // Resultado (8 bits com sinal)
);

    wire signed [7:0] mult_result; // Armazenar dado01 * 8
    wire signed [7:0] div_result;  // Armazenar dado02 / 2
    wire signed [7:0] result;      // Resultado final

    // Multiplicação por 8 usando deslocamento à esquerda
    assign mult_result = dado01 <<< 3; // dado01 * 8

    // Divisão por 2 usando deslocamento à direita
    assign div_result = dado02 >>> 1; // dado02 / 2

    // Soma dos resultados
    assign result = mult_result + div_result;

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
        dado02 = 8'd10; // 10
        #10;
        $display("Resultado (dado03): %d", dado03); // Esperado: 45

        // Teste 2
        dado01 = 8'd-2; // -2
        dado02 = 8'd8;  // 8
        #10;
        $display("Resultado (dado03): %d", dado03); // Esperado: -14

        // Teste 3
        dado01 = 8'd7;  // 7
        dado02 = 8'd4;  // 4
        #10;
        $display("Resultado (dado03): %d", dado03); // Esperado: 60

        $stop;
    end
endmodule


