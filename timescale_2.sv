`include "test.sv"
`timescale 1ns/1ps
module tb;

  reg clk1 ;   // 100 MHz clock signal
  reg clk2 ;   // 50 MHz clock signal

  // User Clock generation logic start here
	initial begin
      clk1 = 0;
      clk2 = 0;
    end
  
  ////// User clock generation logic ends here
  always #5 clk1 = ~ clk1;
  always #2.5 clk2 = ~clk2;

  // Instantiate the test class
  test t1 = new();

  initial begin
    #80;   // Sample clocks at 80 ns
    t1.no_gen(clk1, clk2);
    t1.display();
    $stop;
  end
  
endmodule

class test;
  int temp = 0;  // Holds the "magic number"
  
  // Task to display the result
  task display();
    $display("---------------------------");
    $display("magic_no = %0d", this.temp);
    $display("---------------------------");
  endtask
  
  // Task to generate the magic number based on clk1 and clk2
  task no_gen(input bit clk1, input bit clk2);
    // Generate magic number based on clk1 and clk2 states
    this.temp = clk1 * clk2 * 75 + (clk1 ^ clk2) * 50;
  endtask
  
endclass
