/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

// Módulo do registrador de deslocamento de 6 bits 
module shift_register_6bit (
    input clk,
    input rst,          
    input ld,           
    input [5:0] in,     
    output reg [5:0] q  
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 6'b0; 
        end
        else if (ld) begin
            q <= in;  
        end
        else begin
            q <= {q[4:0], 1'b0}; 
        end
    end
endmodule

// Módulo de teste
module test_shift_register_6bit;
    reg clk;
    reg rst;
    reg ld;
    reg [5:0] in;
    wire [5:0] q;

    shift_register_6bit uut (
        .clk(clk),
        .rst(rst),
        .ld(ld),
        .in(in),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time = %0d, clk = %b, rst = %b, ld = %b, in = %b, q = %b", $time, clk, rst, ld, in, q);
        
        rst = 1;
        ld = 0;
        in = 6'b0;

        #10 rst = 0;

        #10 ld = 1; in = 6'b101010;
        #10 ld = 0;

        #10;
        #10;
        #10;
        #10;

        #10 ld = 1; in = 6'b110011;
        #10 ld = 0;

        #10;
        #10;

        #10 $finish;
    end
endmodule
