/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Fri Apr 29 13:23:03 2016
/////////////////////////////////////////////////////////////


module nonlin_part ( a, b, r, nl );
  input [13:0] a;
  input [13:0] b;
  input [11:0] r;
  output [39:0] nl;


  AN2D0 U1 ( .A1(r[1]), .A2(b[3]), .Z(nl[9]) );
  AN2D0 U2 ( .A1(a[3]), .A2(r[1]), .Z(nl[8]) );
  AN2D0 U3 ( .A1(a[3]), .A2(b[3]), .Z(nl[7]) );
  AN2D0 U4 ( .A1(r[0]), .A2(b[2]), .Z(nl[6]) );
  AN2D0 U5 ( .A1(a[2]), .A2(r[0]), .Z(nl[5]) );
  AN2D0 U6 ( .A1(a[2]), .A2(b[2]), .Z(nl[4]) );
  AN2D0 U7 ( .A1(b[1]), .A2(nl[0]), .Z(nl[3]) );
  AN2D0 U8 ( .A1(r[11]), .A2(b[13]), .Z(nl[39]) );
  AN2D0 U9 ( .A1(a[13]), .A2(r[11]), .Z(nl[38]) );
  AN2D0 U10 ( .A1(a[13]), .A2(b[13]), .Z(nl[37]) );
  AN2D0 U11 ( .A1(r[10]), .A2(b[12]), .Z(nl[36]) );
  AN2D0 U12 ( .A1(a[12]), .A2(r[10]), .Z(nl[35]) );
  AN2D0 U13 ( .A1(a[12]), .A2(b[12]), .Z(nl[34]) );
  AN2D0 U14 ( .A1(r[9]), .A2(b[11]), .Z(nl[33]) );
  AN2D0 U15 ( .A1(a[11]), .A2(r[9]), .Z(nl[32]) );
  AN2D0 U16 ( .A1(a[11]), .A2(b[11]), .Z(nl[31]) );
  AN2D0 U17 ( .A1(r[8]), .A2(b[10]), .Z(nl[30]) );
  AN2D0 U18 ( .A1(a[1]), .A2(nl[0]), .Z(nl[2]) );
  AN2D0 U19 ( .A1(a[10]), .A2(r[8]), .Z(nl[29]) );
  AN2D0 U20 ( .A1(a[10]), .A2(b[10]), .Z(nl[28]) );
  AN2D0 U21 ( .A1(r[7]), .A2(b[9]), .Z(nl[27]) );
  AN2D0 U22 ( .A1(a[9]), .A2(r[7]), .Z(nl[26]) );
  AN2D0 U23 ( .A1(a[9]), .A2(b[9]), .Z(nl[25]) );
  AN2D0 U24 ( .A1(r[6]), .A2(b[8]), .Z(nl[24]) );
  AN2D0 U25 ( .A1(a[8]), .A2(r[6]), .Z(nl[23]) );
  AN2D0 U26 ( .A1(a[8]), .A2(b[8]), .Z(nl[22]) );
  AN2D0 U27 ( .A1(r[5]), .A2(b[7]), .Z(nl[21]) );
  AN2D0 U28 ( .A1(a[7]), .A2(r[5]), .Z(nl[20]) );
  AN2D0 U29 ( .A1(a[1]), .A2(b[1]), .Z(nl[1]) );
  AN2D0 U30 ( .A1(a[7]), .A2(b[7]), .Z(nl[19]) );
  AN2D0 U31 ( .A1(r[4]), .A2(b[6]), .Z(nl[18]) );
  AN2D0 U32 ( .A1(a[6]), .A2(r[4]), .Z(nl[17]) );
  AN2D0 U33 ( .A1(a[6]), .A2(b[6]), .Z(nl[16]) );
  AN2D0 U34 ( .A1(r[3]), .A2(b[5]), .Z(nl[15]) );
  AN2D0 U35 ( .A1(a[5]), .A2(r[3]), .Z(nl[14]) );
  AN2D0 U36 ( .A1(a[5]), .A2(b[5]), .Z(nl[13]) );
  AN2D0 U37 ( .A1(r[2]), .A2(b[4]), .Z(nl[12]) );
  AN2D0 U38 ( .A1(a[4]), .A2(r[2]), .Z(nl[11]) );
  AN2D0 U39 ( .A1(a[4]), .A2(b[4]), .Z(nl[10]) );
  AN2D0 U40 ( .A1(b[0]), .A2(a[0]), .Z(nl[0]) );
