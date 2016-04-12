
module gen_linear_part ( a, b, n, s );
  input [4:0] a;
  input [4:0] b;
  input [55:0] n;
  output [4:0] s;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19;

  XOR4D0 U1 ( .A1(n1), .A2(n2), .A3(n3), .A4(n[50]), .Z(s[4]) );
  XOR3D0 U2 ( .A1(n[53]), .A2(n[52]), .A3(n[51]), .Z(n3) );
  XOR4D0 U3 ( .A1(a[4]), .A2(n4), .A3(n[47]), .A4(b[4]), .Z(n2) );
  XOR4D0 U4 ( .A1(n[42]), .A2(n[41]), .A3(n5), .A4(n6), .Z(n4) );
  XOR3D0 U5 ( .A1(n7), .A2(n8), .A3(n[40]), .Z(n6) );
  XOR3D0 U6 ( .A1(n[35]), .A2(n[34]), .A3(n9), .Z(n8) );
  XOR3D0 U7 ( .A1(n10), .A2(n11), .A3(n[33]), .Z(n9) );
  XOR4D0 U8 ( .A1(n[26]), .A2(n[25]), .A3(n[28]), .A4(n[27]), .Z(n11) );
  XOR4D0 U9 ( .A1(n[30]), .A2(n[29]), .A3(n[32]), .A4(n[31]), .Z(n10) );
  XOR4D0 U10 ( .A1(n[37]), .A2(n[36]), .A3(n[39]), .A4(n[38]), .Z(n7) );
  XOR4D0 U11 ( .A1(n[44]), .A2(n[43]), .A3(n[46]), .A4(n[45]), .Z(n5) );
  XOR4D0 U12 ( .A1(n[49]), .A2(n[48]), .A3(n[55]), .A4(n[54]), .Z(n1) );
  XOR4D0 U13 ( .A1(b[3]), .A2(a[3]), .A3(n12), .A4(n13), .Z(s[3]) );
  XOR3D0 U14 ( .A1(n[20]), .A2(n[19]), .A3(n14), .Z(n13) );
  XOR3D0 U15 ( .A1(n15), .A2(n16), .A3(n[18]), .Z(n14) );
  XOR4D0 U16 ( .A1(n[11]), .A2(n[10]), .A3(n[13]), .A4(n[12]), .Z(n16) );
  XOR4D0 U17 ( .A1(n[15]), .A2(n[14]), .A3(n[17]), .A4(n[16]), .Z(n15) );
  XOR4D0 U18 ( .A1(n[22]), .A2(n[21]), .A3(n[24]), .A4(n[23]), .Z(n12) );
  XOR3D0 U19 ( .A1(n17), .A2(n18), .A3(n[9]), .Z(s[2]) );
  XOR4D0 U20 ( .A1(b[2]), .A2(a[2]), .A3(n[4]), .A4(n[3]), .Z(n18) );
  XOR4D0 U21 ( .A1(n[6]), .A2(n[5]), .A3(n[8]), .A4(n[7]), .Z(n17) );
  XOR3D0 U22 ( .A1(b[1]), .A2(a[1]), .A3(n19), .Z(s[1]) );
  XOR3D0 U23 ( .A1(n[2]), .A2(n[1]), .A3(n[0]), .Z(n19) );
  XOR2D0 U24 ( .A1(b[0]), .A2(a[0]), .Z(s[0]) );
endmodule


