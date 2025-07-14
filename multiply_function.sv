module tb;
  
  reg[15:0] result=0;
  reg[4:0] ain = 4'b0100;
  reg[4:0] bin = 4'b0011;
  
  function bit[15:0] mul();
    return ain*bin;
  endfunction
  
    
  initial begin
    result = mul();
    
    $display("Value of addition : %0d", result);
    if (result == 12) $display("TEST PASSED");
    else $display ("TEST FAILED");
  end
  
endmodule
