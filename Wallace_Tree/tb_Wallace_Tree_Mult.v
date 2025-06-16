`timescale 1ns / 1ps

module tb_Wallace_Tree_Mult();

    // Inputs
    reg clk, rst;
    reg signed [15:0] A, B;

    // Outputs
    wire signed [31:0] C;

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 10ns clock period

    // Instantiate the DUT
    Wallace_Tree_Mult uut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .C(C)
    );

    // Task to perform and check a multiplication
    task run_test;
        input signed [15:0] a, b;
        reg signed [31:0] expected;
        begin
            @(negedge clk);
            A = a;
            B = b;
            expected = a * b;

            // Wait for latency (6 stages = 6 cycles)
            repeat (6) @(posedge clk);

            // Check result
            if (C === expected)
                $display("PASS: %0d * %0d = %0d", a, b, C);
            else
                $display("FAIL: %0d * %0d = %0d (Expected: %0d)", a, b, C, expected);
        end
    endtask

    initial begin
        A = 0; B = 0; rst = 1;
        #20;      // reset pulse
        rst = 0;

        $display("\n--- Wallace Tree Multiplier Testbench ---\n");

        run_test(7, 3);           // 21
        run_test(-5, 4);          // -20
        run_test(-8, -6);         // 48
        run_test(15, 0);          // 0
        run_test(0, -25);         // 0
        run_test(-1, 32767);      // -32767
        run_test(32767, 1);       // 32767
        run_test(-32768, 1);      // -32768

        $display("\n--- Testbench Finished ---\n");
        $finish;
    end

endmodule
