`timescale 1ns / 1ps

module shiftreg(
    input clk, rst, in, ld, sft,
    input signed [15:0] data_in,
    output reg signed [15:0] data_out
);
always @(posedge clk) begin
    if (rst)
        data_out <= 0;
    else if (ld)
        data_out <= data_in;
    else if (sft)
        data_out <= {in, data_out[15:1]}; // arithmetic shift
end
endmodule
