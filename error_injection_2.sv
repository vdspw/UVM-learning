class transaction ; // Transaction
  randc bit [3:0] a; 
  randc bit [3:0] b;
  bit [4:0] sum;
  
  function void display();
    $display("A : %d \t B : %0d \t SUM : %0d ",a,b,sum);
  endfunction
  
  function transaction copy(); // deep copy of the transacation
    copy = new(); //constructor of the copy.
    copy.a = this.a; //deep copy 
    copy.b = this.b; //deep copy
    copy.sum = this.sum; 
  endfunction
endclass

// error injection-- extending the transaction clss.
class error extends transaction;
  constraint data_c {a==0;b==0; }
endclass

class generator; // generator
  transaction trans; // handler of the transaction.
  mailbox #(transaction) mbx; //handler for mailbox.
  int i =0;
  event done;
  
  function new(mailbox #(transaction)  mbx);
    this.mbx = mbx;
    trans = new();
  endfunction
  
  task run();
    
    for(i = 0; i<20;i++) begin
      assert(trans.randomize()) else $display("Randomization Failed");
      
      
      mbx.put(trans); // having the trans in the mailbox.allows us to send data to class
      $display("[GEN] : DATA SENT TO DRIVER");
      trans.display();
      #20;
    end
    ->done;
  endtask
  
endclass

interface add_if;	// interface
  logic [3:0] a;
  logic [3:0] b;
  logic [4:0] sum;
  logic clk;
  
  modport DRV (input a,b,input sum,input clk);
endinterface

class driver;	// driver
  virtual add_if aif; // virtual interface.
  mailbox #(transaction) mbx;
  transaction data;
  event next;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run ();
    forever begin
      mbx.get(data);
      @(posedge aif.clk);
      aif.a <= data.a;
      aif.b <= data.b;
      $display("[DRV] : Interface Trigger");
      data.display();
     // ->next;
    end
  endtask
endclass

module tb;
  add_if aif();
  driver drv;
  generator gen;
  error err;  // creating an instance of error class for connecting it with the generator.
  
  event done;
  
  mailbox #(transaction) mbx; 
  
  adder dut (aif.a,aif.b,aif.sum,aif.clk);
  
  initial begin  //clocking block -- initialization
    aif.clk <=0;
  end
  
      always #10 aif.clk <= ~aif.clk;
  
  
  initial begin
    mbx = new();
    err = new();
    drv = new(mbx);
    gen = new(mbx); //passing mailbox.
    gen.trans = err; // generator transaction should be = error 
    drv.aif = aif;  //connection
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
