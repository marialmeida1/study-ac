/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module Guia_1104 (
    output reg found,  // Saída que indica que a sequência foi encontrada
    input x,          // Sinal de entrada
    input clk,        // Sinal de clock
    input reset       // Sinal de reset
);
    // Definindo estados
    parameter
        start = 3'b000, // Estado inicial
        id1 = 3'b001,   // Reconhecido 1
        id2 = 3'b010,   // Reconhecido 10
        id3 = 3'b011,   // Reconhecido 100
        id4 = 3'b100,   // Reconhecido 1000
        id000 = 3'b101; // Sequência 000 encontrada
    
    reg [2:0] current_state; // Estado atual

    // Lógica de transição de estados
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= start; // Reinicia para o estado inicial
            found <= 0; // Saída inicial
        end else begin
            case (current_state)
                start: begin
                    found <= 0; // Sequência não encontrada
                    if (x) 
                        current_state <= id1; // Se a entrada é 1, vai para id1
                    else 
                        current_state <= start; // Se a entrada é 0, permanece em start
                end
                
                id1: begin
                    found <= 0; // Sequência não encontrada
                    if (x) 
                        current_state <= id1; // Permanece em id1
                    else 
                        current_state <= id2; // Se a entrada é 0, vai para id2
                end
                
                id2: begin
                    found <= 0; // Sequência não encontrada
                    if (x) 
                        current_state <= id1; // Se a entrada é 1, vai para id1
                    else 
                        current_state <= id3; // Se a entrada é 0, vai para id3
                end
                
                id3: begin
                    found <= 0; // Sequência não encontrada
                    if (x) 
                        current_state <= id1; // Se a entrada é 1, vai para id1
                    else 
                        current_state <= id4; // Se a entrada é 0, vai para id4
                end
                
                id4: begin
                    if (x) 
                        current_state <= id1; // Se a entrada é 1, vai para id1
                    else 
                        current_state <= id000; // Se a entrada é 0, vai para id000
                end
                
                id000: begin
                    found <= 1; // Sequência encontrada
                    if (x) 
                        current_state <= id1; // Se a entrada é 1, vai para id1
                    else 
                        current_state <= id000; // Permanece em id000
                end
                
                default: begin
                    current_state <= start; // Estado indefinido, reiniciar
                    found <= 0;
                end
            endcase
        end
    end
endmodule // Guia_1104
