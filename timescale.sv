`include "test.sv"
`timescale 1ns/1ps

module tb;
  
  reg sclk = 0;   //////sclk represent SPI Clock Signal
  
  
  /////// User code for generating clock goes here
  ///// Generate 9 MHz Clock stimulus for signal sclk with 50% Duty cycle and upto 3-bit precision
  initial begin
    sclk = 0;
  end
  
 always #55.55 sclk = ~sclk;

  
  
  
  
  /////// User code ends here
 
  
  
  
 
  /////Do not change any code after this ->
  
  sub_tb s (sclk);
  
 initial 
   begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    #800;
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
    $display("magic_no = %0t",dif/1000);
    $display("---------------------------");
  end
  
endmodule
