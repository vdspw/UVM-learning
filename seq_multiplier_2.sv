// Create Monitor and Scoreboard Code for Synchronous 4-bit Multiplier.
//Stimulus is generated in Testbench top so do not add Transaction, Generator, or Driver Code.
//Also, add the Scoreboard model to compare the response with an expected result.

// transaction 
class transaction;
  
  randc bit [3:0] a;
  randc bit [3:0] b;
  bit [7:0] mul;
  
  function void display();
    $display("A is %0d || B is %0d || MUL is %0d", a,b,mul);
  endfunction
  
endclass

//Monitor
class monitor;
  
  mailbox #(transaction) mbx; //mailbox required for the data
  transaction trans;
  virtual top_if vif;		// connection to the DUT.
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    trans = new();
    
    forever begin
      repeat (2) @(posedge vif.clk);
      trans.a = vif.a; // use blocking when assigning the data of the interface.
      trans.b = vif.b;
      trans.mul = vif.mul;
      $display("------------------------------------");
      $display("[MON] : DATA SENT TO THE SCOREBOARD");
      
      trans.display();
      mbx.put(trans); // engage the mailbox 
    end
    
  endtask
  
endclass

//scoreboard
class scoreboard;
  
  mailbox #(transaction) mbx; // mailbox for data communication.
  transaction trans;
  
  function new(mailbox #(transaction) mbx);
    this.mbx =mbx;
  endfunction
  
  //reference model in the scoreboard.
  task compare (input transaction trans);
    if((trans.mul) == (trans.a * trans.b))
      $display("MUL: RESULT IS MATCHING");
    else
      $error("MUL: RESULT MISMATCH"); // $warning , $fatal
  endtask
  
  task run();
    forever begin
      mbx.get(trans);  // gets the transaction from mailbox
      $display("[SB] : DATA FROM MONITOR RECIEVED");
      trans.display();
      compare(trans); 
      $display("---------------------------------");
      #40; // makes the wit time to 2 clk ticks.
    end
  endtask
  
endclass

interface top_if;
  logic clk;
  logic [3:0] a, b;
  logic [7:0] mul;
  
endinterface

module tb;
  
  top_if vif();
   // instance for interface
  monitor mon;	// instance for monitor
  scoreboard sco; //instance for scoreboard.
  
  mailbox #(transaction) mbx; // mailbox declaration
  
  
  top dut (vif.clk, vif.a, vif.b, vif.mul);
  
  initial begin
    vif.clk <= 0;
  end
  
  always #5 vif.clk <= ~vif.clk;
  
  initial begin
    for(int i = 0; i<20; i++) begin
      @(posedge vif.clk);
      vif.a <= $urandom_range(1,15);
      vif.b <= $urandom_range(1,15);
    end
    
  end
  
  initial begin
    mbx = new();
    mon = new ( mbx);
    sco = new (mbx);
    mon.vif = vif; // connecting the v-if of the monitor to actual interface .
  end
  
   initial begin
    fork
      mon.run();
      sco.run();
    join
  end
  
  initial begin
    $dumpfile("dump.vcd");
     $dumpvars;    
    #300;
    $finish();
  end
  
endmodule

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

// Design --> Synchronous 4-bit Multiplier

module top
(
  input clk,
  input [3:0] a,b,
  output reg [7:0] mul
);
  
  always@(posedge clk)
    begin
     mul <= a * b;
    end
  
endmodule

