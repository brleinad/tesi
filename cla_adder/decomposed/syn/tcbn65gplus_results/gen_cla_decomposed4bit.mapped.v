/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Wed Apr 13 11:14:49 2016
/////////////////////////////////////////////////////////////


module gen_nonlinear_part ( a, b, n );
  input [3:0] a;
  input [3:0] b;
  output [24:0] n;

  assign n[1] = 1'b0;
  assign n[2] = 1'b0;
  assign n[5] = 1'b0;
  assign n[6] = 1'b0;
  assign n[8] = 1'b0;
  assign n[9] = 1'b0;
  assign n[13] = 1'b0;
  assign n[14] = 1'b0;
  assign n[16] = 1'b0;
  assign n[17] = 1'b0;
  assign n[20] = 1'b0;
  assign n[21] = 1'b0;
  assign n[23] = 1'b0;
  assign n[24] = 1'b0;

  AN2D0 U2 ( .A1(b[2]), .A2(n[7]), .Z(n[22]) );
  AN2D0 U3 ( .A1(n[4]), .A2(b[2]), .Z(n[19]) );
  AN2D0 U4 ( .A1(n[3]), .A2(b[2]), .Z(n[18]) );
  AN2D0 U5 ( .A1(a[2]), .A2(n[7]), .Z(n[15]) );
  AN2D0 U6 ( .A1(n[0]), .A2(b[1]), .Z(n[7]) );
  AN2D0 U7 ( .A1(a[2]), .A2(n[4]), .Z(n[12]) );
  AN2D0 U8 ( .A1(n[0]), .A2(a[1]), .Z(n[4]) );
  AN2D0 U9 ( .A1(a[2]), .A2(n[3]), .Z(n[11]) );
  AN2D0 U10 ( .A1(b[1]), .A2(a[1]), .Z(n[3]) );
  AN2D0 U11 ( .A1(a[2]), .A2(b[2]), .Z(n[10]) );
  AN2D0 U12 ( .A1(b[0]), .A2(a[0]), .Z(n[0]) );
endmodule


module gen_linear_part ( a, b, n, s );
  input [3:0] a;
  input [3:0] b;
  input [24:0] n;
  output [3:0] s;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  XOR4D0 U1 ( .A1(b[3]), .A2(a[3]), .A3(n1), .A4(n2), .Z(s[3]) );
  XOR3D0 U2 ( .A1(n[20]), .A2(n[19]), .A3(n3), .Z(n2) );
  XOR3D0 U3 ( .A1(n4), .A2(n5), .A3(n[18]), .Z(n3) );
  XOR4D0 U4 ( .A1(n[11]), .A2(n[10]), .A3(n[13]), .A4(n[12]), .Z(n5) );
  XOR4D0 U5 ( .A1(n[15]), .A2(n[14]), .A3(n[17]), .A4(n[16]), .Z(n4) );
  XOR4D0 U6 ( .A1(n[22]), .A2(n[21]), .A3(n[24]), .A4(n[23]), .Z(n1) );
  XOR3D0 U7 ( .A1(n6), .A2(n7), .A3(n[9]), .Z(s[2]) );
  XOR4D0 U8 ( .A1(b[2]), .A2(a[2]), .A3(n[4]), .A4(n[3]), .Z(n7) );
  XOR4D0 U9 ( .A1(n[6]), .A2(n[5]), .A3(n[8]), .A4(n[7]), .Z(n6) );
  XOR3D0 U10 ( .A1(b[1]), .A2(a[1]), .A3(n8), .Z(s[1]) );
  XOR3D0 U11 ( .A1(n[2]), .A2(n[1]), .A3(n[0]), .Z(n8) );
  XOR2D0 U12 ( .A1(b[0]), .A2(a[0]), .Z(s[0]) );
endmodule


module gen_cla_decomposed ( a, b, s );
  input [3:0] a;
  input [3:0] b;
  output [3:0] s;

  wire   [24:0] n;

  gen_nonlinear_part NLIN ( .a(a), .b(b), .n(n) );
  gen_linear_part LIN ( .a(a), .b(b), .n({1'b0, 1'b0, n[22], 1'b0, 1'b0, 
        n[19:18], 1'b0, 1'b0, n[15], 1'b0, 1'b0, n[12:10], 1'b0, 1'b0, n[7], 
        1'b0, 1'b0, n[4:3], 1'b0, 1'b0, n[0]}), .s(s) );
endmodule

