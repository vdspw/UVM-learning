//Write a code to send transaction data between generator and driver. Also, verify the data by printing the value of data members of Generator and Driver.

class transaction;
  bit [7:0] addr = 7'h12;
  bit [3:0] data = 4'h4;
  bit we = 1'b1;
  bit rst = 1'b0;
endclass

class generator;
  transaction t;
  mailbox #(transaction) mbx;

  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction

  task main();
    for (int i = 0; i < 10; i++) begin
      t = new();
      assert(t.randomize()) else $display("Randomization failed");
      $display("[GEN] : Data sent from generator - addr: %0h, data: %0h, we: %0b, rst: %0b",
               t.addr, t.data, t.we, t.rst);
      mbx.put(t); // placing transaction in the mailbox
    end
  endtask
endclass

class driver;
  transaction dc;
  mailbox #(transaction) mbx;

  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction

  task main();
    repeat (10) begin
      mbx.get(dc);
      $display("[DRV] : Data received - addr: %0h, data: %0h, we: %0b, rst: %0b",
               dc.addr, dc.data, dc.we, dc.rst);
    end
  endtask
endclass

module tb;
  generator gen;
  driver drv;
  mailbox #(transaction) mbx;

  initial begin
    mbx = new();
    gen = new(mbx);
    drv = new(mbx);

    fork
      gen.main();
      drv.main();
    join
  end
endmodule
