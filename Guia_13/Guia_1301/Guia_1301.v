/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module contador_assincrono_decrescente(
    output reg [4:0] Q,  
    input wire clk,      
    input wire reset    
);

    initial Q = 5'b11111;

    always @(negedge clk or posedge reset) begin
        if (reset)
            Q <= 5'b11111;      
        else
            Q <= Q - 1;          
    end

endmodule
module contador_assincrono_decrescente_tb;
    reg clk;              
    reg reset;           
    wire [4:0] Q;        

    contador_assincrono_decrescente contador (
        .Q(Q),
        .clk(clk),
        .reset(reset)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk; 
    end

    initial begin
        $display("Iniciando teste do contador assíncrono decrescente de 5 bits");
        reset = 1; #20;        
        reset = 0;             

        $monitor("Tempo: %0t | Q = %b", $time, Q);

        #600;                  
        $finish;             
    end
endmodule
