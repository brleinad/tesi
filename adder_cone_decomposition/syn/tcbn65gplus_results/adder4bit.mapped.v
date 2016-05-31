/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Mon May 16 15:00:34 2016
/////////////////////////////////////////////////////////////


module adder ( a, b, s );
  input [3:0] a;
  input [3:0] b;
  output [3:0] s;
  wire   n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26;

  XOR2D0 U18 ( .A1(n14), .A2(n15), .Z(s[3]) );
  OR2D0 U19 ( .A1(n16), .A2(n17), .Z(n15) );
  AN2D0 U20 ( .A1(a[2]), .A2(n18), .Z(n17) );
  AN2D0 U21 ( .A1(b[2]), .A2(n19), .Z(n16) );
  OR2D0 U22 ( .A1(a[2]), .A2(n18), .Z(n19) );
  XOR2D0 U23 ( .A1(b[3]), .A2(a[3]), .Z(n14) );
  XOR2D0 U24 ( .A1(n20), .A2(n18), .Z(s[2]) );
  OR2D0 U25 ( .A1(n21), .A2(n22), .Z(n18) );
  AN2D0 U26 ( .A1(b[1]), .A2(a[1]), .Z(n22) );
  AN2D0 U27 ( .A1(n23), .A2(b[0]), .Z(n21) );
  AN2D0 U28 ( .A1(a[0]), .A2(n24), .Z(n23) );
  OR2D0 U29 ( .A1(a[1]), .A2(b[1]), .Z(n24) );
  XOR2D0 U30 ( .A1(b[2]), .A2(a[2]), .Z(n20) );
  XOR2D0 U31 ( .A1(n25), .A2(n26), .Z(s[1]) );
  XOR2D0 U32 ( .A1(b[1]), .A2(a[1]), .Z(n26) );
  AN2D0 U33 ( .A1(b[0]), .A2(a[0]), .Z(n25) );
  XOR2D0 U34 ( .A1(b[0]), .A2(a[0]), .Z(s[0]) );
endmodule

