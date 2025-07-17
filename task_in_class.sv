// A task in a class

class first;
  
  bit[8:0] a,b,c;
  
  function new(input bit[7:0] a , input bit[7:0] b, input bit [7:0] c);
    this.a = a;
    this.b = b;
    this.c = c;
  endfunction
  
  task display();
    $display("Value of A : %0d",a);
    $display("Value of B : %0d",b);
    $display("Value of C : %0d",c);
  endtask
  
endclass

module tb;
  
  first f1;
  
  initial begin 
    f1=new(2,4,56); 
    f1.display(); // calling the method or task in a class
    
  end
  
endmodule
