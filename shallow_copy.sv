// Copying the data members 
// Shallow copy

class first;
  
  int data =12;
  
endclass

class second;
  
  int ds =34;
  first f1;
  
  function new();
    f1=new();
  endfunction
  
endclass

module tb;
  second s1;
  second s2; //copy
  initial begin
    s1=new();
    s1.ds = 23;
    
    s2 = new s1; // copying
    s2.ds =90;
    $display(" Value of DS : %0d ",s1.ds);
    $display(" Value of DS : %0d ",s2.ds);
    
    s2.f1.data = 88;
    $display(" Value of data : %0d ",s2.f1.data);
  end
endmodule
