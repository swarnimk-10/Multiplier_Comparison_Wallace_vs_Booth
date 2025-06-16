`timescale 1ns / 1ps

module tb_booth_multiplier;

  // Inputs
  reg clk, rst, start;
  reg signed [15:0] multiplicand, multiplier;

  // Outputs
  wire signed [31:0] result;
  wire done;

  // Instantiate the DUT
  top uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .multiplicand(multiplicand),
    .multiplier(multiplier),
    .result(result),
    .done(done)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 ns clock
  end

  // Task for one multiplication
  task run_test(input signed [15:0] a, input signed [15:0] b);
    begin
      // Reset system
      rst = 1;
      start = 0;
      multiplicand = 0;
      multiplier = 0;
      repeat (2) @(posedge clk);
      rst = 0;
      @(posedge clk);

      // Load inputs
      multiplicand = a;
      multiplier = b;
      start = 1;
      @(posedge clk);
      start = 0;

      // Wait for done pulse
      wait (done == 1);
      @(posedge clk); // Wait one more clock for stable result

      $display("%t: %0d * %0d = %0d", $time, a, b, result);

      // Wait a few clocks before next run
      repeat (2) @(posedge clk);
    end
  endtask

  initial begin
    $display("Starting Booth Multiplier Testbench\n");

    run_test(7, 3);           // 21
    run_test(-5, 4);          // -20
    run_test(-8, -6);         // 48
    run_test(15, 0);          // 0
    run_test(0, -25);         // 0
    run_test(-1, 32767);      // -32767
    run_test(32767, 14);       // 32767
    run_test(-32767, 14);
    run_test(-32768, 5);      // -32768
    run_test(5, -32768);
    $display("\nAll test cases completed.");
    $finish;
  end

endmodule
