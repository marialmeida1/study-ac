/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

`timescale 1ns / 1ps

module RAM_2x8_tb;

    reg CLK_;
    reg R_W_;
    reg ADDR_;
    reg [7:0] DATA_IN;
    wire [7:0] DATA_OUT;

    RAM_2x8 ram_inst (
        .CLK_(CLK_),
        .R_W_(R_W_),
        .ADDR_(ADDR_),
        .DATA_IN(DATA_IN),
        .DATA_OUT(DATA_OUT)
    );

    // Geração do clock
    initial begin
        CLK_ = 0;
        forever #5 CLK_ = ~CLK_; // Clock com período de 10ns
    end

    // Teste de escrita e leitura
    initial begin
        // Inicializa os sinais
        R_W_ = 0;
        ADDR_ = 0; // Seleciona a RAM0
        DATA_IN = 8'b00000000; // Valor inicial

        // Aguarda a limpeza
        #10;

        // Teste de escrita na RAM0
        R_W_ = 1; // Ativa escrita
        DATA_IN = 8'b10101010; // Valor a ser escrito
        #10; // Espera a borda de subida do clock
        R_W_ = 0; // Ativa leitura
        #10; // Espera a borda de descida do clock

        // Verifica a saída
        if (DATA_OUT !== 8'b10101010) begin
            $display("Erro: Esperado 10101010, obtido %b", DATA_OUT);
        end else begin
            $display("Teste de escrita RAM0 bem-sucedido: %b", DATA_OUT);
        end

        // Teste de escrita na RAM1
        ADDR_ = 1; // Seleciona a RAM1
        R_W_ = 1; // Ativa escrita
        DATA_IN = 8'b11001100; // Novo valor a ser escrito
        #10; // Espera a borda de subida do clock
        R_W_ = 0; // Ativa leitura
        #10; // Espera a borda de descida do clock

        // Verifica a saída
        if (DATA_OUT !== 8'b00000000) begin
            $display("Erro: Esperado 00000000, obtido %b", DATA_OUT);
        end else begin
            $display("Teste de leitura RAM1 bem-sucedido: %b", DATA_OUT);
        end

        // Finaliza a simulação
        $finish;
    end

endmodule
