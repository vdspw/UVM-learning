// copying an object

class first;
  int data;
  
  
endclass



module tb;
  
  first f1; //org data
  first p1; //cp of org data
  
  initial begin
    f1 = new();	//construcotr of org class
    f1.data = 24; //processing
    
    p1 = new f1; //creating a copy of the class
    $display("The data is : %0d",p1.data);
    p1.data = 12;
    $display("The data is : %0d",f1.data); // org is unchanged
  end
  
endmodule
