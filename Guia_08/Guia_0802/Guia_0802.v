// Guia_08
// Aluno: Mariana Almeida Mendonça
// Matrícula: 863593

// half subtractor
module halfSubtractor (
    output borrow,   // Empréstimo
    output diff,     // Diferença
    input a,         // Primeiro bit (minuendo)
    input b          // Segundo bit (subtraendo)
);
// Descrever por portas lógicas
xor XOR1 (diff, a, b);   // Diferença: A XOR B
and AND1 (borrow, ~a, b); // Empréstimo: NOT A AND B
endmodule // halfSubtractor

// full subtractor
module fullSubtractor (
    output borrow_out, // Empréstimo de saída
    output diff,       // Diferença
    input a,           // Bit do minuendo
    input b,           // Bit do subtraendo
    input borrow_in    // Empréstimo de entrada
);
// Descrever usando portas e/ou módulos
wire diff_half, borrow_half1, borrow_half2;

// Usar dois half-subtractors para o full subtractor
halfSubtractor HS1 (borrow_half1, diff_half, a, b);
halfSubtractor HS2 (borrow_half2, diff, diff_half, borrow_in);

// Empréstimo final é a soma dos borrows intermediários
or OR1 (borrow_out, borrow_half1, borrow_half2);
endmodule // fullSubtractor

module test_fullSubtractor;

reg [4:0] x;        // Minuendo de 5 bits
reg [4:0] y;        // Subtraendo de 5 bits
wire [4:0] borrow;  // Empréstimos intermediários
wire [5:0] diff;    // Resultado da diferença (5 bits + 1 borrow)

// Instanciar 5 full subtractors para os 5 bits
fullSubtractor FS0 (borrow[0], diff[0], x[0], y[0], 1'b0);
fullSubtractor FS1 (borrow[1], diff[1], x[1], y[1], borrow[0]);
fullSubtractor FS2 (borrow[2], diff[2], x[2], y[2], borrow[1]);
fullSubtractor FS3 (borrow[3], diff[3], x[3], y[3], borrow[2]);
fullSubtractor FS4 (borrow[4], diff[4], x[4], y[4], borrow[3]);

// O bit final da diferença considera o borrow final
assign diff[5] = borrow[4]; // Para indicar se houve um borrow final

// Parte principal
initial begin
    // Projetar teste do subtrator completo
    $monitor("x = %b, y = %b, diff = %b, borrow = %b", x, y, diff[4:0], borrow);

    // Exemplo de teste com 5 bits
    x = 5'b01101;  // Exemplo: 13
    y = 5'b00101;  // Exemplo: 5
    #1;            // Aguarda 1 unidade de tempo
end

endmodule 
