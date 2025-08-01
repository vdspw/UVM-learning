//Generate values between 0 to 7 for addr signal when wr is high and values between 8 to 15 when wr is low. Generator code is mentioned in the Instruction tab.
//Verify your code for 20 iterations by sending values of both wr and addr on a console.

class generator;
  
  rand bit [3:0] addr;
  rand bit wr;
  
  constraint cntl_wr { wr dist {0:=50,1:=50	}; }
  
  constraint wr_addr { 
    if(wr==1) 
      addr inside {[0:7 ]};
    
    else 
      addr inside {[8:15]};
    
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
      $display ("INDEX : %0d  The Value of WR : %0b == Value of ADDR : %0d  ",i, g.wr,g.addr);
    end
    
  end
endmodule
