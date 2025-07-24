
class generator;
  randc bit [3:0] a,b; //eq ports for input and output
  bit [3:0] y;
  
  //constraint data {a>16;}
  
endclass

module tb;
  
  generator gen;
  int i;
  int status;
  initial begin
  gen =  new();
  for(i=0; i <10; i++) begin
    
    if(! gen.randomize) begin
      $display("randomization failed at time : %0t", $time);
      $finish ; // stopping the sim as soon as randomization fails
    end
    
    $display(" Value of a: %0d ----- Value of b : %0d ----- STATUS : %0d", gen.a,gen.b,status);
    #10;
    
  end
  end
endmodule