endmodule


module lin_part ( a, b, nl, s, r );
  input [14:0] a;
  input [14:0] b;
  input [39:0] nl;
  output [14:0] s;
  output [11:0] r;
  wire   n1;

  XOR3D0 U1 ( .A1(b[9]), .A2(a[9]), .A3(r[7]), .Z(s[9]) );
  XOR3D0 U2 ( .A1(b[8]), .A2(a[8]), .A3(r[6]), .Z(s[8]) );
  XOR3D0 U3 ( .A1(b[7]), .A2(a[7]), .A3(r[5]), .Z(s[7]) );
  XOR3D0 U4 ( .A1(b[6]), .A2(a[6]), .A3(r[4]), .Z(s[6]) );
  XOR3D0 U5 ( .A1(b[5]), .A2(a[5]), .A3(r[3]), .Z(s[5]) );
  XOR3D0 U6 ( .A1(b[4]), .A2(a[4]), .A3(r[2]), .Z(s[4]) );
  XOR3D0 U7 ( .A1(b[3]), .A2(a[3]), .A3(r[1]), .Z(s[3]) );
  XOR3D0 U8 ( .A1(b[2]), .A2(a[2]), .A3(r[0]), .Z(s[2]) );
  XOR3D0 U9 ( .A1(nl[0]), .A2(b[1]), .A3(a[1]), .Z(s[1]) );
  XOR3D0 U10 ( .A1(b[14]), .A2(a[14]), .A3(n1), .Z(s[14]) );
  XOR3D0 U11 ( .A1(nl[39]), .A2(nl[38]), .A3(nl[37]), .Z(n1) );
  XOR3D0 U12 ( .A1(b[13]), .A2(a[13]), .A3(r[11]), .Z(s[13]) );
  XOR3D0 U13 ( .A1(b[12]), .A2(a[12]), .A3(r[10]), .Z(s[12]) );
  XOR3D0 U14 ( .A1(b[11]), .A2(a[11]), .A3(r[9]), .Z(s[11]) );
  XOR3D0 U15 ( .A1(b[10]), .A2(a[10]), .A3(r[8]), .Z(s[10]) );
  XOR2D0 U16 ( .A1(b[0]), .A2(a[0]), .Z(s[0]) );
  XOR3D0 U17 ( .A1(nl[30]), .A2(nl[29]), .A3(nl[28]), .Z(r[9]) );
  XOR3D0 U18 ( .A1(nl[27]), .A2(nl[26]), .A3(nl[25]), .Z(r[8]) );
  XOR3D0 U19 ( .A1(nl[24]), .A2(nl[23]), .A3(nl[22]), .Z(r[7]) );
  XOR3D0 U20 ( .A1(nl[21]), .A2(nl[20]), .A3(nl[19]), .Z(r[6]) );
  XOR3D0 U21 ( .A1(nl[18]), .A2(nl[17]), .A3(nl[16]), .Z(r[5]) );
  XOR3D0 U22 ( .A1(nl[15]), .A2(nl[14]), .A3(nl[13]), .Z(r[4]) );
  XOR3D0 U23 ( .A1(nl[12]), .A2(nl[11]), .A3(nl[10]), .Z(r[3]) );
  XOR3D0 U24 ( .A1(nl[9]), .A2(nl[8]), .A3(nl[7]), .Z(r[2]) );
  XOR3D0 U25 ( .A1(nl[6]), .A2(nl[5]), .A3(nl[4]), .Z(r[1]) );
  XOR3D0 U26 ( .A1(nl[36]), .A2(nl[35]), .A3(nl[34]), .Z(r[11]) );
  XOR3D0 U27 ( .A1(nl[33]), .A2(nl[32]), .A3(nl[31]), .Z(r[10]) );
  XOR3D0 U28 ( .A1(nl[3]), .A2(nl[2]), .A3(nl[1]), .Z(r[0]) );
endmodule


module decomposed_rca ( A, B, S );
  input [14:0] A;
  input [14:0] B;
  output [14:0] S;

  wire   [11:0] r;
  wire   [39:0] nl;

  nonlin_part NL_PART ( .a(A[13:0]), .b(B[13:0]), .r(r), .nl(nl) );
  lin_part L_PART ( .a(A), .b(B), .nl(nl), .s(S), .r(r) );
endmodule

