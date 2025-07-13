class first;
  //adding two entries
  bit [2:0] data;  //2 state data type
  bit [1:0] data2; // 4 state data type
  
  reg[2:0] data3;
  reg[1:0] data4;
  
  
endclass

module tb;
  
  first f;
  initial begin
    f= new();
    #1;
    $display("Value of data: %0d and value of data2 : %0d ",f.data,f.data2);  // returns 0,0
    #1;
    $display("Value of data: %0d and value of data2 : %0d ",f.data3,f.data4); //returns x,x
  end
  
endmodule
