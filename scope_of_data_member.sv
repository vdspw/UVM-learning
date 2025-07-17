// class inside a class
// scope of a variable

class first;
  
  local int data =34;
  
  task set (input int data);
    this.data = data;
  endtask
  
  function int get ();
    return data;
  endfunction
  
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
    
    s.f1.set(123); //to update the value
    $display("Value of data :%0d",s.f1.get());
  end
  
endmodule
