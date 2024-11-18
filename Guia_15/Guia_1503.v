/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module bcd_arithmetic (
    input [7:0] dado01, // Primeiro dado em BCD
    input [7:0] dado02, // Segundo dado em BCD
    input [7:0] dado03, // Terceiro dado em BCD
    input [7:0] dado04, // Quarto dado em BCD
    output [7:0] dado05 // Resultado em BCD
);

    wire [7:0] temp1, temp2, temp3; // Valores intermediários
    wire [7:0] adj_temp1, adj_temp2, adj_temp3, adj_temp4; // Valores ajustados para BCD

    // Subtração e soma direta
    assign temp1 = dado01 - dado02; // Subtração 1
    assign temp2 = temp1 + dado03;  // Soma
    assign temp3 = temp2 - dado04;  // Subtração 2

    // Ajuste para BCD (Decimal Adjust)
    assign adj_temp1 = (temp1[3:0] > 4'd9) ? temp1 + 8'h06 : temp1;
    assign adj_temp2 = (temp2[3:0] > 4'd9) ? temp2 + 8'h06 : temp2;
    assign adj_temp3 = (temp3[3:0] > 4'd9) ? temp3 + 8'h06 : temp3;

    // Resultado ajustado final
    assign dado05 = (adj_temp3[7:4] > 4'd9) ? adj_temp3 + 8'h60 : adj_temp3;

endmodule

module testbench;
    reg [7:0] dado01, dado02, dado03, dado04;
    wire [7:0] dado05;

    bcd_arithmetic uut (
        .dado01(dado01),
        .dado02(dado02),
        .dado03(dado03),
        .dado04(dado04),
        .dado05(dado05)
    );

    initial begin
        // Teste 1
        dado01 = 8'h12; // 12 em BCD
        dado02 = 8'h09; // 9 em BCD
        dado03 = 8'h07; // 7 em BCD
        dado04 = 8'h03; // 3 em BCD
        #10;
        $display("Dado05 (BCD): %h", dado05);

        // Teste 2
        dado01 = 8'h99; // 99 em BCD
        dado02 = 8'h45; // 45 em BCD
        dado03 = 8'h12; // 12 em BCD
        dado04 = 8'h10; // 10 em BCD
        #10;
        $display("Dado05 (BCD): %h", dado05);

        $stop; // Finaliza a simulação
    end
endmodule
