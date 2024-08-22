module fxyz (
    output s,
    input x, y, z
);
    assign s = ~x & ~(~y | z);
endmodule

module testbench;

    reg x, y, z;
    wire s;

    fxyz uut (
        .s(s),
        .x(x),
        .y(y),
        .z(z)
    );

    initial begin
        $display("x y z | s");
        $display("--------|--");

        x = 0; y = 0; z = 0; #10;
        $display("%b %b %b | %b", x, y, z, s);
        
        x = 0; y = 0; z = 1; #10;
        $display("%b %b %b | %b", x, y, z, s);
        
        x = 0; y = 1; z = 0; #10;
        $display("%b %b %b | %b", x, y, z, s);
        
        x = 0; y = 1; z = 1; #10;
        $display("%b %b %b | %b", x, y, z, s);
        
        x = 1; y = 0; z = 0; #10;
        $display("%b %b %b | %b", x, y, z, s);
        
        x = 1; y = 0; z = 1; #10;
        $display("%b %b %b | %b", x, y, z, s);
        
        x = 1; y = 1; z = 0; #10;
        $display("%b %b %b | %b", x, y, z, s);
        
        x = 1; y = 1; z = 1; #10;
        $display("%b %b %b | %b", x, y, z, s);
        
        $finish;
    end

endmodule
