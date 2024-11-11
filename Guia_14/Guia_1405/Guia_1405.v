/*
Aluno: Mariana Almeida Mendonça
Matrícula: 863593
*/

module parallel_to_serial_6bit (
    input clk,
    input rst,            
    input load,           
    input [5:0] parallel_in, 
    output reg serial_out 
);

    reg [5:0] shift_reg; 
    reg [2:0] bit_counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 6'b0;
            bit_counter <= 3'b0;
            serial_out <= 0;
        end
        else if (load) begin
            shift_reg <= parallel_in; 
            bit_counter <= 3'b101;    
        end
        else if (bit_counter > 0) begin
            serial_out <= shift_reg[0]; 
            shift_reg <= shift_reg >> 1;
            bit_counter <= bit_counter - 1;
        end
        else if (bit_counter == 0) begin
            serial_out <= shift_reg[0]; 
            bit_counter <= bit_counter - 1;
        end
    end
endmodule

module test_parallel_to_serial_6bit;
    reg clk;
    reg rst;
    reg load;
    reg [5:0] parallel_in;
    wire serial_out;

    parallel_to_serial_6bit uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time = %0d, clk = %b, rst = %b, load = %b, parallel_in = %b, serial_out = %b", $time, clk, rst, load, parallel_in, serial_out);
        
        rst = 1;
        load = 0;
        parallel_in = 6'b101101;

        #10 rst = 0;

        #10 load = 1;
        #10 load = 0;

        #60; 

        #10 parallel_in = 6'b110011;
        #10 load = 1;
        #10 load = 0;

        #60; 

        #10 $finish;
    end
endmodule
