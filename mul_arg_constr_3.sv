// Assume the class consists of three 8-bit data members a, b, and c. Create a Custom Constructor that allows the user to update the value of these data members while adding a constructor to the class. Test your code by adding the value of 2, 4, and 56 to a, b and c respectively.

class first;
  
  bit[8:0] a,b,c;
  
  function new(input bit[7:0] a , input bit[7:0] b, input bit [7:0] c);
    this.a = a;
    this.b = b;
    this.c = c;
  endfunction
  
endclass

module tb;
  
  first f1;
  
  initial begin 
    f1=new(2,4,56); 
   
    $display("Value of a : %0d :: Value of b : %0d ::Value of c: %0d",f1.a,f1.b,f1.c);
  end
  
endmodule
