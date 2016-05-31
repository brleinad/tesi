/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Mon May 16 15:01:01 2016
/////////////////////////////////////////////////////////////


module adder ( a, b, s );
  input [7:0] a;
  input [7:0] b;
  output [7:0] s;
  wire   add_7_n32, add_7_n31, add_7_n30, add_7_n29, add_7_n28, add_7_n27,
         add_7_n26, add_7_n25, add_7_n24, add_7_n23, add_7_n22, add_7_n21,
         add_7_n20, add_7_n19, add_7_n18, add_7_n17, add_7_n16, add_7_n15,
         add_7_n14, add_7_n13, add_7_n12, add_7_n11, add_7_n10, add_7_n9,
         add_7_n8, add_7_n7, add_7_n6, add_7_n5, add_7_n4, add_7_n3, add_7_n2,
         add_7_n1;

  XOR2D0 add_7_U40 ( .A1(b[0]), .A2(a[0]), .Z(s[0]) );
  AN2D0 add_7_U39 ( .A1(a[0]), .A2(b[0]), .Z(add_7_n30) );
  XOR2D0 add_7_U38 ( .A1(b[1]), .A2(a[1]), .Z(add_7_n32) );
  XOR2D0 add_7_U37 ( .A1(add_7_n30), .A2(add_7_n32), .Z(s[1]) );
  XOR2D0 add_7_U36 ( .A1(b[2]), .A2(a[2]), .Z(add_7_n27) );
  OR2D0 add_7_U35 ( .A1(add_7_n30), .A2(a[1]), .Z(add_7_n31) );
  AN2D0 add_7_U34 ( .A1(b[1]), .A2(add_7_n31), .Z(add_7_n28) );
  AN2D0 add_7_U33 ( .A1(a[1]), .A2(add_7_n30), .Z(add_7_n29) );
  OR2D0 add_7_U32 ( .A1(add_7_n28), .A2(add_7_n29), .Z(add_7_n25) );
  XOR2D0 add_7_U31 ( .A1(add_7_n27), .A2(add_7_n25), .Z(s[2]) );
  OR2D0 add_7_U30 ( .A1(a[2]), .A2(add_7_n25), .Z(add_7_n26) );
  AN2D0 add_7_U29 ( .A1(b[2]), .A2(add_7_n26), .Z(add_7_n23) );
  AN2D0 add_7_U28 ( .A1(a[2]), .A2(add_7_n25), .Z(add_7_n24) );
  OR2D0 add_7_U27 ( .A1(add_7_n23), .A2(add_7_n24), .Z(add_7_n20) );
  XOR2D0 add_7_U26 ( .A1(b[3]), .A2(a[3]), .Z(add_7_n22) );
  XOR2D0 add_7_U25 ( .A1(add_7_n20), .A2(add_7_n22), .Z(s[3]) );
  OR2D0 add_7_U24 ( .A1(a[3]), .A2(add_7_n20), .Z(add_7_n21) );
  AN2D0 add_7_U23 ( .A1(b[3]), .A2(add_7_n21), .Z(add_7_n18) );
  AN2D0 add_7_U22 ( .A1(a[3]), .A2(add_7_n20), .Z(add_7_n19) );
  OR2D0 add_7_U21 ( .A1(add_7_n18), .A2(add_7_n19), .Z(add_7_n15) );
  XOR2D0 add_7_U20 ( .A1(b[4]), .A2(a[4]), .Z(add_7_n17) );
  XOR2D0 add_7_U19 ( .A1(add_7_n15), .A2(add_7_n17), .Z(s[4]) );
  OR2D0 add_7_U18 ( .A1(a[4]), .A2(add_7_n15), .Z(add_7_n16) );
  AN2D0 add_7_U17 ( .A1(b[4]), .A2(add_7_n16), .Z(add_7_n13) );
  AN2D0 add_7_U16 ( .A1(a[4]), .A2(add_7_n15), .Z(add_7_n14) );
  OR2D0 add_7_U15 ( .A1(add_7_n13), .A2(add_7_n14), .Z(add_7_n10) );
  XOR2D0 add_7_U14 ( .A1(b[5]), .A2(a[5]), .Z(add_7_n12) );
  XOR2D0 add_7_U13 ( .A1(add_7_n10), .A2(add_7_n12), .Z(s[5]) );
  OR2D0 add_7_U12 ( .A1(a[5]), .A2(add_7_n10), .Z(add_7_n11) );
  AN2D0 add_7_U11 ( .A1(b[5]), .A2(add_7_n11), .Z(add_7_n8) );
  AN2D0 add_7_U10 ( .A1(a[5]), .A2(add_7_n10), .Z(add_7_n9) );
  OR2D0 add_7_U9 ( .A1(add_7_n8), .A2(add_7_n9), .Z(add_7_n5) );
  XOR2D0 add_7_U8 ( .A1(b[6]), .A2(a[6]), .Z(add_7_n7) );
  XOR2D0 add_7_U7 ( .A1(add_7_n5), .A2(add_7_n7), .Z(s[6]) );
  XOR2D0 add_7_U6 ( .A1(b[7]), .A2(a[7]), .Z(add_7_n1) );
  OR2D0 add_7_U5 ( .A1(a[6]), .A2(add_7_n5), .Z(add_7_n6) );
  AN2D0 add_7_U4 ( .A1(b[6]), .A2(add_7_n6), .Z(add_7_n3) );
  AN2D0 add_7_U3 ( .A1(a[6]), .A2(add_7_n5), .Z(add_7_n4) );
  OR2D0 add_7_U2 ( .A1(add_7_n3), .A2(add_7_n4), .Z(add_7_n2) );
  XOR2D0 add_7_U1 ( .A1(add_7_n1), .A2(add_7_n2), .Z(s[7]) );
endmodule

