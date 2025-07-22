// polymorphism

class first ;  //parent class
  int data = 34;
  
 virtual function void display();
    $display("FISRT : Value of data is  : %0d",data);
  endfunction
endclass

class second extends first; //child class
  int temp =12;
  
  function void add();
    $display(" SECOND_1 : Vlaue after addtion : %0d ", temp +4);
  endfunction
  
  function void display();
    $display("SECOND_2 : Value of data : %0d ", data);
  endfunction
  
endclass

module tb;
  first f;
  second s;
  
  initial begin
    f =new();
    s = new(); //constructors
    
    f = s ; //assigning value of s to object f.
    f.display();
     end
endmodule
