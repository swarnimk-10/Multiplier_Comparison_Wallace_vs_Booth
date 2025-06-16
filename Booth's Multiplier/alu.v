`timescale 1ns / 1ps

module alu(
    input addsub,
    input signed [15:0] A,
    input signed [15:0] M,
    output reg signed [15:0] Z
    );
always@(*)begin
    if(addsub)
        Z<=A+M;
    else if(!addsub)
        Z<=A-M;
end
endmodule
