
//Constraints with ranges : a -> 0 to 8 ; b -> 3 to 11 ;
// we dont want values 3 to 7 for a and  for  b we dont want 5 to 9.
//defining function and constraint externally (not in the class).

class generator;
  
  rand bit [3:0] a,b;
  bit [3:0] y;
 extern constraint data; 
  extern function void display(); 
 endclass

constraint generator :: data{
  a inside {[0:3] };
  b inside {[12:15] };
};
    
    function void generator :: display();
      $display("Value of A : %0d -----Value of B : %0d ",a,b);
    endfunction

module tb;
  
  generator g;
  int i = 0;
  int status  =0;
  
  initial begin
    
    for(i=0;i<=10;i++)begin
      g = new(); // memory allocation for every randomly generated element.
      assert (g.randomize()) else $display("Randomization failed");
      g.display();
      #10;
    end
    
  end
  
endmodule
