`timescale 1ns / 1ps

module CSA(
    input  signed [31:0] A, 
    input  signed [31:0] B,  
    input  signed [31:0] C,

    output signed [31:0] SUM,
    output signed [31:0] CARRY
);

    wire signed [31:0] temp_sum;

    assign temp_sum = A + B + C;
    assign SUM = temp_sum;
    assign CARRY = 32'sd0;  // No need for carry in CSA, it's reduced in CLA at the end

endmodule