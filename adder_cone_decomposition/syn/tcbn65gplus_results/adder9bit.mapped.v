/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Mon May 16 15:01:06 2016
/////////////////////////////////////////////////////////////


module adder_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37;

  XOR2D0 U1 ( .A1(n1), .A2(n2), .Z(SUM[8]) );
  OR2D0 U2 ( .A1(n3), .A2(n4), .Z(n2) );
  AN2D0 U3 ( .A1(A[7]), .A2(n5), .Z(n4) );
  AN2D0 U4 ( .A1(B[7]), .A2(n6), .Z(n3) );
  OR2D0 U5 ( .A1(A[7]), .A2(n5), .Z(n6) );
  XOR2D0 U6 ( .A1(B[8]), .A2(A[8]), .Z(n1) );
  XOR2D0 U7 ( .A1(n5), .A2(n7), .Z(SUM[7]) );
  XOR2D0 U8 ( .A1(B[7]), .A2(A[7]), .Z(n7) );
  OR2D0 U9 ( .A1(n8), .A2(n9), .Z(n5) );
  AN2D0 U10 ( .A1(A[6]), .A2(n10), .Z(n9) );
  AN2D0 U11 ( .A1(B[6]), .A2(n11), .Z(n8) );
  OR2D0 U12 ( .A1(A[6]), .A2(n10), .Z(n11) );
  XOR2D0 U13 ( .A1(n10), .A2(n12), .Z(SUM[6]) );
  XOR2D0 U14 ( .A1(B[6]), .A2(A[6]), .Z(n12) );
  OR2D0 U15 ( .A1(n13), .A2(n14), .Z(n10) );
  AN2D0 U16 ( .A1(A[5]), .A2(n15), .Z(n14) );
  AN2D0 U17 ( .A1(B[5]), .A2(n16), .Z(n13) );
  OR2D0 U18 ( .A1(A[5]), .A2(n15), .Z(n16) );
  XOR2D0 U19 ( .A1(n15), .A2(n17), .Z(SUM[5]) );
  XOR2D0 U20 ( .A1(B[5]), .A2(A[5]), .Z(n17) );
  OR2D0 U21 ( .A1(n18), .A2(n19), .Z(n15) );
  AN2D0 U22 ( .A1(A[4]), .A2(n20), .Z(n19) );
  AN2D0 U23 ( .A1(B[4]), .A2(n21), .Z(n18) );
  OR2D0 U24 ( .A1(A[4]), .A2(n20), .Z(n21) );
  XOR2D0 U25 ( .A1(n20), .A2(n22), .Z(SUM[4]) );
  XOR2D0 U26 ( .A1(B[4]), .A2(A[4]), .Z(n22) );
  OR2D0 U27 ( .A1(n23), .A2(n24), .Z(n20) );
  AN2D0 U28 ( .A1(A[3]), .A2(n25), .Z(n24) );
  AN2D0 U29 ( .A1(B[3]), .A2(n26), .Z(n23) );
  OR2D0 U30 ( .A1(A[3]), .A2(n25), .Z(n26) );
  XOR2D0 U31 ( .A1(n25), .A2(n27), .Z(SUM[3]) );
  XOR2D0 U32 ( .A1(B[3]), .A2(A[3]), .Z(n27) );
  OR2D0 U33 ( .A1(n28), .A2(n29), .Z(n25) );
  AN2D0 U34 ( .A1(A[2]), .A2(n30), .Z(n29) );
  AN2D0 U35 ( .A1(B[2]), .A2(n31), .Z(n28) );
  OR2D0 U36 ( .A1(A[2]), .A2(n30), .Z(n31) );
  XOR2D0 U37 ( .A1(n32), .A2(n30), .Z(SUM[2]) );
  OR2D0 U38 ( .A1(n33), .A2(n34), .Z(n30) );
  AN2D0 U39 ( .A1(A[1]), .A2(n35), .Z(n34) );
  AN2D0 U40 ( .A1(B[1]), .A2(n36), .Z(n33) );
  OR2D0 U41 ( .A1(n35), .A2(A[1]), .Z(n36) );
  XOR2D0 U42 ( .A1(B[2]), .A2(A[2]), .Z(n32) );
  XOR2D0 U43 ( .A1(n35), .A2(n37), .Z(SUM[1]) );
  XOR2D0 U44 ( .A1(B[1]), .A2(A[1]), .Z(n37) );
  AN2D0 U45 ( .A1(A[0]), .A2(B[0]), .Z(n35) );
  XOR2D0 U46 ( .A1(B[0]), .A2(A[0]), .Z(SUM[0]) );
endmodule


module adder ( a, b, s );
  input [8:0] a;
  input [8:0] b;
  output [8:0] s;


  adder_DW01_add_0 add_7 ( .A(a), .B(b), .CI(1'b0), .SUM(s) );
endmodule

