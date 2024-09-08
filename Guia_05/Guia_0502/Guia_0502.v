module f7_nor (
    output s,
    input a,
    input b
);
    // Definir dados locais
    wire not_a;
    wire not_b;
    wire nor_ab;
    wire not_ab;

    // Inverter a e b
    nor (not_a, a, a);
    nor (not_b, b, b);

    nor (nor_ab, a, not_b);
    nor (s, nor_ab, nor_ab);

endmodule // f7_nor
module test_f7_nor;
    reg x, y;
    wire s;

    // Instanciando o módulo f7_nor
    f7_nor moduloNOR (s, x, y);

    initial begin
        $display("Guia_0500 - Mariana Almeida Mendonça - 863593");
        $display(" x  y | s (resultado esperado)");

        // Teste com diferentes valores para x e y
        x = 0; y = 0; #1 $display("%2b %2b | %1b (esperado: 1)", x, y, s); // Esperado: 0
        x = 0; y = 1; #1 $display("%2b %2b | %1b (esperado: 0)", x, y, s); // Esperado: 1
        x = 1; y = 0; #1 $display("%2b %2b | %1b (esperado: 1)", x, y, s); // Esperado: 0
        x = 1; y = 1; #1 $display("%2b %2b | %1b (esperado: 1)", x, y, s); // Esperado: 0
    end
endmodule // test_f7_nor

