/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

`timescale 1ns / 1ps

module RAM_1x4_tb;

    reg CLK_;
    reg R_W_;
    reg CLR;
    reg [3:0] RAM_input;
    wire [3:0] RAM_output;

    RAM_1x4 ram_inst (
        .CLK_(CLK_),
        .R_W_(R_W_),
        .CLR(CLR),
        .RAM_input(RAM_input),
        .RAM_output(RAM_output)
    );

    // Geração do clock
    initial begin
        CLK_ = 0;
        forever #5 CLK_ = ~CLK_; // Clock com período de 10ns
    end

    // Teste de escrita e leitura
    initial begin
        R_W_ = 0;
        CLR = 1; // Limpa a memória
        RAM_input = 4'b0000;

        #10 CLR = 0;
        #10;

        R_W_ = 1; // Ativa escrita
        RAM_input = 4'b1010; // Valor a ser escrito
        #10; // Espera a borda de subida do clock
        R_W_ = 0; // Ativa leitura
        #10; // Espera a borda de descida do clock

        if (RAM_output !== 4'b1010) begin
            $display("Erro: Esperado 1010, obtido %b", RAM_output);
        end else begin
            $display("Teste de escrita bem-sucedido: %b", RAM_output);
        end

        R_W_ = 1; // Ativa escrita
        RAM_input = 4'b1100; // Novo valor a ser escrito
        #10; // Espera a borda de subida do clock
        R_W_ = 0; // Ativa leitura
        #10; // Espera a borda de descida do clock

        if (RAM_output !== 4'b1100) begin
            $display("Erro: Esperado 1100, obtido %b", RAM_output);
        end else begin
            $display("Teste de escrita bem-sucedido: %b", RAM_output);
        end

        $finish;
    end

endmodule
