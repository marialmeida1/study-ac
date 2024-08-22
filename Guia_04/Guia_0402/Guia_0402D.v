module fxyz (
    output s1, output s2,
    input x, y, z
);
    // Lógica das expressões booleanas
    // & -> .
    // | -> +
    assign s1 = (x | ~y) | (x & ~y);
    assign s2 = x | ~y;
endmodule // fxyz

module testbench;

    reg x, y, z;
    wire s1, s2;

    // Instanciação do módulo fxyz
    fxyz uut (
        .s1(s1),
        .s2(s2),
        .x(x),
        .y(y),
        .z(z)
    );

    initial begin
        $display("x y z | s1 s2");
        $display("--------|----");

        // Teste com todas as combinações possíveis
        x = 0; y = 0; z = 0; #10;
        $display("%b %b %b | %b  %b", x, y, z, s1, s2);
        
        x = 0; y = 0; z = 1; #10;
        $display("%b %b %b | %b  %b", x, y, z, s1, s2);
        
        x = 0; y = 1; z = 0; #10;
        $display("%b %b %b | %b  %b", x, y, z, s1, s2);
        
        x = 0; y = 1; z = 1; #10;
        $display("%b %b %b | %b  %b", x, y, z, s1, s2);
        
        x = 1; y = 0; z = 0; #10;
        $display("%b %b %b | %b  %b", x, y, z, s1, s2);
        
        x = 1; y = 0; z = 1; #10;
        $display("%b %b %b | %b  %b", x, y, z, s1, s2);
        
        x = 1; y = 1; z = 0; #10;
        $display("%b %b %b | %b  %b", x, y, z, s1, s2);
        
        x = 1; y = 1; z = 1; #10;
        $display("%b %b %b | %b  %b", x, y, z, s1, s2);
        
        $finish;
    end

endmodule
