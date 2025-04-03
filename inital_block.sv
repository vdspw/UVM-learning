`include "test.sv"


module tb;
  
  reg resetn = 0;   //////rst represent DUT reset Signal
  reg clk = 0;
  /////// User Logic goes here
  
	initial begin
      clk = 0;
      resetn = 0;
      #100; 
      resetn = ~resetn; #50;
           
    end
   
  	
  
  
  
  
  /////// User code ends here
 
  
  test t1 = new();
  
  initial begin
    #201;
    t1.no_gen(resetn);
    t1.display();
  end
  
  
endmodule
