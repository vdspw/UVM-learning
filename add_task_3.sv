module tb;
  
 
  
  bit[3:0] a;
  bit[3:0] b;
  bit[4:0] y;
  
  bit clk = 0;
  always #5 clk = ~clk;
  
   task add();
    y = a+b;
     $display(" a : %0d, b: %0d , y: %0d",a,b,y);
  endtask
  
  task stimuli_a_b();
    a = 1;
    b = 3;
    add();
    #10;
    a = 5;
    b = 6;
    add();
    #10;
    a = 7;
    b = 8;
    add();
    #10;
  endtask
  
  task stimulus_clk();
    @(posedge clk); //wait
    a = $urandom();
    b = $urandom();
    add();
  endtask
  
  initial begin
    #110;
    $finish();
  end
  
  initial begin
    //stimuli_a_b();
    for(int i =0;i<11;i++) begin
      stimulus_clk();
    end
  end
  
endmodule
