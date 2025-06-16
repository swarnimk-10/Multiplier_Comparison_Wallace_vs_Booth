`timescale 1ns / 1ps

module counter(
    input ldcount, clk, rst, decr,
    output reg cntdone
    );
reg [4:0] count;
always@(posedge clk)begin
    if(rst)
        count <= 0;
    else if(ldcount)
        count <= 16;
    else if (decr) begin
        if (count == 1)
            cntdone <= 1;
        else
            cntdone <= 0;
        count <= count - 1;
    end
end
endmodule
