class generator;
  rand bit [1:0] a,b; //eq ports for input and output
  bit [3:0] y;
  
  
endclass

module tb;
  
  generator gen;
  int i;
  initial begin
  gen =  new();
  for(i=0; i <10; i++) begin
    gen.randomize();
    $display(" Value of a: %0d ----- Value of b : %0d ", gen.a,gen.b);
    #10;
  end
  end
endmodule
