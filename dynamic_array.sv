// Code your testbench here
// or browse Examples
module tb;
  
  int arr[];
  
  initial begin
    arr = new[5];
    for(int i=0; i<5;i++) begin
      arr[i] = 5*i;
      
    end
    $display(" The elements in the array : %0p",arr);
    
    arr.delete();
  end
  
  
endmodule
