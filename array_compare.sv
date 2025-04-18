// Code your testbench here
// or browse Examples
module tb;
  int arr1[5] = '{1,2,3,4,5};
  int arr2[5] = '{1,2,3,4,5};
  
  int status;
  
  initial begin
    status = (arr1==arr2);
    $display( " status is %d", status);
    
    
  end

  
  
  
  
endmodule
