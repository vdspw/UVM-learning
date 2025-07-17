// class inside a class

class first;
  
  int data =34;
  
  task display();
    $display("Value of data : %0d",data);
  endtask
  
endclass

class second;
  
  first f1; //handler for class first
  
  function new();
    f1 = new();
  endfunction
  
endclass

module tb;
  
  second s;//handler for class second
  
  initial begin
    s = new();
    $display("Value of data: %0d",s.f1.data);
    s.f1.display();
    s.f1.data = 45;
    s.f1.display();
  end
  
endmodule
