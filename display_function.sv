module tb;
  
  bit[4:0] result = 0;
  bit[4:0] ain = 4'b0100;
  bit[4:0] bin = 4'b0011;
  
  function bit[4:0] add();
    return ain+bin;
  endfunction
  
  function display_ain_bin();
    $display("Value of ain : %0d, Value of bin: %0d",ain,bin);
  endfunction
  
 
  
  initial begin
   // result = add();
    display_ain_bin();
   // $display("Value of addition : %0d", result);
  end
  
endmodule
