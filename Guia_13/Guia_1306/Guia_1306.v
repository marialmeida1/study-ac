/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module contador_anel(
    output reg [4:0] Q,  
    input wire clk,     
    input wire reset     
);

    initial Q = 5'b00001;

    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 5'b00001;      
        else
            Q <= {Q[3:0], Q[4]}; 
    end

endmodule

module contador_anel_tb;
    reg clk;            
    reg reset;          
    wire [4:0] Q;        

    contador_anel contador (
        .Q(Q),
        .clk(clk),
        .reset(reset)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk; 
    end

    initial begin
        $display("Iniciando teste do contador em anel de 5 bits");
        reset = 1; #20;       
        reset = 0;             

        $monitor("Tempo: %0t | Q = %b", $time, Q);

        #300;                  
        $finish;              
    end
endmodule
