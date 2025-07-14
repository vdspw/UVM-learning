module tb;
  
  function bit[4:0] add(input bit[3:0] a,b);
    return a+b;
  endfunction
  
  bit[4:0] result = 0;
  initial begin
    result = add(4'b0100,4'b0011);
    $display("Value of addition : %0d", result);
  end
  
endmodule
