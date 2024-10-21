/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

// Definições
`define found 1
`define notfound 0

// FSM Moore
module moore_1101 (y, x, clk, reset);
    output reg y;  // Saída y
    input x;       // Entrada x
    input clk;     // Clock
    input reset;   // Reset
    parameter
        // Identificações
        start  = 3'b000,
        id1    = 3'b001,
        id11   = 3'b011,
        id110  = 3'b010,
        id1101 = 3'b110; 
    
    reg [2:0] E1; // Estado atual das variáveis
    reg [2:0] E2; // Próximo estado

    // Próximo estado lógico
    always @(x or E1) begin
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
                if (x)
                    E2 = id1101; // Transição
                else
                    E2 = start;
            end
            id1101: begin
                if (x)
                    E2 = id11; 
                else
                    E2 = start;
            end
            default: begin 
                E2 = 3'bxxx; 
            end
        endcase
    end 

    always @(posedge clk or negedge reset) begin
        if (!reset)
            E1 <= 3'b000; 
        else
            E1 <= E2; 
    end 

    
    always @(E1) begin
        y = E1[2]; 
    end 
endmodule // moore_1101
