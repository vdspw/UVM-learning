class first;
  //adding two entries
  bit [2:0] data;
  bit [1:0] data2;
  
  reg[2:0] data3;
  reg[1:0] data4;
  
  
endclass

module tb;
  
  first f;
  initial begin
    f= new();
    f.data = 3'b010;
    f.data2 = 2'b10;
    #1;
    $display("Value of data: %0d and value of data2 : %0d ",f.data,f.data2);
    #1;
    $display("Value of data: %0d and value of data2 : %0d ",f.data3,f.data4);
    f =null ; //deallocating the memory similar to a desrtuctor
  end
  
endmodule
