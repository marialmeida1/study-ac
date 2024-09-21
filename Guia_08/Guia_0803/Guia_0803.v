// Guia_08
// Aluno: Mariana Almeida Mendonça
// Matrícula: 863593

// Comparador de Igualdade
module equalityComparator (
    output eq,          // Saída de igualdade (1 se iguais, 0 se diferentes)
    input [4:0] A,      // Primeiro operando de 5 bits
    input [4:0] B       // Segundo operando de 5 bits
);
// Descrever a lógica de comparação
assign eq = (A == B);  // Igualdade: A é igual a B
endmodule // equalityComparator

// Teste do Comparador de Igualdade
module test_equalityComparator;

// Definir entradas e saídas
reg [4:0] x;          // Operando A de 5 bits
reg [4:0] y;          // Operando B de 5 bits
wire eq;              // Saída de igualdade

// Instanciar o comparador de igualdade
equalityComparator EQ (eq, x, y);

// Parte principal
initial begin
    // Projetar teste do comparador
    $monitor("x = %b, y = %b, eq = %b", x, y, eq);

    // Exemplo de teste
    x = 5'b01101;  // Exemplo: 13
    y = 5'b01101;  // Exemplo: 13
    #1;            // Aguarda 1 unidade de tempo

    // Teste com valores diferentes
    x = 5'b01101;  // Exemplo: 13
    y = 5'b00101;  // Exemplo: 5
    #1;

    // Teste com valores iguais
    x = 5'b00000;  // Exemplo: 0
    y = 5'b00000;  // Exemplo: 0
    #1;
end

endmodule 
