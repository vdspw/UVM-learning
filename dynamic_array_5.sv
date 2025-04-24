module dynamic_array_2;

int arr[];

initial begin
  arr =  new[7];
  
  for(int i=0;i<7;i++)begin
    arr[i] =7 *(i+1);
  end
  
  //$display("arr: %0p",arr);
  #20;    //update the array after 20ns
  arr = new[20](arr); //automatically adds the previous elements.
  for(int i=7;i<20;i++)begin
    arr[i] =5 *(i+1)-35;
    
  end
  $display("arr: %0p",arr);
  
end

endmodule
