// Guia_08
// Aluno: Mariana Almeida Mendonça
// Matrícula: 863593


// Comparador de Desigualdade
module inequalityComparator (
    output neq,         // Saída de desigualdade (1 se diferentes, 0 se iguais)
    input [4:0] A,      // Primeiro operando de 5 bits
    input [4:0] B       // Segundo operando de 5 bits
);
// Descrever a lógica de comparação
assign neq = (A != B);  // Desigualdade: A é diferente de B
endmodule // inequalityComparator

// Teste do Comparador de Desigualdade
module test_inequalityComparator;

// Definir entradas e saídas
reg [4:0] x;          // Operando A de 5 bits
reg [4:0] y;          // Operando B de 5 bits
wire neq;             // Saída de desigualdade

// Instanciar o comparador de desigualdade
inequalityComparator NEQ (neq, x, y);

// Parte principal
initial begin
    // Projetar teste do comparador
    $monitor("x = %b, y = %b, neq = %b", x, y, neq);

    // Exemplo de teste
    x = 5'b01101;  // Exemplo: 13
    y = 5'b00101;  // Exemplo: 5
    #1;            // Aguarda 1 unidade de tempo

    // Teste com valores iguais
    x = 5'b01101;  // Exemplo: 13
    y = 5'b01101;  // Exemplo: 13
    #1;

    // Teste com valores diferentes
    x = 5'b00000;  // Exemplo: 0
    y = 5'b00001;  // Exemplo: 1
    #1;
end

endmodule // test_inequalityComparator
