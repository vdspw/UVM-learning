// Mailbox with custom constructor
// Mailbox --sending transaction data -- Parameterized mailboxes

class transaction ; // Transaction class 
  
  logic  [7:0] data;
  
endclass

class generator;  // generator-- sends data to driver.
  
   int data = 12;
   transaction t; //handler for the transaction class.
  
  mailbox #(transaction) mbx; // transaction here is the parameter
  logic [7:0] temp =3; // temp place to store the data
  
  function new(mailbox #(transaction)mbx); // custom constructor
    this.mbx = mbx;
  endfunction
  
  task run();
    t = new();
    t.data = 45; // update the data value.
    mbx.put(t); // engaing the mailbox
    $display("[GEN] : Data sent from Generator : %0d " ,t.data);
  endtask
  
endclass

class driver; //driver recives the data from generator.
  
  mailbox #(transaction) mbx; // mailbox for reciving
  transaction data; // handler for transaction class.
  
  function new (mailbox #(transaction) mbx); 
    this.mbx = mbx;
  endfunction
  
  task run();
    mbx.get(data);
    $display("[DRV] : Data recived :%0d ",data.data);
  endtask
  
endclass

module tb;
  generator gen;
  driver drv;
  mailbox #(transaction) mbx;
  
  initial begin
    mbx = new();	//construcotrs
    gen = new(mbx);
    drv = new(mbx);
    
    //running the tasks
    gen.run();
    drv.run();
    
  end
endmodule
