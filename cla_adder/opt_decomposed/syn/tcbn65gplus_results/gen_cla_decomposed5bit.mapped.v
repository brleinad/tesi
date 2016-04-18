/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Mon Apr 18 15:21:19 2016
/////////////////////////////////////////////////////////////


module gen_nonlinear_part ( a, b, n );
  input [4:0] a;
  input [4:0] b;
  output [25:0] n;


  AN2D0 U1 ( .A1(b[3]), .A2(n[10]), .Z(n[25]) );
  AN2D0 U2 ( .A1(n[9]), .A2(b[3]), .Z(n[24]) );
  AN2D0 U3 ( .A1(n[8]), .A2(b[3]), .Z(n[23]) );
  AN2D0 U4 ( .A1(n[7]), .A2(b[3]), .Z(n[22]) );
  AN2D0 U5 ( .A1(n[6]), .A2(b[3]), .Z(n[21]) );
  AN2D0 U6 ( .A1(n[5]), .A2(b[3]), .Z(n[20]) );
  AN2D0 U7 ( .A1(n[4]), .A2(b[3]), .Z(n[19]) );
  AN2D0 U8 ( .A1(a[3]), .A2(n[10]), .Z(n[18]) );
  AN2D0 U9 ( .A1(a[3]), .A2(n[9]), .Z(n[17]) );
  AN2D0 U10 ( .A1(n[2]), .A2(b[2]), .Z(n[9]) );
  AN2D0 U11 ( .A1(a[3]), .A2(n[8]), .Z(n[16]) );
  AN2D0 U12 ( .A1(b[2]), .A2(n[1]), .Z(n[8]) );
  AN2D0 U13 ( .A1(a[3]), .A2(n[7]), .Z(n[15]) );
  AN2D0 U14 ( .A1(n[3]), .A2(a[2]), .Z(n[7]) );
  AN2D0 U15 ( .A1(a[3]), .A2(n[6]), .Z(n[14]) );
  AN2D0 U16 ( .A1(n[2]), .A2(a[2]), .Z(n[6]) );
  AN2D0 U17 ( .A1(n[0]), .A2(a[1]), .Z(n[2]) );
  AN2D0 U18 ( .A1(a[3]), .A2(n[5]), .Z(n[13]) );
  AN2D0 U19 ( .A1(n[1]), .A2(a[2]), .Z(n[5]) );
  AN2D0 U20 ( .A1(a[1]), .A2(b[1]), .Z(n[1]) );
  AN2D0 U21 ( .A1(a[3]), .A2(n[4]), .Z(n[12]) );
  AN2D0 U22 ( .A1(b[2]), .A2(a[2]), .Z(n[4]) );
  AN2D0 U23 ( .A1(a[3]), .A2(b[3]), .Z(n[11]) );
  AN2D0 U24 ( .A1(b[2]), .A2(n[3]), .Z(n[10]) );
  AN2D0 U25 ( .A1(n[0]), .A2(b[1]), .Z(n[3]) );
  AN2D0 U26 ( .A1(b[0]), .A2(a[0]), .Z(n[0]) );
endmodule


module gen_linear_part ( a, b, n, s );
  input [4:0] a;
  input [4:0] b;
  input [25:0] n;
  output [4:0] s;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  XOR4D0 U1 ( .A1(b[4]), .A2(a[4]), .A3(n1), .A4(n2), .Z(s[4]) );
  XOR3D0 U2 ( .A1(n[21]), .A2(n[20]), .A3(n3), .Z(n2) );
  XOR3D0 U3 ( .A1(n4), .A2(n5), .A3(n[19]), .Z(n3) );
  XOR4D0 U4 ( .A1(n[12]), .A2(n[11]), .A3(n[14]), .A4(n[13]), .Z(n5) );
  XOR4D0 U5 ( .A1(n[16]), .A2(n[15]), .A3(n[18]), .A4(n[17]), .Z(n4) );
  XOR4D0 U6 ( .A1(n[23]), .A2(n[22]), .A3(n[25]), .A4(n[24]), .Z(n1) );
  XOR3D0 U7 ( .A1(n6), .A2(n7), .A3(n[9]), .Z(s[3]) );
  XOR4D0 U8 ( .A1(b[3]), .A2(a[3]), .A3(n[4]), .A4(n[10]), .Z(n7) );
  XOR4D0 U9 ( .A1(n[6]), .A2(n[5]), .A3(n[8]), .A4(n[7]), .Z(n6) );
  XOR3D0 U10 ( .A1(b[2]), .A2(a[2]), .A3(n8), .Z(s[2]) );
  XOR3D0 U11 ( .A1(n[3]), .A2(n[2]), .A3(n[1]), .Z(n8) );
  XOR3D0 U12 ( .A1(n[0]), .A2(b[1]), .A3(a[1]), .Z(s[1]) );
  XOR2D0 U13 ( .A1(b[0]), .A2(a[0]), .Z(s[0]) );
endmodule


module gen_cla_decomposed ( a, b, s );
  input [4:0] a;
  input [4:0] b;
  output [4:0] s;

  wire   [25:0] n;

  gen_nonlinear_part NLIN ( .a(a), .b(b), .n(n) );
  gen_linear_part LIN ( .a(a), .b(b), .n(n), .s(s) );
endmodule

