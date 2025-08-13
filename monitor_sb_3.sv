// transaction 
class transaction;
  
  randc bit [3:0] a;
  randc bit [3:0] b;
  bit [4:0] sum;
  
  function void display();
    $display("A is %0d || B is %0d || SUM is %0d", a,b,sum);
  endfunction
  
endclass

// Interface 
interface add_if;
  
  logic [3:0] a;
  logic [3:0] b;
  logic [4:0] sum;
  logic clk;
  
endinterface

//Monitor
class monitor;
  
  mailbox #(transaction) mbx; //mailbox required for the data
  transaction trans;
  virtual add_if aif;		// connection to the DUT.
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    trans = new();
    
    forever begin
      repeat (2) @(posedge aif.clk);
      trans.a = aif.a; // use blocking when assigning the data of the interface.
      trans.b = aif.b;
      trans.sum = aif.sum;
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
    if((trans.sum) == (trans.a + trans.b))
      $display("SUM: RESULT IS MATCHING");
    else
      $error("SUM: RESULT MISMATCH"); // $warning , $fatal
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

// testbench top
module tb;
  
  add_if aif(); // instance for interface
  monitor mon;	// instance for monitor
  scoreboard sco; //instance for scoreboard.
  
  mailbox #(transaction) mbx; // mailbox declaration
  
  //instantiation
  adder dut (aif.a, aif.b, aif.sum, aif.clk);
  
  //clk block
  initial begin
    aif.clk <=0;
  end
  
  always #10 aif.clk = ~aif.clk;
  
  // generation of random values
  initial begin
  for ( int i =0; i< 20; i ++) begin
    repeat (2) @(posedge aif.clk); // input stays stable for 2 clk ticks.
    aif.a <= $urandom_range(0,15);
    aif.b <= $urandom_range(0,15);
  end
  end
  
  initial begin
    mbx = new();
    mon = new ( mbx);
    sco = new (mbx);
    mon.aif = aif; // connecting the v-if of the monitor to actual interface .
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
    #450;
    $finish();
  end
  
  
endmodule

////////////////////////////////////////////////////////////////////////////////////////////////
// DUT --adder
module adder (
  input [3:0] a, b,
  output reg [4:0] sum,
  input clk);
  
  
  always@(posedge clk) begin
    
 	 sum <= a+b;
    
  end
endmodule
