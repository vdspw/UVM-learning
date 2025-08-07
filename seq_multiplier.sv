// Create Transaction, Generator and Driver code for Synchronus 4-bit Multiplier.

class transaction ;
  
  randc bit [3:0] a;
  randc bit [3:0] b;
  bit [7:0] mul;
  
  function void display();
    $display("A is %0d \t B is %0d \t MUL is %0d",a,b,mul);
  endfunction
  
  function transaction copy();
    copy = new();
    copy.a = this.a;
    copy.b = this.b;
    copy.mul = this.mul;
  endfunction
  
  
endclass

class generator;
  
  transaction trans;
  mailbox #(transaction) mbx;
  int i =0;
  event done;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
    trans = new();
  endfunction
  
  task run();
    for( i =0; i<20 ; i++) begin
      assert(trans.randomize()) else $display (" Randomization Failed !");
      mbx.put(trans.copy);
      $display("[GEN] : DATA SENT TO DRIVER");
      trans.display();
      #20;
    end
    ->done;
  endtask
  
endclass

interface mul_if;
  
  logic [3:0] a;
  logic [3:0] b;
  logic [7:0] mul;
  logic clk;
  
endinterface

class driver ;
  
  virtual mul_if mif; // instance for interface
  mailbox #(transaction) mbx;
  transaction data;
  event next;
  
  function new (mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    forever begin
      mbx.get(data);
      @(posedge mif.clk);
      mif.a <= data.a;
      mif.b <= data.b;
      $display("[DRV] : Interface Trigger");
      data.display();
    end
  endtask
  
endclass

module tb ; 
  
  mul_if mif();
  driver drv;
  generator gen;
  
  event done;
  mailbox #(transaction) mbx;
  
  top dut (mif.clk, mif.a,mif.b,mif.mul);
  
  initial begin
    mif.clk = 0;
  end
  
  always #20 mif.clk <= ~mif.clk;
  
  initial begin
    mbx = new();
    drv = new(mbx);
    gen = new(mbx);
    
    drv.mif = mif;
    done = gen.done;
  end
  
  initial begin
    fork
      gen.run();
      drv.run();
    join
    wait(done.triggered);
    $finish();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #500;
    $finish();
  end
  
endmodule

//////////////////////////////////////////////////////////////////////////////////
// DUT -- Sequential multiplier

// 4 bit synchronous multiplier.

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
