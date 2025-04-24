module tb;
  int arr[$]; //this is queue
  int j =0;
  int g =5;
  
  initial begin
    arr = {1,2,3};
    $display("arr :%0p",arr);
    
    arr.push_front(7);			//adding elemts at the fron
    $display("arr :%0p",arr);
    
    arr.push_back(9);			//adding elements at the back of the queue
    $display("arr : %0p",arr);
    
    arr.insert(2,10); // adding 10 at index 2
    $display("arr : %0p",arr);
    
    j =arr.pop_front();
    $display("arr : %0p",arr);
    $display("Value of j : %0d",j);
    
    g =arr.pop_back();
    $display("arr : %0p",arr);
    $display("Value of g : %0d",g);
    
    arr.delete(1);
    $display("arr : %0p",arr);
  end
endmodule
