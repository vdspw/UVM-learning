`timescale 1ns / 1ps

module tb;
  
  bit [5:0] addr; // 6-bit address array
  bit en;
  bit wr;
  
  bit clk = 0;
  always #20 clk = ~clk; // 25 MHz clock (40 ns period)
  
  task wr_en();
    en = $urandom();
    wr = $urandom();
  endtask
  
  task addr_gen();
    addr = $urandom(); // Generate random 6-bit address
  endtask
  
  initial begin
    // Initialize signals
    en = 0;
    wr = 0;
    addr = 0;
    
    // Run for 5 clock cycles
    repeat (5) begin
      @(posedge clk); // Wait for posedge clk to ensure synchronization
      wr_en(); // Generate random en and wr
      addr_gen(); // Generate random addr
      #1; // Small delay to ensure signal propagation
      if (wr && en) begin
        $display("Time: %0t ns, Write and Enable are high, addr = %0h", $time, addr);
      end
      else if (!wr && en) begin
        $display("Time: %0t ns, Write not high, en = %0b", $time, en);
      end
      else begin
        $display("Time: %0t ns, Enable not high, en = %0b", $time, en);
      end
    end
    #20; // Wait one more half-cycle to complete
    $finish; // Terminate simulation
  end
  
  initial begin
    $dumpfile("addr.vcd"); // VCD file
    $dumpvars(); // Dump all variables in tb module
  end
endmodule
