/*
Guia_0203
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module Guia_0202;

// define data
    reg [7:0] b = 8'b01111000 ; // binary

// actions
    initial
        begin : main

            $display ( "====================" );
            $display ( "Guia_0203 - Questao A" );
            $display ( "====================" );

            $display ( "Binario = 0.%8b", b );
            $display ( "Quartenário = 0.%d%d%d%d (4)", b[7:6], b[5:4], b[3:2], b[1:0] );


            //$display ( "b = 0.%x%x (16)", b[7:4],b[3:0] );
            //$display ( "b = 0.%o%o%o (8) ", b[7:6],b[5:3],b[2:0] );

        end // main

endmodule // Guia_0202


/*
Quartenário: 0,132
Binário: 0,011110
*/