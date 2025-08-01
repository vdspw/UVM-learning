// Assume generator class consists of three 8-bit data members (x,y, and z). Write a code to generate 20 random values for all the data members at an interval of 20 ns.
//Random values for all data members should range from 0 to 50.

class generator;
  
  rand bit [7:0] x;
  rand bit [7:0] y;
  rand bit [7:0] z;
  
  constraint data { x inside {[0:50]};
                   y inside {[0:50]} ;
                   z inside {[0:50]} ;	
  }
  
endclass

module tb;
  generator g;
  initial begin
    g = new();
    for ( int i = 0; i<20; i++) begin
      assert( g.randomize()) else $display ("Randomization failed" );
      $display ("INDEX : %0d  The Value of X : %0d == Value of Y : %0d == Value of Z :%0d ",i, g.x,g.y,g.z);
    end
    #20;
    $finish();
  end
endmodule
