/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Mon Apr 18 15:22:03 2016
/////////////////////////////////////////////////////////////


module gen_nonlinear_part ( a, b, n );
  input [5:0] a;
  input [5:0] b;
  output [56:0] n;


  AN2D0 U1 ( .A1(b[4]), .A2(n[25]), .Z(n[56]) );
  AN2D0 U2 ( .A1(n[24]), .A2(b[4]), .Z(n[55]) );
  AN2D0 U3 ( .A1(n[23]), .A2(b[4]), .Z(n[54]) );
  AN2D0 U4 ( .A1(n[22]), .A2(b[4]), .Z(n[53]) );
  AN2D0 U5 ( .A1(n[21]), .A2(b[4]), .Z(n[52]) );
  AN2D0 U6 ( .A1(n[20]), .A2(b[4]), .Z(n[51]) );
  AN2D0 U7 ( .A1(n[19]), .A2(b[4]), .Z(n[50]) );
  AN2D0 U8 ( .A1(n[18]), .A2(b[4]), .Z(n[49]) );
  AN2D0 U9 ( .A1(n[17]), .A2(b[4]), .Z(n[48]) );
  AN2D0 U10 ( .A1(n[16]), .A2(b[4]), .Z(n[47]) );
  AN2D0 U11 ( .A1(n[15]), .A2(b[4]), .Z(n[46]) );
  AN2D0 U12 ( .A1(n[14]), .A2(b[4]), .Z(n[45]) );
  AN2D0 U13 ( .A1(n[13]), .A2(b[4]), .Z(n[44]) );
  AN2D0 U14 ( .A1(n[12]), .A2(b[4]), .Z(n[43]) );
  AN2D0 U15 ( .A1(n[11]), .A2(b[4]), .Z(n[42]) );
  AN2D0 U16 ( .A1(a[4]), .A2(n[25]), .Z(n[41]) );
  AN2D0 U17 ( .A1(a[4]), .A2(n[24]), .Z(n[40]) );
  AN2D0 U18 ( .A1(a[4]), .A2(n[23]), .Z(n[39]) );
  AN2D0 U19 ( .A1(a[4]), .A2(n[22]), .Z(n[38]) );
  AN2D0 U20 ( .A1(a[4]), .A2(n[21]), .Z(n[37]) );
  AN2D0 U21 ( .A1(a[4]), .A2(n[20]), .Z(n[36]) );
  AN2D0 U22 ( .A1(a[4]), .A2(n[19]), .Z(n[35]) );
  AN2D0 U23 ( .A1(a[4]), .A2(n[18]), .Z(n[34]) );
  AN2D0 U24 ( .A1(a[4]), .A2(n[17]), .Z(n[33]) );
  AN2D0 U25 ( .A1(a[4]), .A2(n[16]), .Z(n[32]) );
  AN2D0 U26 ( .A1(a[4]), .A2(n[15]), .Z(n[31]) );
  AN2D0 U27 ( .A1(a[4]), .A2(n[14]), .Z(n[30]) );
  AN2D0 U28 ( .A1(a[4]), .A2(n[13]), .Z(n[29]) );
  AN2D0 U29 ( .A1(a[4]), .A2(n[12]), .Z(n[28]) );
  AN2D0 U30 ( .A1(a[4]), .A2(n[11]), .Z(n[27]) );
  AN2D0 U31 ( .A1(a[4]), .A2(b[4]), .Z(n[26]) );
  AN2D0 U32 ( .A1(n[10]), .A2(b[3]), .Z(n[25]) );
  AN2D0 U33 ( .A1(b[3]), .A2(n[9]), .Z(n[24]) );
  AN2D0 U34 ( .A1(b[3]), .A2(n[8]), .Z(n[23]) );
  AN2D0 U35 ( .A1(b[3]), .A2(n[7]), .Z(n[22]) );
  AN2D0 U36 ( .A1(b[3]), .A2(n[6]), .Z(n[21]) );
  AN2D0 U37 ( .A1(b[3]), .A2(n[5]), .Z(n[20]) );
  AN2D0 U38 ( .A1(b[3]), .A2(n[4]), .Z(n[19]) );
  AN2D0 U39 ( .A1(n[10]), .A2(a[3]), .Z(n[18]) );
  AN2D0 U40 ( .A1(n[9]), .A2(a[3]), .Z(n[17]) );
  AN2D0 U41 ( .A1(n[2]), .A2(b[2]), .Z(n[9]) );
  AN2D0 U42 ( .A1(n[8]), .A2(a[3]), .Z(n[16]) );
  AN2D0 U43 ( .A1(b[2]), .A2(n[1]), .Z(n[8]) );
  AN2D0 U44 ( .A1(n[7]), .A2(a[3]), .Z(n[15]) );
  AN2D0 U45 ( .A1(n[3]), .A2(a[2]), .Z(n[7]) );
  AN2D0 U46 ( .A1(n[6]), .A2(a[3]), .Z(n[14]) );
  AN2D0 U47 ( .A1(n[2]), .A2(a[2]), .Z(n[6]) );
  AN2D0 U48 ( .A1(n[0]), .A2(a[1]), .Z(n[2]) );
  AN2D0 U49 ( .A1(n[5]), .A2(a[3]), .Z(n[13]) );
  AN2D0 U50 ( .A1(n[1]), .A2(a[2]), .Z(n[5]) );
  AN2D0 U51 ( .A1(a[1]), .A2(b[1]), .Z(n[1]) );
  AN2D0 U52 ( .A1(n[4]), .A2(a[3]), .Z(n[12]) );
  AN2D0 U53 ( .A1(b[2]), .A2(a[2]), .Z(n[4]) );
  AN2D0 U54 ( .A1(b[3]), .A2(a[3]), .Z(n[11]) );
  AN2D0 U55 ( .A1(b[2]), .A2(n[3]), .Z(n[10]) );
  AN2D0 U56 ( .A1(n[0]), .A2(b[1]), .Z(n[3]) );
  AN2D0 U57 ( .A1(b[0]), .A2(a[0]), .Z(n[0]) );
