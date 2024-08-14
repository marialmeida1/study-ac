/*
Guia_03
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/
module Guia_0301;

    // define data
    reg signed [4:0] a = 8'b10110; // Letra A
    reg signed [5:0] b = 8'b110011 ; // Letra B
    reg signed [5:0] c = 8'b100100 ; // Letra C
    reg signed [6:0] f = 8'b1011011 ; // Letra D
    reg signed [6:0] g = 8'b1110011 ; // Letra E

    reg signed [7:0] d = 0 ; // binary
    reg signed [6:0] e = 0 ; // binary

    // actions
    initial
        begin : main

            $display ( "Guia_0303 - Tests" );
            d = ~a+1;
            e = ~(a-1);
            $display ( "a = %8b -> C1(a) = %8b -> C2(a) = %8b = %d = %d", a, ~a, d, d, e );
            d = ~b+1;
            e = ~(b-1);
            $display ( "b = %7b -> C1(b) = %7b -> C2(b) = %7b = %d = %d", b, ~b, d, d, e );
            d = ~c+1;
            e = ~(c-1);
            $display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b = %d = %d", c, ~c, d, d, e );
            d = ~f+1;
            e = ~(f-1);
            $display ( "d = %6b -> C1(d) = %6b -> C2(d) = %6b = %d = %d", f, ~f, d, d, e );
            d = ~g+1;
            e = ~(g-1);
            $display ( "e = %6b -> C1(e) = %6b -> C2(e) = %6b = %d = %d", g, ~g, d, d, e );

        end // main

endmodule // Guia_0301