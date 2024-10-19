module truth_table;
  reg x, y;     // Variáveis de entrada
  wire result;  // Resultado da expressão

  // Definindo a expressão lógica (x'.y)'.(x'.y')'
  assign result = ~((~x & y)) & ~((~x & ~y));

  initial begin
    // Cabeçalho da tabela verdade
    $display("x  y  |  result");
    $display("-------------");

    // Testando todas as combinações de x e y
    x = 0; y = 0; #1 $display("%b  %b  |    %b", x, y, result);
    x = 0; y = 1; #1 $display("%b  %b  |    %b", x, y, result);
    x = 1; y = 0; #1 $display("%b  %b  |    %b", x, y, result);
    x = 1; y = 1; #1 $display("%b  %b  |    %b", x, y, result);

    $finish;
  end
endmodule
