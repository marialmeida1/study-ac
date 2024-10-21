/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module Guia_1105 (
    output reg found,  // Saída que indica que a sequência foi encontrada
    input x,          // Sinal de entrada
    input clk,        // Sinal de clock
    input reset       // Sinal de reset
);
    // Definindo estados
    parameter
        start = 3'b000, // Estado inicial
        first0 = 3'b001, // Reconhecido 0
        first1 = 3'b010, // Reconhecido 1
        second0 = 3'b011, // Reconhecido 01
        second1 = 3'b100, // Reconhecido 10
        accepted010 = 3'b101, // Sequência 010 encontrada
        accepted101 = 3'b110; // Sequência 101 encontrada
    
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
                        current_state <= first1; // Se a entrada é 1, vai para first1
                    else 
                        current_state <= first0; // Se a entrada é 0, vai para first0
                end
                
                first0: begin
                    found <= 0; // Sequência não encontrada
                    if (x) 
                        current_state <= second1; // Se a entrada é 1, vai para second1
                    else 
                        current_state <= first0; // Permanece em first0
                end
                
                first1: begin
                    found <= 0; // Sequência não encontrada
                    if (x) 
                        current_state <= first1; // Permanece em first1
                    else 
                        current_state <= second0; // Se a entrada é 0, vai para second0
                end
                
                second0: begin
                    if (x) 
                        current_state <= accepted010; // Se a entrada é 1, reconhece 010
                    else 
                        current_state <= first0; // Se a entrada é 0, vai para first0
                end
                
                second1: begin
                    if (x) 
                        current_state <= first1; // Se a entrada é 1, vai para first1
                    else 
                        current_state <= accepted101; // Se a entrada é 0, reconhece 101
                end
                
                accepted010: begin
                    found <= 1; // Sequência 010 encontrada
                    if (x) 
                        current_state <= first1; // Se a entrada é 1, vai para first1
                    else 
                        current_state <= first0; // Se a entrada é 0, vai para first0
                end
                
                accepted101: begin
                    found <= 1; // Sequência 101 encontrada
                    if (x) 
                        current_state <= first1; // Se a entrada é 1, vai para first1
                    else 
                        current_state <= first0; // Se a entrada é 0, vai para first0
                end
                
                default: begin
                    current_state <= start; // Estado indefinido, reiniciar
                    found <= 0;
                end
            endcase
        end
    end
endmodule // Guia_1105
