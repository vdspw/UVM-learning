// SEMAPHORE
class first;
  
  rand int data;
  
  constraint data_c {data < 10; data > 0;}
 
endclass
 
 
 
class second;
  
  rand int data;
  
  constraint data_c {data > 10; data < 20;}
  
endclass
 
 
class main;
  
  semaphore sem;  // create an instant of semaphore.
  
  first f;			//instances or handlers of the classes.
  second s;
  
   int data;
   int i = 0;
  
  
  task send_first();
    
    sem.get(1);		//engaging the semaphore
    
    for(i = 0; i<10; i++) begin
      f.randomize();
      data = f.data;
      $display("First access Semaphore and Data sent : %0d", f.data);
      #10;
    end 
    
    
    sem.put(1);		//disengaing the semaphore
    
    $display("Semaphore Unoccupied");
  endtask
  
  
  task send_second();
    sem.get(1); 		// semaphore engageing
    
    for(i = 0; i<10; i++) begin   
      s.randomize();
      data = s.data;
      $display("Second access Semaphore and Data sent : %0d", s.data);
      #10;
    end  
    
    sem.put(1);			//disengaging
    $display("Semaphore Unoccupied");
    
  endtask
  
  
  
  task run();
    sem = new(1); //construcotr of the semaphore to use it.
    f = new();
    s = new();
  
   fork
     send_first();
     
     send_second();
   join
      
  endtask
  
  
endclass
 
module tb;
  
  main m; //class instance
  
  initial begin
    m = new(); // constructor
    m.run(); 
  end
  
  initial begin
    #250;
    $finish();
  end
  
endmodule
