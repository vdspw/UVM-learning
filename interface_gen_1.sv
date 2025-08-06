class transaction ;
  randc bit [3:0] a;
  randc bit [3:0] b;
  
  function void display();
    $display("A : %d \t B : %0d ",a,b);
  endfunction
  
  function transaction copy(); // deep copy of the transacation
    copy = new(); //constructor of the copy.
    copy.a = this.a; //deep copy 
    copy.b = this.b;
  endfunction
endclass

class generator;
  transaction trans; // handler of the transaction.
  mailbox #(transaction) mbx; //handler for mailbox.
  int i =0;
  
  function new(mailbox #(transaction)  mbx);
    this.mbx = mbx;
    trans = new();
  endfunction
  
  task run();
    for(i = 0; i<20;i++) begin
      assert(trans.randomize()) else $display("Randomization Failed");
      $display("[GEN] : DATA SENT TO DRIVER");
      trans.display();
      mbx.put(trans.copy); // having the copy in the mailbox.
    end
  endtask
  
endclass

module tb;
  generator gen;
  mailbox #(transaction) mbx; 
  
  initial begin
    mbx = new();
    gen = new(mbx); //passing mailbox.
    gen.run();
  end
endmodule

--------------------------------------------------------------------------------------------------------

// DUT -- Adder design code
module adder (
  input [3:0] a, b,
  output reg [4:0] sum,
  input clk);
  
  
  always@(posedge clk) begin
    
 	 sum <= a+b;
    
  end
endmodule
