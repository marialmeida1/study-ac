// Guia_08
// Aluno: Mariana Almeida Mendonça
// Matrícula: 863593
//

// half adder
module halfAdder (
    output s1,   // Carry
    output s0,   // Soma
    input a,     // Primeiro bit
    input b      // Segundo bit
);
// Descrever por portas lógicas
xor XOR1 (s0, a, b);
and AND1 (s1, a, b);
endmodule // halfAdder

// full adder
module fullAdder (
    output s1,      // Carry out
    output s0,      // Soma
    input a,        // Bit do operando A
    input b,        // Bit do operando B
    input carryIn   // Carry in (vai-um)
);
// Descrever usando portas e/ou módulos
wire s_half, carry_half1, carry_half2;

// Usar dois half-adders para o full adder
halfAdder HA1 (carry_half1, s_half, a, b);
halfAdder HA2 (carry_half2, s0, s_half, carryIn);

// Carry final é a soma dos carries intermediários
or OR1 (s1, carry_half1, carry_half2);
endmodule // fullAdder

module test_fullAdder;

reg [4:0] x;        // Operando A de 5 bits
reg [4:0] y;        // Operando B de 5 bits
wire [4:0] carry;   // Vai-um intermediário
wire [5:0] soma;    // Resultado da soma (5 bits + 1 carry)

// Instanciar 5 full adders para os 5 bits
fullAdder FA0 (carry[0], soma[0], x[0], y[0], 1'b0);
fullAdder FA1 (carry[1], soma[1], x[1], y[1], carry[0]);
fullAdder FA2 (carry[2], soma[2], x[2], y[2], carry[1]);
fullAdder FA3 (carry[3], soma[3], x[3], y[3], carry[2]);
fullAdder FA4 (carry[4], soma[4], x[4], y[4], carry[3]);

// O bit final da soma considera o carry final
assign soma[5] = carry[4];

// Parte principal
initial begin
    // Projetar teste do somador completo
    $monitor("x = %b, y = %b, soma = %b, carry = %b", x, y, soma[4:0], carry);

    // Exemplo de teste com 5 bits
    x = 5'b01010;  // Exemplo: 10
    y = 5'b00111;  // Exemplo: 7
    #1;            // Aguarda 1 unidade de tempo
end

endmodule
