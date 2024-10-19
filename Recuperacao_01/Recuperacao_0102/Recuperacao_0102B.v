module nested_mux (
    input wire a,  // Entrada 'a'
    input wire b,  // Seletor para o primeiro MUX (interno)
    input wire c,  // Seletor para o segundo MUX (externo)
    output wire y  // Saída do MUX aninhado
);

    wire mux1_out;  // Saída do MUX interno

    // MUX interno: seleciona entre 'a' e 'not(a)' com base em 'b'
    assign mux1_out = (~b & a) | (b & ~a);

    // MUX externo: seleciona entre 'c' e 'not(c)' com base na saída do MUX interno
    assign y = (~mux1_out & c) | (mux1_out & ~c);

endmodule
