/*
Guia_0203
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module Guia_0204;

// define data
    reg [7:0] b =  8'b11110100 ; // binary
    reg [7:0] b2 = 8'b10000000 ; // binary

// actions
    initial
        begin : main

            $display ( "====================" );
            $display ( "Guia_0204 - Questao C" );
            $display ( "====================" );

            $display ( "Binario = 0.%8b%b", b, b2 );
            //$display ( "Quartenário = 0.%d%d%d%d (4)", A[7:6], A[5:4], A[3:2], A[1:0] );
            $display("Octal = 0.%o%o%o%o (8)", b[5:3], b[2:0], b2[5:3], b[2:0]);
            //$display ( "b = 0.%x%x (16)", b[7:4],b[3:0] );

        end // main

endmodule // Guia_0204


/*
Octal: 0,51
Binário: 0,10100100
*/