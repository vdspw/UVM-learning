`include "test.sv"
`timescale 1ns/1ps

module tb;
  
  reg rst  = 0;   //////rst represent DUT reset Signal
  bit clk = 0;   //////clk represent DUT Clock Signal
  
  
  /////// User code for generating clock goes here
  ///// Generate 25 MHz Clock stimulus for signal clk with 50% Duty cycle
  initial begin
    clk = 0;
    
  end
  
  always #20 clk = ~clk;
  
  
  
  
  /////// User code ends here
 
  
  
  
 
  /////Do not change any code after this ->
  
  sub_tb s (clk);
  
 initial 
   begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    #400;
    $stop;
  end
  
  
endmodule

`timescale 1ns/1ps
 
 ////Do not change any code after this ->

module sub_tb(input probe);

  realtime st = 0,ed = 0;
  realtime dif = 0;

  initial begin
    @(posedge probe);
    st = $realtime();
    @(posedge probe);
    ed = $realtime();
    #2;
    dif = ed - st;
    $display("---------------------------");
    $display("magic_no = %0t", (dif/1000));
    $display("---------------------------");
  end
  
endmodule
