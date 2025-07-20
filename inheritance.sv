// extending class properties by inheritance

class first;
  
  int data = 12;
  
  function void display();
    $display("Value of Data : %0d",data);
  endfunction
  
endclass

class second extends first;
  
  int temp = 34;
  function void add();
    $display("Value after addition : %0d",temp+4);
  endfunction
endclass

module tb;
  
  second s;
  initial begin
    s = new();
    s.display();
    $display("Value of Data : %0d", s.data); //from extended class -- same as first 
    $display("Value of Temp : %0d", s.temp); 
    
    s.add();
  end
endmodule
