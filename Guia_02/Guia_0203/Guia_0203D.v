/*
Guia_0203
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module Guia_0202;

// define data
    reg [7:0] b  = 8'b111011; // binary decimal
    reg [7:0] br = 8'b00000001; // binary inteiro

// actions
    initial
        begin : main

            $display ( "====================" );
            $display ( "Guia_0203 - Questao D" );
            $display ( "====================" );

            $display ( "Binario = 0.%8b", b );
            //$display ( "Quartenário = 0.%d%d%d%d (4)", A[7:6], A[5:4], A[3:2], A[1:0] );
            //$display("Octal = %o%o%o", b[7:6], b[5:3], b[2:0]);
            $display("Octal = %o%o%o.%o%o (8)", br[7:6], br[5:3], br[2:0], b[5:3], b[2:0]);
            //$display ( "b = 0.%x%x (16)", b[7:4],b[3:0] );

        end // main

endmodule // Guia_0202


/*
Binário: 1,111011
Octal: 01,73
*/