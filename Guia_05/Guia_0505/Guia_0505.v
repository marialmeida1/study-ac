module f6_nor (
    output s,
    input a,
    input b
);
    // Definir dados locais
    wire not_a, not_b;
    wire and1, and2;
    wire or_ab;

    // NOT usando NOR -> Inverte A e B
    nor (not_a, a, a);
    nor (not_b, b, b);

    // AND usando NOR -> Cria AND 
    nor (and1, not_a, not_b); // 1ª Parte -> (~a AND ~b)
    nor (and2, a, b);         // 2ª Parte -> (a AND b)

    // OR usando NOR -> Combina as duas partes AND
    nor (or_ab, and1, and2); // (~a AND ~b) OR (a AND b)

    // XNOR usando NOR
    nor (s, or_ab, or_ab); // Negação da combinação anterior para XNOR

endmodule // f6_nor
module test_f6_nor;
    reg x, y;
    wire s;

    // Instanciando o módulo f6_nor
    f6_nor moduloXNOR (s, x, y);

    initial begin
        $display("Guia_0500 - Mariana Almeida Mendonça - 863593");
        $display(" x  y | s (resultado esperado)");

        // Teste com diferentes valores para x e y
        x = 0; y = 0; #1 $display("%2b %2b | %1b (esperado: 1)", x, y, s); // Esperado: 1
        x = 0; y = 1; #1 $display("%2b %2b | %1b (esperado: 0)", x, y, s); // Esperado: 0
        x = 1; y = 0; #1 $display("%2b %2b | %1b (esperado: 0)", x, y, s); // Esperado: 0
        x = 1; y = 1; #1 $display("%2b %2b | %1b (esperado: 1)", x, y, s); // Esperado: 1
    end
endmodule // test_f6_nor
