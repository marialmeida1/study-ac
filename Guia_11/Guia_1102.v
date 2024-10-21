/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module Guia_1102 (
    output reg found,  // Saída que indica que a sequência foi encontrada
    input x,          // Sinal de entrada
    input clk,        // Sinal de clock
    input reset       // Sinal de reset
);
    // Definindo estados
    parameter
        start = 3'b000, // Estado inicial
        id1 = 3'b001,   // Reconhecido '1'
        id10 = 3'b010,  // Reconhecido '10'
        id100 = 3'b011; // Reconhecido '100'
    
    reg [2:0] current_state; // Estado atual

    // Lógica de transição de estados e saída
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
                    if (~x) 
                        current_state <= id10; // Se a entrada é 0, vai para id10
                    else 
                        current_state <= start; // Se a entrada é 1, retorna para start
                end
                
                id10: begin
                    found <= 0; // Sequência não encontrada
                    if (x) 
                        current_state <= id100; // Se a entrada é 1, vai para id100
                    else 
                        current_state <= start; // Se a entrada é 0, retorna para start
                end
                
                id100: begin
                    if (x) begin
                        found <= 1; // Sequência encontrada
                        current_state <= start; // Volta ao estado inicial
                    end else 
                        current_state <= start; // Se a entrada é 0, retorna para start
                end
                
                default: begin
                    current_state <= start; // Estado indefinido, reiniciar
                    found <= 0;
                end
            endcase
        end
    end
endmodule // Guia_1102
