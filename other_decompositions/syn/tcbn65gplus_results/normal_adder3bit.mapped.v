/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Fri May 13 10:49:28 2016
/////////////////////////////////////////////////////////////


module normal_adder ( a, b, s );
  input [2:0] a;
  input [2:0] b;
  output [3:0] s;
  wire   n9, n10, n11, n12;

  MOAI22D0 U15 ( .A1(n9), .A2(n10), .B1(b[2]), .B2(a[2]), .ZN(s[3]) );
  CKXOR2D0 U16 ( .A1(n9), .A2(n10), .Z(s[2]) );
  XNR2D0 U17 ( .A1(b[2]), .A2(a[2]), .ZN(n10) );
  AOI22D0 U18 ( .A1(b[1]), .A2(a[1]), .B1(n11), .B2(n12), .ZN(n9) );
  CKXOR2D0 U19 ( .A1(n12), .A2(n11), .Z(s[1]) );
  CKXOR2D0 U20 ( .A1(b[1]), .A2(a[1]), .Z(n11) );
  AN2D0 U21 ( .A1(b[0]), .A2(a[0]), .Z(n12) );
  CKXOR2D0 U22 ( .A1(b[0]), .A2(a[0]), .Z(s[0]) );
endmodule

