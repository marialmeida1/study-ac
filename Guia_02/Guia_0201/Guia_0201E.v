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
    reg [1:0] br = 2'b11;
    reg [4:0] b = 5'b11001; // binário | parte fracionada (Big Endian)

// actions
    initial
        begin : main

            $display ( "====================" );
            $display ( "Guia_0201 - Questao E" );
            $display ( "====================" );

            $display ( "Decimal Inteiro = %f" , xr );
            $display ( "Decimal Fracionado = %f" , x );
            $display ( "Binario Inteiro = 0.%5b", br );
            $display ( "Binario Fracionado = 0.%5b", b );

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

/*
Binário: 11,11001 
Decimal: 3,78125
*/