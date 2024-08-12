/*
Guia_0203
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module Guia_0204;

// define data
    reg [7:0] b1 = 8'b00111101 ; // binary
    reg [7:0] b2 = 8'b00100000 ;
    integer q [6:0];

// actions
    initial
        begin : main

            $display ( "====================" );
            $display ( "Guia_0204 - Questao A" );
            $display ( "====================" );

            $display ( "Binario = 0.%8b%8b", b1, b2 );
            q[6] = b1[7:6];
            q[5] = b1[5:4];
            q[4] = b1[3:2];
            q[3] = b1[1:0];
            q[2] = b2[7:6];
            q[1] = b2[5:4];
            q[0] = b2[3:2];
            $display ( "Quartenário = 0.%2d%2d%2d%2d%2d%2d (4)", q[6], q[5] ,q[4], q[3] ,q[2] ,q[1] ,q[0] );
        end // main

endmodule // Guia_0202


/*
Hexa: 0,3D2
Binário: 0000.001111010010
*/