/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module double_expression (
    input [7:0] dado01, // Primeiro dado
    input [7:0] dado02, // Segundo dado
    output [7:0] dado03 // Resultado
);

    wire [7:0] double_dado02; // Armazenar 2 * dado02
    wire [7:0] temp_sub;      // Armazenar dado01 - 2 * dado02
    wire [7:0] double_result; // Armazenar 2 * (dado01 - 2 * dado02)

    // Dobro de dado02
    assign double_dado02 = dado02 + dado02;

    // Subtração: dado01 - 2 * dado02
    assign temp_sub = dado01 - double_dado02;

    // Dobro do resultado
    assign double_result = temp_sub + temp_sub;

    // Atribuir resultado final
    assign dado03 = double_result;

endmodule

module testbench;
    reg [7:0] dado01, dado02; // Entradas
    wire [7:0] dado03;        // Saída

    double_expression uut (
        .dado01(dado01),
        .dado02(dado02),
        .dado03(dado03)
    );

    initial begin
        // Teste 1
        dado01 = 8'd20; // 20
        dado02 = 8'd5;  // 5
        #10;
        $display("Dado03: %d", dado03); // Esperado: 20

        // Teste 2
        dado01 = 8'd50; // 50
        dado02 = 8'd10; // 10
        #10;
        $display("Dado03: %d", dado03); // Esperado: 60

        // Teste 3
        dado01 = 8'd30; // 30
        dado02 = 8'd15; // 15
        #10;
        $display("Dado03: %d", dado03); // Esperado: 0

        $stop;
    end
endmodule
