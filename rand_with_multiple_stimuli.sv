class generator;
  
  rand bit [3:0] a,b;
  bit [3:0] y;
  
endclass

module tb;
  
  generator g;
  int i = 0;
  int status  =0;
  
  initial begin
    
    for(i=0;i<=10;i++)begin
      g = new(); // memory allocation for every randomly generated element.
      g.randomize();
      $display("Value of A : %0d :::::: Value of B : %0d",g.a,g.b);
      #10;
    end
    
  end
  
endmodule
