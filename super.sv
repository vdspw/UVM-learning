// super_keyword.sv

class first ;  // parent class
  int data;
  function new(input int data);
    this.data = data;
  endfunction
endclass

class second extends first;
  int temp;
  function new(int data , int temp);
    super.new(data); //referes to the data from the parent class
    this.temp =  temp;
  endfunction
endclass

module tb;
  second s;
  
  initial begin
    s = new(23,56);
    $display("Value of data : %0d ::::: Value of temp :%0d",s.data,s.temp);
  end
endmodule
