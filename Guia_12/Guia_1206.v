`timescale 1ns / 1ps

module RAM_4x16_tb;

    reg CLK_;
    reg R_W_;
    reg [1:0] ADDR_;
    reg [15:0] DATA_IN;
    wire [15:0] DATA_OUT;

    RAM_4x16 ram_inst (
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
        R_W_ = 0; // Inicializa em modo de leitura
        ADDR_ = 0; // Seleciona o endereço 0
        DATA_IN = 16'b0000000000000000; // Valor inicial

        // Aguarda a limpeza
        #10;

        // Teste de escrita no endereço 0
        R_W_ = 1; // Ativa escrita
        DATA_IN = 16'b1010101011111111; // Valor a ser escrito
        ADDR_ = 0; // Endereço 0
        #10; // Espera a borda de subida do clock

        // Teste de leitura do endereço 0
        R_W_ = 0; // Ativa leitura
        #10; // Espera a borda de descida do clock

        // Verifica a saída
        if (DATA_OUT !== 16'b1010101011111111) begin
            $display("Erro: Esperado 1010101011111111, obtido %b", DATA_OUT);
        end else begin
            $display("Teste de escrita e leitura bem-sucedido no endereço 0: %b", DATA_OUT);
        end

        // Teste de escrita no endereço 2
        R_W_ = 1; // Ativa escrita
        DATA_IN = 16'b1100110011001100; // Novo valor a ser escrito
        ADDR_ = 2; // Endereço 2
        #10; // Espera a borda de subida do clock

        // Teste de leitura do endereço 2
        R_W_ = 0; // Ativa leitura
        #10; // Espera a borda de descida do clock

        // Verifica a saída
        if (DATA_OUT !== 16'b1100110011001100) begin
            $display("Erro: Esperado 1100110011001100, obtido %b", DATA_OUT);
        end else begin
            $display("Teste de escrita e leitura bem-sucedido no endereço 2: %b", DATA_OUT);
        end

        // Finaliza a simulação
        $finish;
    end

endmodule
