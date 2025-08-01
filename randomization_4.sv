// Take the help of pseudo-random number generator to generate values for wr and rst signal. rst should be low for apprx. 30% of time whie wr should be high for apprx. 50% of time.
//Verify your code for 20 iterations by sending values of both wr and rst on a console.


class generator;
  
  rand bit wr;
  rand bit rst;
  
  constraint cntl_wr { wr dist {0:=50,1:=50	}; }
  
  constraint cntl_rst { rst dist {0:=30,1:=70 }; 
                      
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
      $display ("INDEX : %0d  The Value of wr : %0b == Value of RST : %0b  ",i, g.wr,g.rst);
    end
    
  end
endmodule
