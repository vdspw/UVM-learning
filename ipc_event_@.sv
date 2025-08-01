// Event trigger operator : ->
// sense an event : @() edge sensitive blocking ; level sensitive non-blocking wait ().

module tb;
  
  event a;
  
  initial begin
    #10;
    -> a ; // triggering the event "a" after 10 ns
    
  end
  
  initial begin
    @(a);
    $display(" Recived Event at %0t ", $time);
    
  end
  
endmodule
