// Guia_08
// Aluno: Mariana Almeida Mendonça
// Matrícula: 863593


// Entradas: clk e rst
// Start: ativa a geração do pulso
// Saída: pulse_out

// Tigger -> detecta uma borda(subida/descida)

// Módulo de Clock - Troca os sinais
module clock (output clk);
    reg clk;
    initial begin
        clk = 1'b0;
    end
    always begin
        #12 clk = ~clk; // Ocila a cada 12 unidades de tempo / T(período) = 24 unidades de tempo
    end
endmodule

// Módulo que gera um pulso que altera o valor com base no clock
module pulse (
    signal, clock
);
    input clock;
    output signal;
    reg signal;
    always @( clock ) begin
        signal = 1'b1; // Sinaliza por 3 unidades de tempo
        #3 signal = 1'b0; 
        #3 signal = 1'b1;
        #3 signal = 1'b0;
    end
endmodule

// Ativa um sinal de saída quando o clock atinge uma borda de subida e a entrada(on) está ativa
module trigger (
    signal, on, clock
);
    input on, clock;
    output signal;
    reg signal;
    always @(posedge clock & on) begin // So ativa se clock(1) e on(1)
        #60 signal = 1'b1;
        #60 signal = 1'b0;
    end
endmodule


// Método principal -> conecta os módulos, inicializa sinais e executa
module Guia_0901;
    wire clock;
    clock clk (clock);
    reg p; // Sinal: controla o trigger
    wire p1, t1; // Sinal: (p1) -> gerado por pulse | (t1) -> gerado por trigger
    pulse pulse1 (p1, clock);
    trigger trigger1 (t1, p, clock);
    
    initial begin
        p = 1'b0;
    end
    
    initial begin
        $dumpfile("Guia_0901.vcd");
        $dumpvars(1, clock, p1, p, t1);

        #060 p = 1'b1;
        #120 p = 1'b0;
        #180 p = 1'b1;
        #240 p = 1'b0;
        #300 p = 1'b1;
        #360 p = 1'b0;
        #376 $finish;
    end
endmodule