module gen_nonlinear_part ( a, b, n );
  input [4:0] a;
  input [4:0] b;
  output [55:0] n;


  INVD0 U2 ( .I(1'b1), .ZN(n[1]) );
  INVD0 U4 ( .I(1'b1), .ZN(n[2]) );
  INVD0 U6 ( .I(1'b1), .ZN(n[5]) );
  INVD0 U8 ( .I(1'b1), .ZN(n[6]) );
  INVD0 U10 ( .I(1'b1), .ZN(n[8]) );
  INVD0 U12 ( .I(1'b1), .ZN(n[9]) );
  INVD0 U14 ( .I(1'b1), .ZN(n[13]) );
  INVD0 U16 ( .I(1'b1), .ZN(n[14]) );
  INVD0 U18 ( .I(1'b1), .ZN(n[16]) );
  INVD0 U20 ( .I(1'b1), .ZN(n[17]) );
  INVD0 U22 ( .I(1'b1), .ZN(n[20]) );
  INVD0 U24 ( .I(1'b1), .ZN(n[21]) );
  INVD0 U26 ( .I(1'b1), .ZN(n[23]) );
  INVD0 U29 ( .I(1'b1), .ZN(n[24]) );
  INVD0 U31 ( .I(1'b1), .ZN(n[29]) );
  INVD0 U33 ( .I(1'b1), .ZN(n[30]) );
  INVD0 U35 ( .I(1'b1), .ZN(n[32]) );
  INVD0 U37 ( .I(1'b1), .ZN(n[33]) );
  INVD0 U39 ( .I(1'b1), .ZN(n[36]) );
  INVD0 U41 ( .I(1'b1), .ZN(n[37]) );
  INVD0 U43 ( .I(1'b1), .ZN(n[39]) );
  INVD0 U45 ( .I(1'b1), .ZN(n[40]) );
  INVD0 U47 ( .I(1'b1), .ZN(n[44]) );
  INVD0 U49 ( .I(1'b1), .ZN(n[45]) );
  INVD0 U51 ( .I(1'b1), .ZN(n[47]) );
  INVD0 U53 ( .I(1'b1), .ZN(n[48]) );
  INVD0 U55 ( .I(1'b1), .ZN(n[51]) );
  INVD0 U57 ( .I(1'b1), .ZN(n[52]) );
  INVD0 U59 ( .I(1'b1), .ZN(n[54]) );
  INVD0 U61 ( .I(1'b1), .ZN(n[55]) );
  AN2D0 U63 ( .A1(b[3]), .A2(n[22]), .Z(n[53]) );
  AN2D0 U64 ( .A1(n[19]), .A2(b[3]), .Z(n[50]) );
  AN2D0 U65 ( .A1(n[18]), .A2(b[3]), .Z(n[49]) );
  AN2D0 U66 ( .A1(n[15]), .A2(b[3]), .Z(n[46]) );
  AN2D0 U67 ( .A1(n[12]), .A2(b[3]), .Z(n[43]) );
  AN2D0 U68 ( .A1(n[11]), .A2(b[3]), .Z(n[42]) );
  AN2D0 U69 ( .A1(n[10]), .A2(b[3]), .Z(n[41]) );
  AN2D0 U70 ( .A1(a[3]), .A2(n[22]), .Z(n[38]) );
  AN2D0 U71 ( .A1(a[3]), .A2(n[19]), .Z(n[35]) );
  AN2D0 U72 ( .A1(a[3]), .A2(n[18]), .Z(n[34]) );
  AN2D0 U73 ( .A1(a[3]), .A2(n[15]), .Z(n[31]) );
  AN2D0 U74 ( .A1(a[3]), .A2(n[12]), .Z(n[28]) );
  AN2D0 U75 ( .A1(a[3]), .A2(n[11]), .Z(n[27]) );
  AN2D0 U76 ( .A1(a[3]), .A2(n[10]), .Z(n[26]) );
  AN2D0 U77 ( .A1(a[3]), .A2(b[3]), .Z(n[25]) );
  AN2D0 U78 ( .A1(n[7]), .A2(b[2]), .Z(n[22]) );
  AN2D0 U79 ( .A1(b[2]), .A2(n[4]), .Z(n[19]) );
  AN2D0 U80 ( .A1(b[2]), .A2(n[3]), .Z(n[18]) );
  AN2D0 U81 ( .A1(n[7]), .A2(a[2]), .Z(n[15]) );
  AN2D0 U82 ( .A1(n[0]), .A2(b[1]), .Z(n[7]) );
  AN2D0 U83 ( .A1(n[4]), .A2(a[2]), .Z(n[12]) );
  AN2D0 U84 ( .A1(n[0]), .A2(a[1]), .Z(n[4]) );
  AN2D0 U85 ( .A1(n[3]), .A2(a[2]), .Z(n[11]) );
  AN2D0 U86 ( .A1(b[1]), .A2(a[1]), .Z(n[3]) );
  AN2D0 U87 ( .A1(b[2]), .A2(a[2]), .Z(n[10]) );
  AN2D0 U88 ( .A1(b[0]), .A2(a[0]), .Z(n[0]) );
endmodule


module gen_cla_decomposed ( a, b, s );
  input [4:0] a;
  input [4:0] b;
  output [4:0] s;

  wire   [55:0] n;

  gen_nonlinear_part NLIN ( .a(a), .b(b), .n(n) );
  gen_linear_part LIN ( .a(a), .b(b), .n({1'b0, 1'b0, n[53], 1'b0, 1'b0, 
        n[50:49], 1'b0, 1'b0, n[46], 1'b0, 1'b0, n[43:41], 1'b0, 1'b0, n[38], 
        1'b0, 1'b0, n[35:34], 1'b0, 1'b0, n[31], 1'b0, 1'b0, n[28:25], 1'b0, 
        1'b0, n[22], 1'b0, 1'b0, n[19:18], 1'b0, 1'b0, n[15], 1'b0, 1'b0, 
        n[12:10], 1'b0, 1'b0, n[7], 1'b0, 1'b0, n[4:3], 1'b0, 1'b0, n[0]}), 
        .s(s) );
endmodule

