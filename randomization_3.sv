// Adding constraints to the DUT signals.
// For the Generator code mentioned in the Instruction tab, expected values for variable a ranges from 0 to 8, variable b ranges from 0 to 5.
//Also, add logic to store the number of times randomization failed. Print values of variables during each iteration and error count after generating 20 random values for a and b. 
//Add Constraint Code and Testbench top code to  the Design.

class generator;
  
  rand bit [4:0] a;
  rand bit [5:0] b;
  
  constraint data { a inside {[0:8]};
                    b inside {[0:5]} ;
                  	
  }
  
endclass

module tb;
  generator g;
  int failed = 0;
  initial begin
    g = new();
    for ( int i = 0; i<20; i++) begin
      assert( g.randomize()) else begin 
        failed++;
        $display ("Randomization failed no. is %0d ",failed );
      end
      $display ("INDEX : %0d  The Value of A : %0d == Value of B : %0d  ",i, g.a,g.b);
    end
    
  end
endmodule
