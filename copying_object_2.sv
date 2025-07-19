// Copying the data members (custom copy)

class first;
  int data = 34;
  bit[7:0]temp = 8'h1;
  
  
endclass

module tb;
  first f1;
  first f2; //copy
  
  initial begin
    f1 =  new();
    f1.data = 45;
    f2 = new f1;
    $display("%0d",f2.data);
    f2.data = 55;
    $display("%0d",f2.data);
    $display("%0d",f1.data);
  end
endmodule
