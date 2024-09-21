// Guia_08
// Aluno: Mariana Almeida Mendonça
// Matrícula: 863593

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

// Complemento de 2
module twoComplement (
    output [4:0] result, // Resultado do complemento de 2
    input [4:0] A        // Operando de 5 bits
);
    wire [4:0] inverted; // Inversão dos bits
    wire carry_out;

    // Inverter os bits do operando
    assign inverted = ~A; // Complemento de 1

    // Adicionar 1 ao complemento de 1
    fullAdder FA0 (carry_out, result[0], inverted[0], 1'b1, 1'b0);
    fullAdder FA1 (carry_out, result[1], inverted[1], 1'b0, carry_out);
    fullAdder FA2 (carry_out, result[2], inverted[2], 1'b0, carry_out);
    fullAdder FA3 (carry_out, result[3], inverted[3], 1'b0, carry_out);
    fullAdder FA4 (carry_out, result[4], inverted[4], 1'b0, carry_out);
endmodule // twoComplement

// Teste do Complemento de 2
module test_twoComplement;

// Definir entradas e saídas
reg [4:0] x;          // Operando A de 5 bits
wire [4:0] result;    // Resultado do complemento de 2

// Instanciar o módulo de complemento de 2
twoComplement TC (result, x);

// Parte principal
initial begin
    // Projetar teste do complemento de 2
    $monitor("x = %b, complemento de 2 = %b", x, result);

    // Exemplo de teste
    x = 5'b00101;  // Exemplo: 5, complemento de 2 deve ser 111011 (ou -5)
    #1;            // Aguarda 1 unidade de tempo

    // Teste com outro valor
    x = 5'b00011;  // Exemplo: 3, complemento de 2 deve ser 11101 (ou -3)
    #1;

    // Teste com um número negativo
    x = 5'b11010;  // Exemplo: -6, complemento de 2 deve ser 00110 (ou 6)
    #1;
end

endmodule // test_twoComplement
