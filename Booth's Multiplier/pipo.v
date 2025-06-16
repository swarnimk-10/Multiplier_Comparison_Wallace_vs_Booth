`timescale 1ns / 1ps


module pipo(
    input clk,rst,ld,
    input signed [15:0]data_in,
    output reg signed [15:0]data_out
    );
always@(posedge clk)begin
    if(rst)
        data_out<=0;
    else if(ld)
        data_out<=data_in;
end
endmodule
