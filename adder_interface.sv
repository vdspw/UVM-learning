// Interface


interface add_if;
  
  logic [3:0] a;
  logic [3:0] b;
  
  logic [4:0] sum;
  
endinterface

module tb;
  
  add_if aif();
  
  adder dut (aif.a,aif.b,aif.sum);
  
  initial begin
    aif.a = 4;
    aif.b = 4;
    #10;
    aif.a = 3;
    #10;
    aif.b = 7;
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  
endmodule
