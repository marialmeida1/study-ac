/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module contador_decadico(
    output reg [3:0] Q,  
    input wire clk,      
    input wire reset     
);

    initial Q = 4'b0000;

    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 4'b0000;      
        else if (Q == 4'b1001)
            Q <= 4'b0000;      
        else
            Q <= Q + 1;        
    end

endmodule

module contador_decadico_tb;
    reg clk;              
    reg reset;          
    wire [3:0] Q;        

    contador_decadico contador (
        .Q(Q),
        .clk(clk),
        .reset(reset)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk; 
    end

    initial begin
        $display("Iniciando teste do contador assíncrono decádico crescente de 4 bits");
        reset = 1; #20;        
        reset = 0;            

        $monitor("Tempo: %0t | Q = %b", $time, Q);

        #300;                  
        $finish;              
    end
endmodule
