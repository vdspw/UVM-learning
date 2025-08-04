// Mailbox with custom constructor
// Mailbox --sending transaction data

class transaction;
  
  rand bit[3:0] din1;
  rand bit[3:0] din2;
  bit [4:0] dout;
  
endclass

class generator;  // gen class
  
  transaction t; //handler for the transaction
  
   mailbox mbx ; // gen to driv communication
  
  function new(mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  task main();
    for (int i =0; i< 10 ; i++) begin
      t = new(); // new object for all components
      assert(t.randomize) else $display("Randomization Failed");
      $display(" [GEN] : Data Sent : din1 : %0d and din2: %0d:",t.din1,t.din2);
      mbx.put(t); // place transaction element in the mailbox.
      #10;
    end
  endtask
  
endclass

class driver; // driver class
  
  transaction dc; // to store the data element
  mailbox mbx ; // gen to drv communication
  
  function new(mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  task main();
    forever begin
      mbx.get(dc); //data constianer-- retrieving data from mailbox.
      $display("[DRV] : Data Recieved : din1 :%0d and din2 : %0d ",dc.din1, dc.din2 );
      #10;
    end
  endtask
  
endclass

module tb;
  generator g;
  driver d;
  
  mailbox mbx;
  
  initial begin
    
    mbx = new();
    
    g = new(mbx);
    d = new(mbx);
    // mbx = new();
    
    g.mbx = mbx; // passage for data
    d.mbx = mbx;
    
    fork
      g.main();
      d.main();
    join
    
    
  end
  
endmodule
