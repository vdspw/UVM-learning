//User defined constructor

class first;
  int data;
  function new(input int datain);
    data = datain;
  endfunction
endclass

module tb;
  first f1;
  initial begin
    f1=new(32); //the value of datain
    $display("Value of data: %0d",f1.data);
  end
  
endmodule
