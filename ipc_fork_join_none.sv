// fork join 2
module tb;
  
  task first();
    $display("The first task started at %0t", $time);
    #20;
    $display("The first task completed at %0t", $time);
  endtask
  
  task second();
    $display("The second task started at %0t", $time);
    #30;
    $display("The second task completed at %0t", $time);
  endtask
  
  task third();
    $display("Reached next to join at %0t", $time);
  endtask
  
  initial begin
    fork
      first();
      second();
    join_none
    
    third();
  end
  
endmodule
