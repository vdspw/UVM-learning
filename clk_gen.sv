`include "test.sv"

module tb;

  // Signal declaration
  reg clk = 0;

  // Parameters for waveform generation
  real period = 50.0;       // Period in nanoseconds
  real duty_cycle = 0.6;    // Duty cycle (60%)
  real high_time, low_time;  /// high and low time

  ///////////User code for clock generation starts here 
  task get_high_low_times(input real period, input real duty_cycle, output real high_time, output real low_time);
    high_time = period * duty_cycle;   // High time based on duty cycle
    low_time = period * (1 - duty_cycle);  // Low time based on remaining period
  endtask
  
   // Clock generation using high and low times
  initial begin
    // Get the high and low times based on period and duty cycle
    get_high_low_times(period, duty_cycle, high_time, low_time);
    
 
      // Generate clock based on high and low times
      forever begin
        clk = 1;
        #(high_time);
        clk = 0;
        #(low_time);
      end
    
  end
  

  
  ///////////User code ends here
  
  real generated_value;
  test t1 = new();
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    // Calculate a value based on high and low times and send it for evaluation
    #55;
    generated_value = clk;  // Add the high and low times for evaluation
    t1.no_gen(generated_value);  // Pass the generated value to the test class
    t1.display();
    #50;   
    $stop;
  end
  
endmodule

class test;
  real temp = 0;  // Holds the "magic number"
  
  // Task to display the result
  task display();
    $display("---------------------------");
    $display("magic_no = %0d", $rtoi(this.temp));
    $display("---------------------------");
  endtask
  
  // Task to generate the magic number based on the calculated value
  task no_gen(input real value);
    // The magic number will be calculated as twice the value of high + low times
    this.temp = value * 7*3;  // Multiply the total time by 2 for evaluation
  endtask
  
endclass