endmodule


module gen_linear_part ( a, b, n, s );
  input [5:0] a;
  input [5:0] b;
  input [56:0] n;
  output [5:0] s;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19;

  XOR4D0 U1 ( .A1(n1), .A2(n2), .A3(n3), .A4(n[51]), .Z(s[5]) );
  XOR3D0 U2 ( .A1(n[54]), .A2(n[53]), .A3(n[52]), .Z(n3) );
  XOR4D0 U3 ( .A1(a[5]), .A2(n4), .A3(n[48]), .A4(b[5]), .Z(n2) );
  XOR4D0 U4 ( .A1(n[43]), .A2(n[42]), .A3(n5), .A4(n6), .Z(n4) );
  XOR3D0 U5 ( .A1(n7), .A2(n8), .A3(n[41]), .Z(n6) );
  XOR3D0 U6 ( .A1(n[36]), .A2(n[35]), .A3(n9), .Z(n8) );
  XOR3D0 U7 ( .A1(n10), .A2(n11), .A3(n[34]), .Z(n9) );
  XOR4D0 U8 ( .A1(n[27]), .A2(n[26]), .A3(n[29]), .A4(n[28]), .Z(n11) );
  XOR4D0 U9 ( .A1(n[31]), .A2(n[30]), .A3(n[33]), .A4(n[32]), .Z(n10) );
  XOR4D0 U10 ( .A1(n[38]), .A2(n[37]), .A3(n[40]), .A4(n[39]), .Z(n7) );
  XOR4D0 U11 ( .A1(n[45]), .A2(n[44]), .A3(n[47]), .A4(n[46]), .Z(n5) );
  XOR4D0 U12 ( .A1(n[50]), .A2(n[49]), .A3(n[56]), .A4(n[55]), .Z(n1) );
  XOR4D0 U13 ( .A1(b[4]), .A2(a[4]), .A3(n12), .A4(n13), .Z(s[4]) );
  XOR3D0 U14 ( .A1(n[21]), .A2(n[20]), .A3(n14), .Z(n13) );
  XOR3D0 U15 ( .A1(n15), .A2(n16), .A3(n[19]), .Z(n14) );
  XOR4D0 U16 ( .A1(n[12]), .A2(n[11]), .A3(n[14]), .A4(n[13]), .Z(n16) );
  XOR4D0 U17 ( .A1(n[16]), .A2(n[15]), .A3(n[18]), .A4(n[17]), .Z(n15) );
  XOR4D0 U18 ( .A1(n[23]), .A2(n[22]), .A3(n[25]), .A4(n[24]), .Z(n12) );
  XOR3D0 U19 ( .A1(n17), .A2(n18), .A3(n[9]), .Z(s[3]) );
  XOR4D0 U20 ( .A1(b[3]), .A2(a[3]), .A3(n[4]), .A4(n[10]), .Z(n18) );
  XOR4D0 U21 ( .A1(n[6]), .A2(n[5]), .A3(n[8]), .A4(n[7]), .Z(n17) );
  XOR3D0 U22 ( .A1(b[2]), .A2(a[2]), .A3(n19), .Z(s[2]) );
  XOR3D0 U23 ( .A1(n[3]), .A2(n[2]), .A3(n[1]), .Z(n19) );
  XOR3D0 U24 ( .A1(n[0]), .A2(b[1]), .A3(a[1]), .Z(s[1]) );
  XOR2D0 U25 ( .A1(b[0]), .A2(a[0]), .Z(s[0]) );
endmodule


module gen_cla_decomposed ( a, b, s );
  input [5:0] a;
  input [5:0] b;
  output [5:0] s;

  wire   [56:0] n;

  gen_nonlinear_part NLIN ( .a(a), .b(b), .n(n) );
  gen_linear_part LIN ( .a(a), .b(b), .n(n), .s(s) );
endmodule
