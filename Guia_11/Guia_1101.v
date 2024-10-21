/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module Guia_1101 (
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
        id100 = 3'b011, // Reconhecido '100'
        id1001 = 3'b100; // Reconhecido '1001' (sequência encontrada)

    reg [2:0] current_state; // Estado atual
    reg [2:0] next_state;    // Próximo estado

    // Lógica de transição de estados
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= start; // Reinicia para o estado inicial
        else
            current_state <= next_state; // Transição para o próximo estado
    end

    // Definindo a lógica do próximo estado
    always @(*) begin
        // Inicializando o próximo estado e a saída
        next_state = current_state;
        found = 0; // Inicializa 'found' como 0

        case (current_state)
            start: begin
                if (x) next_state = id1; // Se a entrada é 1, vai para id1
                else next_state = start; // Se a entrada é 0, permanece em start
            end
            id1: begin
                if (~x) next_state = id10; // Se a entrada é 0, vai para id10
                else next_state = start; // Se a entrada é 1, retorna para start
            end
            id10: begin
                if (x) next_state = id100; // Se a entrada é 1, vai para id100
                else next_state = start; // Se a entrada é 0, retorna para start
            end
            id100: begin
                if (x) begin
                    next_state = id1001; // Se a entrada é 1, vai para id1001
                    found = 1; // Sequência encontrada
                end else
                    next_state = start; // Se a entrada é 0, retorna para start
            end
            id1001: begin
                // Uma vez que a sequência foi encontrada, permanece em id1001
                next_state = id1001; // Não aceita mais entradas
                found = 1; // Sequência encontrada
            end
            default: next_state = start; // Estado indefinido, reiniciar
        endcase
    end
endmodule // Guia_1101
