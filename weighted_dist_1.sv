// weighted distribution part 1

class first;
  
  rand bit wr; // :=
  rand bit rd; // :/
  
  constraint cntrl {
    wr dist {0:=30,1:=70};
    rd dist {0:/30,1:/70};
  }
  
endclass

module tb;
  first f;
  
  initial begin
    f = new();
    
  for(int i =0;i<10;i++) begin
    f.randomize();
    $display("Value of WR : %0d ------ Value of RD : %0d ", f.wr,f.rd);
  end
    
  end
endmodule
