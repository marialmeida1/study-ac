/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module arith_expression (
    input [7:0] dado01, // Primeiro dado de 8 bits
    input [7:0] dado02, // Segundo dado de 8 bits
    input [7:0] dado03, // Terceiro dado de 8 bits
    output reg [7:0] dado04 // Resultado
);
    // Lógica combinacional para o cálculo
    always @(*) begin
        dado04 = dado01 + dado02 - dado03;
    end
endmodule

module tb_arith_expression;

    reg [7:0] dado01; // Primeiro dado
    reg [7:0] dado02; // Segundo dado
    reg [7:0] dado03; // Terceiro dado
    wire [7:0] dado04; // Resultado

    // Instanciação do módulo
    arith_expression uut (
        .dado01(dado01),
        .dado02(dado02),
        .dado03(dado03),
        .dado04(dado04)
    );

    initial begin
        // Inicialização
        dado01 = 8'h02; // 02h
        dado02 = 8'h03; // 03h
        dado03 = 8'h01; // 01h

        #10; // Esperar 10 unidades de tempo

        // Exibir o resultado
        $display("dado01: %h, dado02: %h, dado03: %h, dado04: %h", dado01, dado02, dado03, dado04);

        // Testar outros valores
        dado01 = 8'h10;
        dado02 = 8'h20;
        dado03 = 8'h05;

        #10; // Esperar 10 unidades de tempo
        $display("dado01: %h, dado02: %h, dado03: %h, dado04: %h", dado01, dado02, dado03, dado04);

        $stop; // Finalizar simulação
    end
endmodule
