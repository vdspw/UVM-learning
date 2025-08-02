// fork join HW - execute tasks in parallel.
//Create two tasks each capable of sending a message to Console at a fixed interval. Assume Task1 sends the message "Task 1 Trigger" at an interval of 20 ns while Task2 sends the message "Task 2 Trigger" at
//an interval of 40 ns. Keep the count of the number of times Task 1 and Task 2 trigger by adding a variable for keeping the track of task execution and incrementing with each trigger.
//Execute both tasks in parallel till 200 nsec. Display the number of times Task 1 and Task 2 executed after 200 ns before calling $finish for stopping the simulation.
module tb;
  
  int task1_counter=0;
  int task2_counter=0;
  
  task Task1();
    while($time <200)begin
    $display("Task 1 Trigger at %0t", $time);
    task1_counter = task1_counter + 1;
    #20;
    end
  endtask
  
  task Task2();
    while($time <200) begin
    $display("Task 2 Trigger at %0t", $time);
      task2_counter = task2_counter + 1;
    #40;
    end
  endtask
  
  
  
  initial begin
    fork
      Task1();
      Task2();
    join
    $display("Task1_counter : %0d", task1_counter);
    $display("Task2_counter : %0d ", task2_counter);
    #200;
    $finish();
    
  end
  
endmodule
