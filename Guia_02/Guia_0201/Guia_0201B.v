/*
Guia_0201.v
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module Guia_0201;

// define data
    real x = 0 ; // decimal
    real power2 = 1.0; // potencia de 2
    integer
    cont = 4 ; // contador
    reg [4:0] b = 5'b01001; // binário | parte fracionada (Big Endian)

// actions
    initial
        begin : main

            $display ( "====================" );
            $display ( "Guia_0201 - Questao B" );
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

                $display ( "====================" );
                $display ( "Decimal = %f", x );
        end // main
endmodule // Guia_0201
