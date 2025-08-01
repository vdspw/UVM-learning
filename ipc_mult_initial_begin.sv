module tb;
  
  int data1,data2;
  int i = 0;
  event done;
  
  initial begin //generate the value
    for(i=0; i<10;i++) begin
      data1 = $urandom();
      $display( " Data Transmitted : %0d ", data1);
      #10;
    end
    -> done; // trigger this after generation
  end
  
  initial begin //recive the values
    forever begin
      #10;
      data2 = data1; //taking out data1 from data2
      $display( " Data Recived : %0d ", data2);
    end
  end
  
  initial begin //control the simulation
    wait(done.triggered);
    $finish();
  end
endmodule
