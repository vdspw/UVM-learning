// Multiple arguments to constrtr.
// follow by position approach 
class first;
  
  int data1;
  bit [7:0] data2;
  shortint data3;
  
  function new(input int data1 = 0, input bit[7:0] data2, shortint data3=0);
    this.data1 = data1;
    this.data2 = data2;
    this.data3 = data3;
  endfunction
  
endclass

module tb;
  
  first f1;
  
  initial begin //followed by position approach
    f1=new(23,4,35); //the value of datain -if no value is added its default value mentioned 
    $display("Value of data1: %0d::Value of data2: %0d ::Value of data3: %0d",f1.data1,f1.data2,f1.data3);
  end
  
endmodule
