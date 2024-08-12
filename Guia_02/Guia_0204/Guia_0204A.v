/*
Guia_0203
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module Guia_0204;

// define data
    reg [7:0] b = 8'b11100100 ; // binary
    integer q [3:0];

// actions
    initial
        begin : main

            $display ( "====================" );
            $display ( "Guia_0204 - Questao A" );
            $display ( "====================" );

            $display ( "Binario = 0.%8b", b );
            $display ( "Hexadecimal = 0.%x%x (16)", b[7:4],b[3:0] );
            q[3] = b[7:6];
            q[2] = b[5:4];
            q[1] = b[3:2];
            q[0] = b[1:0];
            $display ( "Quartenário = 0.%2d %2d %2d %2d (4)", q[3] ,q[2] ,q[1] ,q[0] );
        end // main

endmodule // Guia_0202


/*
Quartenário: 0,321
Binário: 00.111001
*/