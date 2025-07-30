// Implication operator
class generator;
  
  rand bit [3:0] a;
  rand bit ce; //chip enable
  rand bit rst; // reset
  
  //whenever reset is 0 chip enable is 1
  //whenever reset is 1 dont care of enable
  constraint control_rst {
    rst dist {0:=80,1:=20};
  }
  
  constraint control_ce {
    ce dist {1:=80,0:=20};
  }
  
  constraint control_rst_ce{
    (rst==0) -> (ce==1);   //implication operator
  }
  
endclass

module tb;
  
  generator g;
  
  initial begin
    g = new();
    
    for(int i =0; i<10; i++) begin
      assert(g.randomize()) else $display("Randomization Failed\n");
      $display("Value of RESET : %0b ----- Value of CHIP ENABLE : %0b",g.rst,g.ce);
    end
  end
  
endmodule
