module truth_table;

    // Variáveis para as entradas
    reg a, b, c;
    
    // Variável para a saída (resultado da expressão)
    wire result;
    
    // Definindo a expressão booleana
    assign result = (~a | b) & (b | ~c);
    
    // Procedimento para gerar a tabela verdade
    initial begin
        // Cabeçalho da tabela
        $display("a  b  c  | Result");
        $display("-----------------");
        
        // Testando todas as combinações de a, b, c
        a = 0; b = 0; c = 0; #1 $display("%b  %b  %b  |   %b", a, b, c, result);
        a = 0; b = 0; c = 1; #1 $display("%b  %b  %b  |   %b", a, b, c, result);
        a = 0; b = 1; c = 0; #1 $display("%b  %b  %b  |   %b", a, b, c, result);
        a = 0; b = 1; c = 1; #1 $display("%b  %b  %b  |   %b", a, b, c, result);
        a = 1; b = 0; c = 0; #1 $display("%b  %b  %b  |   %b", a, b, c, result);
        a = 1; b = 0; c = 1; #1 $display("%b  %b  %b  |   %b", a, b, c, result);
        a = 1; b = 1; c = 0; #1 $display("%b  %b  %b  |   %b", a, b, c, result);
        a = 1; b = 1; c = 1; #1 $display("%b  %b  %b  |   %b", a, b, c, result);
        
        $finish;  // Termina a simulação
    end

endmodule
