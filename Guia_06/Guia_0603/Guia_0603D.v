module fxyzw (
    output s,
    input x, y, z, w
);
assign s = (~x & ~y & ~w) |       // x'y'w'
           (~x & y & w) |        // x'yw
           (w & z & ~x & ~y) |   // wz'x'
           (x & y & w) |         // xyw
           (w & z & y) |         // wzy
           (w & z & ~y & ~x) |   // wz'y'
           (w & z & ~x);         // wz'x



endmodule

module testbench;

    reg x, y, z, w;
    wire s;

    fxyzw uut (
        .s(s),
        .x(x),
        .y(y),
        .w(w),
        .z(z)
    );

    initial begin
        $display("x y w z | s");
        $display("-----------|--");

        x = 0; y = 0; w = 0; z = 0; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);
        
        x = 0; y = 0; w = 0; z = 1; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);
        
        x = 0; y = 0; w = 1; z = 0; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);
        
        x = 0; y = 0; w = 1; z = 1; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);
        
        x = 0; y = 1; w = 0; z = 0; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);
        
        x = 0; y = 1; w = 0; z = 1; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);
        
        x = 0; y = 1; w = 1; z = 0; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);
        
        x = 0; y = 1; w = 1; z = 1; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);
        
        x = 1; y = 0; w = 0; z = 0; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);
        
        x = 1; y = 0; w = 0; z = 1; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);
        
        x = 1; y = 0; w = 1; z = 0; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);
        
        x = 1; y = 0; w = 1; z = 1; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);
        
        x = 1; y = 1; w = 0; z = 0; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);
        
        x = 1; y = 1; w = 0; z = 1; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);
        
        x = 1; y = 1; w = 1; z = 0; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);
        
        x = 1; y = 1; w = 1; z = 1; #10;
        $display("%b %b %b %b | %b", x, y, w, z, s);

        $finish;
    end

endmodule

