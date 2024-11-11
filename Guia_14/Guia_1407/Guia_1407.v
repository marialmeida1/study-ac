/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module ring_shift_register_5bit (
    input clk,
    input rst,
    input load,
    input [4:0] load_data,
    output reg [4:0] q
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 5'b0;
        end
        else if (load) begin
            q <= load_data;
        end
        else begin
            q <= {q[3:0], q[4]};
        end
    end
endmodule

module test_ring_shift_register_5bit;
    reg clk;
    reg rst;
    reg load;
    reg [4:0] load_data;
    wire [4:0] q;

    ring_shift_register_5bit uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .load_data(load_data),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time = %0d, clk = %b, rst = %b, load = %b, load_data = %b, q = %b", $time, clk, rst, load, load_data, q);
        
        rst = 1;
        load = 0;
        load_data = 5'b10101;
        #10 rst = 0;
        
        #10 load = 1;
        #10 load = 0;

        #50;
        
        load_data = 5'b11011;
        #10 load = 1;
        #10 load = 0;

        #50 $finish;
    end
endmodule
