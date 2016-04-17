/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-2
// Date      : Wed Apr 13 14:13:13 2016
/////////////////////////////////////////////////////////////


module gen_cla_decomposed ( a, b, s );
  input [15:0] a;
  input [15:0] b;
  output [15:0] s;

  tri   [15:0] a;
  tri   [15:0] b;
  tri   [15:0] s;
  tri   [131052:0] n;

  gen_nonlinear_part NLIN ( .a(a), .b(b), .n(n) );
  gen_linear_part LIN ( .a(a), .b(b), .n(n), .s(s) );
endmodule

