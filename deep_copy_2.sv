//Create a deep copy of the Generator class. To verify the deep copy code assign value of the copy method to another instance of the generator class in TB top.
//Print the value of data members in the generator class as well as copied class. Refer Instruction tab for Generator class code.

class generator;
  int data = 12;
  
  function generator copy();
    copy = new();
    copy.data = data;
  endfunction
endclass

class gen_cpy;
  int ds = 34;
  generator f1;
  
  function new();
    f1 = new();
  endfunction
  
  function gen_cpy copy();
    copy = new();
    copy.ds = ds;
    copy.f1 = f1.copy();
  endfunction
endclass

module tb;
  gen_cpy s1;
  gen_cpy s2; // copy
  initial begin
    s1 = new();
    s2 = new();
    s1.ds = 45;
    s2 = s1.copy();
    s2.ds = 90;
    s2.f1.data = 78; // Modify s2.f1.data to verify deep copy
    
    $display("Value of s1.ds: %0d", s1.ds);
    $display("Value of s2.ds: %0d", s2.ds);
    $display("Value of s1.f1.data: %0d", s1.f1.data);
    $display("Value of s2.f1.data: %0d", s2.f1.data);
  end
endmodule
