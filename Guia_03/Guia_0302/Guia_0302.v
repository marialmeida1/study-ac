/*
Guia_03
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/
module Guia_0301;

    // define data
    reg [5:0] a = 8'b111001 ; // Letra A
    reg [7:0] b = 8'hb2  ; // Letra B
    reg [5:0] c = 8'b101101 ; // Letra C
    reg [9:0] d = 8'o146 ; // Letra D
    reg [7:0] e = 8'h6f  ; // Letra E

    reg [5:0] f = 0 ; // binary
    reg [7:0] g = 0 ; // binary
    reg [5:0] h = 0 ; // binary
    reg [9:0] i = 0 ; // binary
    reg [7:0] j = 0 ; // binary

    // actions
    initial
        begin : main

            $display ( "Guia_0301 - Tests" );
            f = ~a+1;
            $display ( "a = %6b -> C1(a) = %6b -> C2(a) = %6b", a, ~a, f );
            g = ~b+1;
            $display ( "b = %8b -> C1(b) = %8b -> C2(b) = %8b", b, ~b, g );
            h = ~c+1;
            $display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b", c, ~c, h );
            i = ~d+1;
            $display ( "d = %10b -> C1(d) = %10b -> C2(d) = %10b", d, ~d, i );
            j = ~e+1;
            $display ( "e = %8b -> C1(e) = %8b -> C2(e) = %8b", e, ~e, j );

        end // main

endmodule // Guia_0301