// 2 signals to steer the address , raddr and waddr.
// there is a write to memory signal and output enable.
class generator;
  
  rand bit [3:0] raddr, waddr;
  rand bit wr; //write to mem
  rand bit oe; //output enable
  
  constraint wr_c {	
    wr dist { 0:=50 , 1:=50};
  }
  
  constraint oe_c {
    oe dist { 0:=50 , 1:=50};
  }
  
  constraint wr_oe_c {
    (wr==1) <-> (oe==0);
  }
  
  //during write operation read shouldn't be perfromed
  constraint write_read {
    
    if(wr==1) 
    {
      waddr inside {[11:15 ]};
      raddr == 0;
    }
    else
    {
      waddr == 0;
      raddr inside {[11:15]	};
    }
  }
endclass
      
module tb;
  generator g;
   initial begin
     g = new();
     for(int i =0; i<15;i++) begin
       assert(g.randomize()) else $display (" Randomization Failed.\n");
       $display("Value of WRITE : %0b |||| O/P ENABLE : %0b |||| READ ADDR : %0d |||| WRITE ADDR : %0d ", g.wr,g.oe,g.raddr,g.waddr);
     end
     
   end
endmodule
