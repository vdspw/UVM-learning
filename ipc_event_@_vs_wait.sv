// Event trigger operator : ->
// sense an event : @() edge sensitive blocking ; level sensitive non-blocking wait ().

module tb;
  
  event a1;
  event a2;
  
  initial begin 
    -> a1;
    //#10;
    -> a2;
  end
  
  initial begin
    wait(a1.triggered);  //blocking case - @(a1)
    $display(" Event a1 triggerred at %0t", $time);
    wait(a2.triggered);
    $display("Event a2 triggered at %0t", $time);
  end
  
  
endmodule
