`timescale 1ns / 1ps

module CLA (
    input  signed [31:0] A,
    input  signed [31:0] B,
    input                CIN,
    output signed [31:0] SUM,
    output               COUT
);

    wire signed [32:0] temp;

    assign temp = A + B + CIN;  
    assign SUM = temp[31:0];
    assign COUT = temp[32];     

endmodule
