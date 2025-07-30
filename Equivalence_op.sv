// Equivalence operator
class generator;
  
  rand bit [3:0] a;
  rand bit wr; //write to memory
  rand bit oe; // output enable
  
  //mutually exclusive events
  constraint wr_c {
    wr dist {0:=50,1:=50};
  }
  
  constraint oe_c {
    oe dist {1:=50,0:=50};
  }
  
  constraint wr_con_oe{
    (wr==1) <-> (oe==0);   //Equivalence operator
  }
  
endclass

module tb;
  
  generator g;
  
  initial begin
    g = new();
    
    for(int i =0; i<10; i++) begin
      assert(g.randomize()) else $display("Randomization Failed\n");
      $display("Value of WRITE : %0b ----- Value of O/P ENABLE : %0b",g.wr,g.oe);
    end
  end
  
endmodule
