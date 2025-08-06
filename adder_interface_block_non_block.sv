// Interface


interface add_if;
  
  logic [3:0] a;
  logic [3:0] b;
  
  logic [4:0] sum;
  logic clk;
  
endinterface

module tb;
  
  add_if aif();
  
  adder dut (.a(aif.a),.b(aif.b),.sum(aif.sum),.clk(aif.clk));
  
  initial begin
    aif.clk = 0; // to avoid initial value to be X.
    
  end
  
  always #10 aif.clk = ~aif.clk;
  
  initial begin
    aif.a <= 1;
    aif.b <= 5;
    repeat(3) @(posedge aif.clk);
    aif.a <= 4;
    aif.b <= 4;
    #10;
    aif.a <= 3;
    #10;
    aif.b <= 7;
    
  end
  
  initial begin
    $dumpfile("adder_file.vcd");
    $dumpvars;
    #100;
    $finish();
  end
  
  
endmodule

-------------------------------------------------------------------------------------------------------------------
// Adder design code

module adder (
  input [3:0] a, b,
  output reg [4:0] sum,
  input clk);
  
  
  always@(posedge clk) begin
    
 	 sum <= a+b;
    
  end
endmodule
