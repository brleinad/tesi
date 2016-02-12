
module generator ( i, c );
  input [6:0] i;
  output [14:0] c;
  wire   N2, n1, n2, n3, n4, n5, n6, n7;
  assign c[6] = i[6];
  assign c[5] = i[5];
  assign c[4] = i[4];
  assign c[3] = i[3];
  assign c[2] = i[2];
  assign c[1] = i[1];
  assign c[0] = i[0];

  CKXOR2D1 __tmp102_2 ( .A1(N2), .A2(c[5]), .Z(c[9]) );
  CKXOR2D1 __tmp102_1 ( .A1(c[2]), .A2(c[3]), .Z(N2) );
  CKXOR2D1 U1 ( .A1(c[3]), .A2(c[4]), .Z(n4) );
  CKXOR2D1 U2 ( .A1(c[6]), .A2(n4), .Z(c[10]) );
  CKXOR2D1 U3 ( .A1(c[1]), .A2(c[4]), .Z(n3) );
  CKXOR2D1 U4 ( .A1(c[2]), .A2(n3), .Z(c[8]) );
  CKXOR2D1 U5 ( .A1(c[0]), .A2(c[1]), .Z(n2) );
  CKXOR2D1 U6 ( .A1(n7), .A2(n4), .Z(c[11]) );
  CKXOR2D1 U7 ( .A1(c[5]), .A2(n2), .Z(n7) );
  CKXOR2D1 U8 ( .A1(c[3]), .A2(n2), .Z(c[7]) );
  CKXOR2D1 U9 ( .A1(c[2]), .A2(c[6]), .Z(n1) );
  CKXOR2D1 U10 ( .A1(c[0]), .A2(n1), .Z(c[14]) );
  CKXOR2D1 U11 ( .A1(n6), .A2(n2), .Z(c[13]) );
  CKXOR2D1 U12 ( .A1(c[5]), .A2(n1), .Z(n6) );
  CKXOR2D1 U13 ( .A1(n5), .A2(n3), .Z(c[12]) );
  CKXOR2D1 U14 ( .A1(c[5]), .A2(n1), .Z(n5) );
endmodule

