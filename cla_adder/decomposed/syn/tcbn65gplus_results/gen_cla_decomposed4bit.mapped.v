
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


module gen_nonlinear_part ( a, b, n );
  input [3:0] a;
  input [3:0] b;
  output [24:0] n;


  INVD0 U2 ( .I(1'b1), .ZN(n[1]) );
  INVD0 U4 ( .I(1'b1), .ZN(n[2]) );
  INVD0 U6 ( .I(1'b1), .ZN(n[5]) );
  INVD0 U8 ( .I(1'b1), .ZN(n[6]) );
  INVD0 U10 ( .I(1'b1), .ZN(n[8]) );
  INVD0 U12 ( .I(1'b1), .ZN(n[9]) );
  INVD0 U15 ( .I(1'b1), .ZN(n[13]) );
  INVD0 U17 ( .I(1'b1), .ZN(n[14]) );
  INVD0 U19 ( .I(1'b1), .ZN(n[16]) );
  INVD0 U21 ( .I(1'b1), .ZN(n[17]) );
  INVD0 U23 ( .I(1'b1), .ZN(n[20]) );
  INVD0 U25 ( .I(1'b1), .ZN(n[21]) );
  INVD0 U27 ( .I(1'b1), .ZN(n[23]) );
  INVD0 U29 ( .I(1'b1), .ZN(n[24]) );
  AN2D0 U31 ( .A1(b[2]), .A2(n[7]), .Z(n[22]) );
  AN2D0 U32 ( .A1(n[4]), .A2(b[2]), .Z(n[19]) );
  AN2D0 U33 ( .A1(n[3]), .A2(b[2]), .Z(n[18]) );
  AN2D0 U34 ( .A1(a[2]), .A2(n[7]), .Z(n[15]) );
  AN2D0 U35 ( .A1(n[0]), .A2(b[1]), .Z(n[7]) );
  AN2D0 U36 ( .A1(a[2]), .A2(n[4]), .Z(n[12]) );
  AN2D0 U37 ( .A1(n[0]), .A2(a[1]), .Z(n[4]) );
  AN2D0 U38 ( .A1(a[2]), .A2(n[3]), .Z(n[11]) );
  AN2D0 U39 ( .A1(b[1]), .A2(a[1]), .Z(n[3]) );
  AN2D0 U40 ( .A1(a[2]), .A2(b[2]), .Z(n[10]) );
  AN2D0 U41 ( .A1(b[0]), .A2(a[0]), .Z(n[0]) );
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

