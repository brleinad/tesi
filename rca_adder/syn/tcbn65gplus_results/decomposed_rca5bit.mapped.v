/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Fri Apr 29 13:21:57 2016
/////////////////////////////////////////////////////////////


module nonlin_part ( a, b, r, nl );
  input [3:0] a;
  input [3:0] b;
  input [1:0] r;
  output [9:0] nl;


  AN2D0 U1 ( .A1(r[1]), .A2(b[3]), .Z(nl[9]) );
  AN2D0 U2 ( .A1(a[3]), .A2(r[1]), .Z(nl[8]) );
  AN2D0 U3 ( .A1(a[3]), .A2(b[3]), .Z(nl[7]) );
  AN2D0 U4 ( .A1(r[0]), .A2(b[2]), .Z(nl[6]) );
  AN2D0 U5 ( .A1(a[2]), .A2(r[0]), .Z(nl[5]) );
  AN2D0 U6 ( .A1(a[2]), .A2(b[2]), .Z(nl[4]) );
  AN2D0 U7 ( .A1(b[1]), .A2(nl[0]), .Z(nl[3]) );
  AN2D0 U8 ( .A1(a[1]), .A2(nl[0]), .Z(nl[2]) );
  AN2D0 U9 ( .A1(a[1]), .A2(b[1]), .Z(nl[1]) );
  AN2D0 U10 ( .A1(b[0]), .A2(a[0]), .Z(nl[0]) );
endmodule


module lin_part ( a, b, nl, s, r );
  input [4:0] a;
  input [4:0] b;
  input [9:0] nl;
  output [4:0] s;
  output [1:0] r;
  wire   n1;

  XOR3D0 U1 ( .A1(b[4]), .A2(a[4]), .A3(n1), .Z(s[4]) );
  XOR3D0 U2 ( .A1(nl[9]), .A2(nl[8]), .A3(nl[7]), .Z(n1) );
  XOR3D0 U3 ( .A1(b[3]), .A2(a[3]), .A3(r[1]), .Z(s[3]) );
  XOR3D0 U4 ( .A1(b[2]), .A2(a[2]), .A3(r[0]), .Z(s[2]) );
  XOR3D0 U5 ( .A1(nl[0]), .A2(b[1]), .A3(a[1]), .Z(s[1]) );
  XOR2D0 U6 ( .A1(b[0]), .A2(a[0]), .Z(s[0]) );
  XOR3D0 U7 ( .A1(nl[6]), .A2(nl[5]), .A3(nl[4]), .Z(r[1]) );
  XOR3D0 U8 ( .A1(nl[3]), .A2(nl[2]), .A3(nl[1]), .Z(r[0]) );
endmodule


module decomposed_rca ( A, B, S );
  input [4:0] A;
  input [4:0] B;
  output [4:0] S;

  wire   [1:0] r;
  wire   [9:0] nl;

  nonlin_part NL_PART ( .a(A[3:0]), .b(B[3:0]), .r(r), .nl(nl) );
  lin_part L_PART ( .a(A), .b(B), .nl(nl), .s(S), .r(r) );
endmodule

