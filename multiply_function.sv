module tb;
  
  reg[15:0] result=0;
  reg[4:0] ain = 4'b0100;
  reg[4:0] bin = 4'b0011;
  reg[15:0] normal;
  
  function bit[15:0] mul();
    return ain*bin;
    
    
  endfunction
  
    
  initial begin
    normal = ain*bin;
    result = mul();
    $display("Value of mul : %0d", normal);
    $display("Value of mul : %0d", result);
    if (result == normal) $display("TEST PASSED");
    else $display ("TEST FAILED");
  end
  
endmodule
