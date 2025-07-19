// Copying the data members (custom copy)

class first;
  int data = 34;
  bit[7:0]temp = 8'h1;
  
  function first copy();
    copy =  new();
    copy.data = data;
    copy.temp = temp;
  endfunction
  
endclass

module tb;
  first f1;
  first f2; //copy
  
  initial begin
    f1 = new();
    f2 = new();
    f2 = f1.copy;
    $display("DATA:%0d",f2.data);
    $display("TEMP:%0x",f2.temp);
  end
  
  
 /* initial begin
    f1 =  new();
    f1.data = 45;
    f2 = new f1;
    $display("%0d",f2.data);
    f2.data = 55;
    $display("%0d",f2.data);
    $display("%0d",f1.data);
  end*/
  
endmodule
