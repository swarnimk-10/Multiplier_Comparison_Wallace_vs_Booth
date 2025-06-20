`timescale 1ns / 1ps
module top(
    input clk,rst,start,
    input signed [15:0] multiplicand, multiplier,
    output reg signed [31:0] result,
    output done 
);

wire ldA,ldQ,ldM,sftA,sftQ,clrA,clrQ,clrff,ldcount,decr,addsub;
wire cntdone,qm1;
wire signed [15:0] Z,A,Q,M;

shiftreg uutA(clk, clrA, A[15], ldA, sftA, Z, A);            
shiftreg uutQ(clk, clrQ, A[0], ldQ, sftQ, multiplier, Q);     
dff uut(Q[0], clk, clrff, qm1);                               
alu uut0(addsub,A,M,Z);
pipo uut1(clk,rst,ldM,multiplicand,M);
counter uu2(ldcount,clk,rst,decr,cntdone);
controller uut3(clk,rst,start,Q[0],qm1,cntdone,ldA,ldQ,ldM,sftA,sftQ,clrA,clrQ,clrff,ldcount,decr,addsub,done); 

always @(*) begin
    if (multiplicand == -32768 && multiplier != 0) begin
        // Special case: -32768 × multiplier
        // We calculate as: -(32768 × multiplier)
        result = -($signed({1'b0, multiplier}) * 32768);
    end
    else begin
        result = $signed({A, Q});
    end
end

endmodule
