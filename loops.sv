// Code your testbench here
// or browse Examples
module tb;
  int arr [10]; // array of 10 elements
  int i =0;    // index variable of the array
  
 /* initial begin
    for(i=0;i<10;i++)
      begin
        arr[i] =i;
        
      end
    
    $display("arr: %0p", arr);
    
  end */
/* initial begin 
  foreach(arr[j]) begin
    arr[j] = j;
    $display(" %0d", arr[j]);
  
    
  end
 end */
  
 initial begin
   
   repeat(10) begin
     arr[i] = i;
     i++;
    end  
     $display("arr is %0p", arr);
        
  
   
   
   
 end
  
   
endmodule
