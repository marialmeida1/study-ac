module fxyzw (
    output s,
    input x, y, z, w
);
    assign s = (~x & ~y & ~z & w) | (~x & ~y & z) | (~x & y & ~z & ~w) | (~x & y & z & w) | (x & z & w);
endmodule

module testbench;

    reg x, y, z, w;
    wire s;

    fxyzw uut (
        .s(s),
        .x(x),
        .y(y),
        .z(z),
        .w(w)
    );

    initial begin
        $display("x y z w | s");
        $display("-----------|--");

        x = 0; y = 0; z = 0; w = 0; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);
        
        x = 0; y = 0; z = 0; w = 1; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);
        
        x = 0; y = 0; z = 1; w = 0; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);
        
        x = 0; y = 0; z = 1; w = 1; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);
        
        x = 0; y = 1; z = 0; w = 0; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);
        
        x = 0; y = 1; z = 0; w = 1; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);
        
        x = 0; y = 1; z = 1; w = 0; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);
        
        x = 0; y = 1; z = 1; w = 1; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);
        
        x = 1; y = 0; z = 0; w = 0; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);
        
        x = 1; y = 0; z = 0; w = 1; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);
        
        x = 1; y = 0; z = 1; w = 0; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);
        
        x = 1; y = 0; z = 1; w = 1; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);
        
        x = 1; y = 1; z = 0; w = 0; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);
        
        x = 1; y = 1; z = 0; w = 1; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);
        
        x = 1; y = 1; z = 1; w = 0; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);
        
        x = 1; y = 1; z = 1; w = 1; #10;
        $display("%b %b %b %b | %b", x, y, z, w, s);

        $finish;
    end

endmodule

