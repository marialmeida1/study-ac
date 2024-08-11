/*
Guia_0202
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module Guia_0202;

// define data
    real
    x = 0.375; // decimal
    integer y = 7 ; // counter
    reg [7:0] b = 0 ; // binary

// actions
    initial
        begin : main

            $display ( "====================" );
            $display ( "Guia_0202 - Questao A" );
            $display ( "====================" );

            $display ( "Decimal = %f" , x );
            $display ( "Binario = 0.%5b", b );

            while ( x > 0 && y >= 0 )
            begin
                if ( x*2 >= 1 )
                begin
                    b[y] = 1;
                    x = x*2.0 - 1.0;
                end
                else
                begin
                    b[y] = 0;
                    x = x*2.0;
                end // end if
                
                y=y-1;
            end // end while

            $display ( "====================" );
            $display ( "Binario = 0.%8b", b );
        end // main

endmodule // Guia_0202


/*
Decimal: 0,375000
Binário: 0,011
*/