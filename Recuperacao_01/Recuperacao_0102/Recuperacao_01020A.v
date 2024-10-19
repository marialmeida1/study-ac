module mux_2to1 (
    input wire a,    // Entrada 'a'
    input wire c,    // Seletor 'c'
    output wire y    // Saída 'y'
);

    assign y = (~c & a) | (c & ~a);  // Implementa a lógica do MUX

endmodule
