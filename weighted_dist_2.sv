// weighted distribution part 2

class first;
  
  rand bit wr; // :=
  rand bit rd; // :/
  
  rand bit [1:0] var1;
  rand bit [1:0] var2;
  
  constraint data {
    var1 dist {0:=30, [1:3] := 90};
    var2 dist {0:/30, [1:3] := 90};
  }
  
  constraint cntrl {
    wr dist {0:=30,1:=70};
    rd dist {0:/30,1:/70};
  }
  
endclass

module tb;
  first f;
  
  initial begin
    f = new();
    
    for(int i =0;i<20;i++) begin
    f.randomize();
    $display("Value of VAR1(:=) : %0d ------ Value of VAR2(:/) : %0d ", f.var1,f.var2);
  end
    
  end
endmodule
