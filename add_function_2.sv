module tb;
  
  function bit[4:0] add(input bit[3:0] a,b);
    return a+b;
  endfunction
  
  bit[4:0] result = 0;
  bit[4:0] ain = 4'b0100;
  bit[4:0] bin = 4'b0011;
  
  initial begin
    result = add(ain,bin);
    $display("Value of addition : %0d", result);
  end
  
endmodule
