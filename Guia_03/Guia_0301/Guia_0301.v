/*
Guia_03
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/
module Guia_0301;
    // define data
    reg [5:0] a = 8'b001010 ; // Letra A
    reg [7:0] b = 8'b00001101 ; // Letra B
    reg [5:0] c = 8'b101001 ; // Letra C
    reg [6:0] g = 8'b0101111 ; // Letra D
    reg [7:0] i = 8'b110100 ; // Letra E

    reg [5:0] d = 0; // Letra A
    reg [7:0] e = 0; // Letra B
    reg [5:0] f = 0; // Letra C
    reg [6:0] h = 0; // Letra D
    reg [7:0] j = 0; // Letra E

    // actions
    initial
        begin : main

            $display ( "Guia_0301 - Tests" );
            d = ~a+1;
            $display ( "a = %6b -> C1(a) = %6b -> C2(a) = %6b", a, ~a, d );
            e = ~b+1;
            $display ( "b = %8b -> C1(b) = %8b -> C2(b) = %8b", b, ~b, e );
            f = ~c+1;
            $display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b", c, ~c, f );
            h = ~g+1;
            $display ( "d = %7b -> C1(d) = %7b -> C2(d) = %7b", g, ~g, h );
            j = ~i+1;
            $display ( "e = %7b -> C1(e) = %7b -> C2(e) = %7b", i, ~i, j );

        end // main

endmodule // Guia_0301