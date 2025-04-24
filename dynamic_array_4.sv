module tb;

  int arr[];
  int farr[30];

initial begin
  arr =  new[5];
  
  for(int i=0;i<5;i++)begin
    arr[i] =5 *1;
  end
  
  //$display("arr: %0p",arr);
  
  arr = new[30](arr); //automatically removes the previous elements.
  $display("arr: %0p",arr);
  farr = arr;		//copying the dynamic array elemts to a fixed array.
  $display("farr: %0p",farr);
  
end

endmodule
