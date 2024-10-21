/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

// Definições
`define found 1
`define notfound 0

// FSM Mealy
module mealy_1101 (y, x, clk, reset);
    output reg y;
    input x;
    input clk;
    input reset;

    // Identificadores
    parameter start = 2'b00,
              id1   = 2'b01,
              id11  = 2'b11,
              id110 = 2'b10;

    reg [1:0] E1; // Estado atual da variável
    reg [1:0] E2; // Próximo estado

    // Próximo estado lógico
    always @(x or E1) begin
        y = `notfound; // Saída padrão
        case (E1)
            start: begin
                if (x)
                    E2 = id1;
                else
                    E2 = start;
            end
            id1: begin
                if (x)
                    E2 = id11;
                else
                    E2 = start;
            end
            id11: begin
                if (x)
                    E2 = id11;
                else
                    E2 = id110;
            end
            id110: begin
                if (x) begin
                    E2 = id1;
                    y = `found;
                end else begin
                    E2 = start;
                    y = `notfound;
                end
            end
            default: begin // Estado indefinido
                E2 = 2'bxx;
            end
        endcase
    end 

    // Estado das variáveis
    always @(posedge clk or negedge reset) begin
        if (!reset) 
            E1 <= 2'b00; // Reseta
        else
            E1 <= E2; // Atualiza o estado atual
    end 
endmodule // mealy_1101
