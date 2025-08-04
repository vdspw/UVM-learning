// Mailbox with custom constructor
// Mailbox 2

class generator;  // gen class
  
  int data = 56;
  mailbox mbx ; // gen to driv communication
  
  function new(mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    mbx.put(data);
    $display("[GEN]: Sent Data :%0d",data);
  endtask
  
endclass

class driver; // driver class
  
  int datac = 0; // to store the data element
  mailbox mbx ; // gen to drv communication
  
  function new(mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    mbx.get(datac);
    $display("[DRV] : Recieved Data : %0d",datac);
  endtask
  
endclass

module tb;
  generator gen;
  driver drv;
  
  mailbox mbx;
  
  initial begin
    
    mbx = new();
    
    gen = new(mbx);
    drv = new(mbx);
    // mbx = new();
    
    gen.mbx = mbx; // passage for data
    drv.mbx = mbx;
    
    gen.run();	// calling the methods of the class generator
    drv.run();	// -- || -- class driver
    
    
  end
  
endmodule
