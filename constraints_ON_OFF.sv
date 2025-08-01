// turning ON and OFF the constraints
class generator;
  
  randc bit [3:0] raddr, waddr;
  rand bit wr; // write to memory
  rand bit oe; // O/P enable
  
  constraint wr_c {
    wr dist {0:=50,1:=50};
  }
  
  constraint oe_c {
    oe dist {1:=50,0:=50};
  }
  
  constraint wr_c_oe {
    (wr==1) -> (oe==0);
  }
endclass

module tb;
  generator g;
  initial begin
    g = new();
    g.wr_c_oe.constraint_mode(0); // turning off the constraint -- 1 for turig ON
    
      $display(" The status of the constraint : %0d", g.wr_c_oe.constraint_mode());
    for (int i =0 ; i<25; i++) begin
      assert(g.randomize()) else $display("Randomization failed");
      $display("Value of WRITE: %0b ---- Value of O/P EN : %0b ",g.wr,g.oe);
    end
  end
endmodule
