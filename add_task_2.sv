module tb;
  
 
  
  bit[3:0] a;
  bit[3:0] b;
  bit[4:0] y;
  
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
  
  initial begin
    stimuli_a_b();
  end
  
endmodule
