// adding driver to the interface.

interface add_if;	//Interface.
  logic [3:0] a,b;
  logic [4:0] sum;
  logic clk;
  
  modport DRV (output a, b,input sum,clk);
  
endinterface

class driver;			// Driver.
  virtual add_if.DRV aif; //getting acces to interface through the modport
  
  task run();
    forever begin
      @(posedge aif.clk); // wait for the clk signal.
      	aif.a <=3;       // stimului
      	aif.b <=3;
    end
  endtask
  
endclass

module tb;
  
  add_if aif(); // accessing the interface from testbench top.
  
  adder dut (.a(aif.a), .b(aif.b), .sum(aif.sum), .clk(aif.clk));
  
  initial begin
    aif.clk <= 0;
  end
  
  always #10 aif.clk = ~aif.clk;
  
  driver drv; // using driver
  
  initial begin
    drv =  new(); // construcotr for the driver.
    drv.aif = aif ; //connection - virtual intf in the drv is connected to intf in tb-top.
    drv.run();    // calling run task to drive the stimulus.
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100;
    $finish();
  end
  
  
endmodule

--------------------------------------------------------------------------------------------------
//DUT ADDER DESIGN CODE:

// Adder design code

module adder (
  input [3:0] a, b,
  output reg [4:0] sum,
  input clk);
  
  
  always@(posedge clk) begin
    
 	 sum <= a+b;
    
  end
endmodule
