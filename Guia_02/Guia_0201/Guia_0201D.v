/*
Guia_0201
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module Guia_0201;

// define data
    real xr = 0; // decimal | parte real
    real x = 0 ; // decimal | parte fracionaria
    real xt = 0;
    real power2 = 1.0; // potencia de 2
    integer cont = 4 ; // contador
    reg [1:0] br = 2'b01;
    reg [4:0] b = 5'b11101; // binário | parte fracionada (Big Endian)

// actions
    initial
        begin : main

            $display ( "====================" );
            $display ( "Guia_0201 - Questao D" );
            $display ( "====================" );

            $display ( "Decimal = %f" , x );
            $display ( "Binario = 0.%5b", b );

            while (cont >= 0 )
            begin
                power2 = power2 / 2.0;
                if ( b[cont] == 1 )
                    begin
                        x = x + power2;
                    end
                cont = cont - 1;
            end // end while

            xr = br;
            xt = xr + x;


            $display ( "====================" );
            $display ( "Decimal fracionaria = %f", x );
            $display ( "Decimal real = %f", xr );
            $display ( "Decimal total = %f", xt );
        end // main
endmodule // Guia_0201
