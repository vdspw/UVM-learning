module random_value_arr;
  
  reg arr1[15];
  reg arr2[15];
  
  //populate the arrays 
  initial begin
  for(int i=0; i<15;i++)begin
    arr1[i] = $urandom;
    arr2[i] = $urandom;
  end
    
    
    $display("values of arr1 : %0p",arr1);
    $display("values of arr2 : %0p",arr2);
  
  
  
  end
endmodule
