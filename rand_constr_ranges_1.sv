//Constraints with ranges : a -> 0 to 8 ; b -> 3 to 11 ;

class generator;
  
  rand bit [3:0] a,b;
  bit [3:0] y;
  
/*  constraint data_a {a >3 ; a <7;}
  
  constraint data_b {b == 3;} */
  
  /*  constraint data {a > 3; a < 7; b > 0; } */
  
  constraint data {a inside {[0:8],[10:11],15};
                   b inside {[3:11]};
                  }
  
endclass

module tb;
  
  generator g;
  int i = 0;
  int status  =0;
  
  initial begin
    
    for(i=0;i<=10;i++)begin
      g = new(); // memory allocation for every randomly generated element.
      g.randomize();
      $display("Value of A : %0d :::::: Value of B : %0d",g.a,g.b);
      #10;
    end
    
  end
  
endmodule
