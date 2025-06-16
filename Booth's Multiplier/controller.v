`timescale 1ns / 1ps

module controller (
  input clk, rst, start, q0, qm1, cntdone,
  output ldA, ldQ, ldM, sftA, sftQ, clrA, clrQ, clrff,
  output ldcount, decr, addsub,
  output done
);

  parameter s0=0, s1=1, s2=2, s3=3, s4=4, s5=5, s6=6;
  reg [2:0] pstate, nstate;

  // Sequential state transition
  always @(posedge clk or posedge rst) begin
    if (rst)
      pstate <= s0;
    else
      pstate <= nstate;
  end

  // Combinational next state logic
  always @(*) begin
    case(pstate)
      s0: nstate = start ? s1 : s0;
      s1: nstate = s2;
      s2: begin
        if ({q0, qm1} == 2'b01)
          nstate = s3;
        else if ({q0, qm1} == 2'b10)
          nstate = s4;
        else
          nstate = s5;
      end
      s3: nstate = s5;
      s4: nstate = s5;
      s5: begin
        if (cntdone)
          nstate = s6;
        else if ({q0, qm1} == 2'b01)
          nstate = s3;
        else if ({q0, qm1} == 2'b10)
          nstate = s4;
        else
          nstate = s5;
      end
      s6: nstate = start ? s6 : s0;
      default: nstate = s0;
    endcase
  end

  // Output logic
  assign ldA     = (nstate == s3 || nstate == s4);
  assign ldQ     = (nstate == s2);
  assign ldM     = (nstate == s1);
  assign sftA    = (nstate == s5);
  assign sftQ    = (nstate == s5);
  assign clrA    = (nstate == s0);
  assign clrQ    = (nstate == s0);
  assign clrff   = (nstate == s0);
  assign ldcount = (nstate == s1);
  assign decr    = (nstate == s5);
  assign addsub  = (nstate == s3);  // Only for subtraction (s4 means addition)
  assign done = (nstate == s6)?1:0;


endmodule
