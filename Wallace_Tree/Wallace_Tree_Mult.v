`timescale 1ns / 1ps

module Wallace_Tree_Mult(
    input clk,
    input rst,
    input signed [15:0] A,
    input signed [15:0] B,
    output reg signed [31:0] C,
    output reg              carry
);

    // Partial Products
    wire signed [31:0] pp [15:0];
    PP pp_gen(
        .A(A), .B(B),
        .PP0(pp[0]), .PP1(pp[1]), .PP2(pp[2]), .PP3(pp[3]),
        .PP4(pp[4]), .PP5(pp[5]), .PP6(pp[6]), .PP7(pp[7]),
        .PP8(pp[8]), .PP9(pp[9]), .PP10(pp[10]), .PP11(pp[11]),
        .PP12(pp[12]), .PP13(pp[13]), .PP14(pp[14]), .PP15(pp[15])
    );

    // Stage 1 CSA: reduce 16 -> 6
    wire signed [31:0] s1 [4:0], c1 [4:0];
    wire signed [31:0] s1_last, c1_last;

    CSA csa1_0(pp[0], pp[1], pp[2], s1[0], c1[0]);
    CSA csa1_1(pp[3], pp[4], pp[5], s1[1], c1[1]);
    CSA csa1_2(pp[6], pp[7], pp[8], s1[2], c1[2]);
    CSA csa1_3(pp[9], pp[10], pp[11], s1[3], c1[3]);
    CSA csa1_4(pp[12], pp[13], pp[14], s1[4], c1[4]);

    assign s1_last = pp[15];
    assign c1_last = 32'sd0;

    // Registers between Stage 1 and 2
    reg signed [31:0] s2 [5:0], c2 [5:0];
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            s2[0]<=0; c2[0]<=0; s2[1]<=0; c2[1]<=0; s2[2]<=0; c2[2]<=0;
            s2[3]<=0; c2[3]<=0; s2[4]<=0; c2[4]<=0; s2[5]<=0; c2[5]<=0;
        end else begin
            s2[0] <= s1[0]; c2[0] <= c1[0];
            s2[1] <= s1[1]; c2[1] <= c1[1];
            s2[2] <= s1[2]; c2[2] <= c1[2];
            s2[3] <= s1[3]; c2[3] <= c1[3];
            s2[4] <= s1[4]; c2[4] <= c1[4];
            s2[5] <= s1_last; c2[5] <= c1_last;
        end
    end

    // Stage 2 CSA: reduce 6 -> 4
    wire signed [31:0] s3 [1:0], c3 [1:0], s3_last, c3_last;

    CSA csa2_0(s2[0], s2[1], s2[2], s3[0], c3[0]);
    CSA csa2_1(c2[0], c2[1], c2[2], s3[1], c3[1]);
    CSA csa2_2(s2[3], c2[3], s2[4], s3_last, c3_last);

    // Register stage
    reg signed [31:0] s4 [2:0], c4 [2:0];
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            s4[0]<=0; c4[0]<=0; s4[1]<=0; c4[1]<=0; s4[2]<=0; c4[2]<=0;
        end else begin
            s4[0] <= s3[0]; c4[0] <= c3[0];
            s4[1] <= s3[1]; c4[1] <= c3[1];
            s4[2] <= s3_last + c3_last + s2[5] + c2[4] + c2[5];
        end
    end

    // Final CSA: reduce 3 -> 2
    wire signed [31:0] sum_final, carry_final;
    CSA final_csa(s4[0], c4[0], s4[2], sum_final, carry_final);

    // Final CLA
    wire signed [31:0] result;
    wire cout;
    CLA final_cla(
        .A(sum_final),
        .B(carry_final),
        .CIN(1'b0),
        .SUM(result),
        .COUT(cout)
    );

    // Output register
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            C <= 0;
            carry <= 0;
        end else begin
            C <= result;
            carry <= cout;
        end
    end

endmodule
