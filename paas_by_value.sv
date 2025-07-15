// pass by value 
module tb;
  
  task swap(input bit[1:0] a,b);
    bit[1:0] temp;
    temp =a; //temp has value of "a"
    a =b;	 // value of "b" is in "a"
    b = temp; // temp has "b"
    
    $display("Value of a : %0d and Value of b : %0d",a,b);
    
  endtask
  
  bit[1:0] a;
  bit[1:0] b;
  
  initial begin
    a = 1;
    b = 2;
    swap(a,b);
    $display("Value of a : %0d and Value of b : %0d",a,b); // after coming out of the task
  end
endmodule
