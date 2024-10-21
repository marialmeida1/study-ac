/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/


`include "Mealy_1101.v"
`include "Moore_1101.v"

module Guia_1101;
    reg clk, reset, x;     // Definindo os sinais de entrada
    wire m1, m2;          // Saídas das FSMs

    // Instanciando as FSMs
    mealy_1101 mealy1 (m1, x, clk, reset);
    moore_1101 moore1 (m2, x, clk, reset);

    initial begin
        $display("Time   X   Mealy   Moore");
        
        // Valores iniciais
        clk = 1;
        reset = 0;
        x = 0;

        // Mudando o sinal de entrada
        #5 reset = 1;   // Ativar o reset
        #10 x = 1;      // Mudar a entrada x
        #10 x = 0;
        #10 x = 1;
        #20 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #30 $finish;    // Finalizar a simulação
    end // initial

    // Geração de clock
    always #5 clk = ~clk;

    // Monitoramento das saídas nas bordas de subida do clock
    always @(posedge clk) begin
        $display("%4d  %4b  %4b  %5b", $time, x, m1, m2);
    end // always at positive edge clocking
endmodule // Guia_1101
