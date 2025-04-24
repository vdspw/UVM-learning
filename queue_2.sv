module array_to_queue;

  // Step 1: Declare a fixed-size array
  int fixed_array[20];

  // Step 2: Declare a queue
  int queue_data[$];

  // Task to display fixed-size array
  task display_array;
    $display("Fixed-size Array:");
    foreach (fixed_array[i])
      $write("%0d ", fixed_array[i]);
    $display("\n");
  endtask

  // Task to display queue
  task display_queue;
    $display("Queue:");
    foreach (queue_data[i])
      $write("%0d ", queue_data[i]);
    $display("\n");
  endtask

  initial begin
    // Step 3: Fill the array with random values
    foreach (fixed_array[i])
      fixed_array[i] = $urandom % 100; // values between 0 and 99

    // Step 4: Add elements to the queue in reverse order
    for (int i = 19; i >= 0; i--)
      queue_data.push_back(fixed_array[i]);

    // Step 5: Display both array and queue
    display_array();
    display_queue();
  end

endmodule
