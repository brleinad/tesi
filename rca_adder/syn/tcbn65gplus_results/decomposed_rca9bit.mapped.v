/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Fri Apr 29 13:22:23 2016
/////////////////////////////////////////////////////////////


module nonlin_part ( a, b, r, nl );
  input [7:0] a;
  input [7:0] b;
  input [5:0] r;
  output [21:0] nl;


  AN2D0 U1 ( .A1(r[1]), .A2(b[3]), .Z(nl[9]) );
  AN2D0 U2 ( .A1(a[3]), .A2(r[1]), .Z(nl[8]) );
  AN2D0 U3 ( .A1(a[3]), .A2(b[3]), .Z(nl[7]) );
  AN2D0 U4 ( .A1(r[0]), .A2(b[2]), .Z(nl[6]) );
  AN2D0 U5 ( .A1(a[2]), .A2(r[0]), .Z(nl[5]) );
  AN2D0 U6 ( .A1(a[2]), .A2(b[2]), .Z(nl[4]) );
  AN2D0 U7 ( .A1(b[1]), .A2(nl[0]), .Z(nl[3]) );
  AN2D0 U8 ( .A1(a[1]), .A2(nl[0]), .Z(nl[2]) );
  AN2D0 U9 ( .A1(r[5]), .A2(b[7]), .Z(nl[21]) );
  AN2D0 U10 ( .A1(a[7]), .A2(r[5]), .Z(nl[20]) );
  AN2D0 U11 ( .A1(a[1]), .A2(b[1]), .Z(nl[1]) );
  AN2D0 U12 ( .A1(a[7]), .A2(b[7]), .Z(nl[19]) );
  AN2D0 U13 ( .A1(r[4]), .A2(b[6]), .Z(nl[18]) );
  AN2D0 U14 ( .A1(a[6]), .A2(r[4]), .Z(nl[17]) );
  AN2D0 U15 ( .A1(a[6]), .A2(b[6]), .Z(nl[16]) );
  AN2D0 U16 ( .A1(r[3]), .A2(b[5]), .Z(nl[15]) );
  AN2D0 U17 ( .A1(a[5]), .A2(r[3]), .Z(nl[14]) );
  AN2D0 U18 ( .A1(a[5]), .A2(b[5]), .Z(nl[13]) );
  AN2D0 U19 ( .A1(r[2]), .A2(b[4]), .Z(nl[12]) );
  AN2D0 U20 ( .A1(a[4]), .A2(r[2]), .Z(nl[11]) );
  AN2D0 U21 ( .A1(a[4]), .A2(b[4]), .Z(nl[10]) );
  AN2D0 U22 ( .A1(b[0]), .A2(a[0]), .Z(nl[0]) );
endmodule


module lin_part ( a, b, nl, s, r );
  input [8:0] a;
  input [8:0] b;
  input [21:0] nl;
  output [8:0] s;
  output [5:0] r;
  wire   n1;

  XOR3D0 U1 ( .A1(b[8]), .A2(a[8]), .A3(n1), .Z(s[8]) );
  XOR3D0 U2 ( .A1(nl[21]), .A2(nl[20]), .A3(nl[19]), .Z(n1) );
  XOR3D0 U3 ( .A1(b[7]), .A2(a[7]), .A3(r[5]), .Z(s[7]) );
  XOR3D0 U4 ( .A1(b[6]), .A2(a[6]), .A3(r[4]), .Z(s[6]) );
  XOR3D0 U5 ( .A1(b[5]), .A2(a[5]), .A3(r[3]), .Z(s[5]) );
  XOR3D0 U6 ( .A1(b[4]), .A2(a[4]), .A3(r[2]), .Z(s[4]) );
  XOR3D0 U7 ( .A1(b[3]), .A2(a[3]), .A3(r[1]), .Z(s[3]) );
  XOR3D0 U8 ( .A1(b[2]), .A2(a[2]), .A3(r[0]), .Z(s[2]) );
  XOR3D0 U9 ( .A1(nl[0]), .A2(b[1]), .A3(a[1]), .Z(s[1]) );
  XOR2D0 U10 ( .A1(b[0]), .A2(a[0]), .Z(s[0]) );
  XOR3D0 U11 ( .A1(nl[18]), .A2(nl[17]), .A3(nl[16]), .Z(r[5]) );
  XOR3D0 U12 ( .A1(nl[15]), .A2(nl[14]), .A3(nl[13]), .Z(r[4]) );
  XOR3D0 U13 ( .A1(nl[12]), .A2(nl[11]), .A3(nl[10]), .Z(r[3]) );
  XOR3D0 U14 ( .A1(nl[9]), .A2(nl[8]), .A3(nl[7]), .Z(r[2]) );
  XOR3D0 U15 ( .A1(nl[6]), .A2(nl[5]), .A3(nl[4]), .Z(r[1]) );
  XOR3D0 U16 ( .A1(nl[3]), .A2(nl[2]), .A3(nl[1]), .Z(r[0]) );
endmodule


module decomposed_rca ( A, B, S );
  input [8:0] A;
  input [8:0] B;
  output [8:0] S;

  wire   [5:0] r;
  wire   [21:0] nl;

  nonlin_part NL_PART ( .a(A[7:0]), .b(B[7:0]), .r(r), .nl(nl) );
  lin_part L_PART ( .a(A), .b(B), .nl(nl), .s(S), .r(r) );
endmodule

