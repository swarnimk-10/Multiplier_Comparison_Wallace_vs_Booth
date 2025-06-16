module PP(
    input  signed [15:0] A,
    input  signed [15:0] B,

    output signed [31:0] PP0,
    output signed [31:0] PP1,
    output signed [31:0] PP2,
    output signed [31:0] PP3,
    output signed [31:0] PP4,
    output signed [31:0] PP5,
    output signed [31:0] PP6,
    output signed [31:0] PP7,
    output signed [31:0] PP8,
    output signed [31:0] PP9,
    output signed [31:0] PP10,
    output signed [31:0] PP11,
    output signed [31:0] PP12,
    output signed [31:0] PP13,
    output signed [31:0] PP14,
    output signed [31:0] PP15
);

    wire signed [31:0] extB = B;

    assign PP0  = A[0]  ? (extB <<< 0)  : 32'sd0;
    assign PP1  = A[1]  ? (extB <<< 1)  : 32'sd0;
    assign PP2  = A[2]  ? (extB <<< 2)  : 32'sd0;
    assign PP3  = A[3]  ? (extB <<< 3)  : 32'sd0;
    assign PP4  = A[4]  ? (extB <<< 4)  : 32'sd0;
    assign PP5  = A[5]  ? (extB <<< 5)  : 32'sd0;
    assign PP6  = A[6]  ? (extB <<< 6)  : 32'sd0;
    assign PP7  = A[7]  ? (extB <<< 7)  : 32'sd0;
    assign PP8  = A[8]  ? (extB <<< 8)  : 32'sd0;
    assign PP9  = A[9]  ? (extB <<< 9)  : 32'sd0;
    assign PP10 = A[10] ? (extB <<< 10) : 32'sd0;
    assign PP11 = A[11] ? (extB <<< 11) : 32'sd0;
    assign PP12 = A[12] ? (extB <<< 12) : 32'sd0;
    assign PP13 = A[13] ? (extB <<< 13) : 32'sd0;
    assign PP14 = A[14] ? (extB <<< 14) : 32'sd0;

    // Corrected PP15: negative MSB handling for signed multiplication
    assign PP15 = A[15] ? (~(extB <<< 15) + 1) : 32'sd0;

endmodule
