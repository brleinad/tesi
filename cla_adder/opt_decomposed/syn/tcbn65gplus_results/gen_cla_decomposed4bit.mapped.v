/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Mon Apr 18 15:16:32 2016
/////////////////////////////////////////////////////////////


module gen_nonlinear_part ( a, b, n );
  input [3:0] a;
  input [3:0] b;
  output [10:0] n;


  AN2D0 U1 ( .A1(b[2]), .A2(n[2]), .Z(n[9]) );
  AN2D0 U2 ( .A1(n[1]), .A2(b[2]), .Z(n[8]) );
  AN2D0 U3 ( .A1(a[2]), .A2(n[3]), .Z(n[7]) );
  AN2D0 U4 ( .A1(a[2]), .A2(n[2]), .Z(n[6]) );
  AN2D0 U5 ( .A1(a[2]), .A2(n[1]), .Z(n[5]) );
  AN2D0 U6 ( .A1(a[2]), .A2(b[2]), .Z(n[4]) );
  AN2D0 U7 ( .A1(n[0]), .A2(a[1]), .Z(n[2]) );
  AN2D0 U8 ( .A1(a[1]), .A2(b[1]), .Z(n[1]) );
  AN2D0 U9 ( .A1(n[3]), .A2(b[2]), .Z(n[10]) );
  AN2D0 U10 ( .A1(n[0]), .A2(b[1]), .Z(n[3]) );
  AN2D0 U11 ( .A1(b[0]), .A2(a[0]), .Z(n[0]) );
endmodule


module gen_linear_part ( a, b, n, s );
  input [3:0] a;
  input [3:0] b;
  input [10:0] n;
  output [3:0] s;
  wire   n1, n2, n3;

  XOR3D0 U1 ( .A1(n1), .A2(n2), .A3(n[9]), .Z(s[3]) );
  XOR4D0 U2 ( .A1(b[3]), .A2(a[3]), .A3(n[4]), .A4(n[10]), .Z(n2) );
  XOR4D0 U3 ( .A1(n[6]), .A2(n[5]), .A3(n[8]), .A4(n[7]), .Z(n1) );
  XOR3D0 U4 ( .A1(b[2]), .A2(a[2]), .A3(n3), .Z(s[2]) );
  XOR3D0 U5 ( .A1(n[3]), .A2(n[2]), .A3(n[1]), .Z(n3) );
  XOR3D0 U6 ( .A1(n[0]), .A2(b[1]), .A3(a[1]), .Z(s[1]) );
  XOR2D0 U7 ( .A1(b[0]), .A2(a[0]), .Z(s[0]) );
endmodule


module gen_cla_decomposed ( a, b, s );
  input [3:0] a;
  input [3:0] b;
  output [3:0] s;

  wire   [10:0] n;

  gen_nonlinear_part NLIN ( .a(a), .b(b), .n(n) );
  gen_linear_part LIN ( .a(a), .b(b), .n(n), .s(s) );
endmodule

