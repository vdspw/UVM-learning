module tb;
  
  task add(input bit[3:0] a, input bit[3:0] b,output bit [4:0] y);
    y = a+b;
  endtask
  
  bit[3:0] a;
  bit[3:0] b;
  bit[4:0] y;
  
  initial begin
    a =7;
    b =7;
    add(a,b,y);
    $display("Value of y is : %0d",y);
  end
  
endmodule
