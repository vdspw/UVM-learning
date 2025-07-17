// Assume class consists of three data members a, b, and c each of size 4-bit. Create a task inside the class that returns the result of the addition of data members.
//The task must also be capable of sending the value of a, b, c, and result to the console. Verify code for a = 1, b = 2, and c = 4.

class first;
  
  bit[3:0] a,b,c;
  bit[7:0] result;
  
  function new(input bit[3:0] a , input bit[3:0] b, input bit [3:0] c);
    this.a = a;
    this.b = b;
    this.c = c;
  endfunction
  
  task addition();
    result = a+b+c;
    $display("The sum is : %0d",result);
  endtask
  
endclass

module tb;
  
  first f1;
  
  initial begin 
    f1=new(1,2,4); 
    f1.addition(); // calling the method or task in a class
    
  end
  
endmodule
