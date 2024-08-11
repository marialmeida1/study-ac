/*
Guia_0202
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module Guia_0202;

// define data
    real x = 0.125; // decimal
    real xr = 2; // inteiro
    integer y = 3; // counter
    reg [3:0] b = 0 ; // binary
    reg [3:0] br = 0 ; // binary

// actions
    initial
        begin : main

            $display ( "====================" );
            $display ( "Guia_0202 - Questao B" );
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

            br = xr;

            $display ( "====================" );
            $display ( "Binario Decimal = %4b", b );
            $display ( "Binario Inteiro = %4b", br );
            $display ( "Binario Total = %4b.%4b", br, b );
        end // main

endmodule // Guia_0202

/*
Decimal: 2,125000 
Binário: 10,001
*/