/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Thu May 12 15:10:54 2016
/////////////////////////////////////////////////////////////


module adder_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28;

  OR2D0 U1 ( .A1(n1), .A2(n2), .Z(SUM[8]) );
  AN2D0 U2 ( .A1(A[7]), .A2(n3), .Z(n2) );
  AN2D0 U3 ( .A1(B[7]), .A2(n4), .Z(n1) );
  OR2D0 U4 ( .A1(A[7]), .A2(n3), .Z(n4) );
  XOR3D0 U5 ( .A1(B[7]), .A2(n3), .A3(A[7]), .Z(SUM[7]) );
  OR2D0 U6 ( .A1(n5), .A2(n6), .Z(n3) );
  AN2D0 U7 ( .A1(A[6]), .A2(n7), .Z(n6) );
  AN2D0 U8 ( .A1(B[6]), .A2(n8), .Z(n5) );
  OR2D0 U9 ( .A1(A[6]), .A2(n7), .Z(n8) );
  XOR3D0 U10 ( .A1(B[6]), .A2(A[6]), .A3(n7), .Z(SUM[6]) );
  OR2D0 U11 ( .A1(n9), .A2(n10), .Z(n7) );
  AN2D0 U12 ( .A1(A[5]), .A2(n11), .Z(n10) );
  AN2D0 U13 ( .A1(B[5]), .A2(n12), .Z(n9) );
  OR2D0 U14 ( .A1(A[5]), .A2(n11), .Z(n12) );
  XOR3D0 U15 ( .A1(B[5]), .A2(A[5]), .A3(n11), .Z(SUM[5]) );
  OR2D0 U16 ( .A1(n13), .A2(n14), .Z(n11) );
  AN2D0 U17 ( .A1(A[4]), .A2(n15), .Z(n14) );
  AN2D0 U18 ( .A1(B[4]), .A2(n16), .Z(n13) );
  OR2D0 U19 ( .A1(A[4]), .A2(n15), .Z(n16) );
  XOR3D0 U20 ( .A1(B[4]), .A2(A[4]), .A3(n15), .Z(SUM[4]) );
  OR2D0 U21 ( .A1(n17), .A2(n18), .Z(n15) );
  AN2D0 U22 ( .A1(A[3]), .A2(n19), .Z(n18) );
  AN2D0 U23 ( .A1(B[3]), .A2(n20), .Z(n17) );
  OR2D0 U24 ( .A1(A[3]), .A2(n19), .Z(n20) );
  XOR3D0 U25 ( .A1(B[3]), .A2(A[3]), .A3(n19), .Z(SUM[3]) );
  OR2D0 U26 ( .A1(n21), .A2(n22), .Z(n19) );
  AN2D0 U27 ( .A1(A[2]), .A2(n23), .Z(n22) );
  AN2D0 U28 ( .A1(B[2]), .A2(n24), .Z(n21) );
  OR2D0 U29 ( .A1(A[2]), .A2(n23), .Z(n24) );
  XOR3D0 U30 ( .A1(B[2]), .A2(A[2]), .A3(n23), .Z(SUM[2]) );
  OR2D0 U31 ( .A1(n25), .A2(n26), .Z(n23) );
  AN2D0 U32 ( .A1(A[1]), .A2(n27), .Z(n26) );
  AN2D0 U33 ( .A1(B[1]), .A2(n28), .Z(n25) );
  OR2D0 U34 ( .A1(n27), .A2(A[1]), .Z(n28) );
  XOR3D0 U35 ( .A1(B[1]), .A2(A[1]), .A3(n27), .Z(SUM[1]) );
  AN2D0 U36 ( .A1(A[0]), .A2(B[0]), .Z(n27) );
  XOR2D0 U37 ( .A1(B[0]), .A2(A[0]), .Z(SUM[0]) );
endmodule


module adder ( a, b, s );
  input [7:0] a;
  input [7:0] b;
  output [8:0] s;


  adder_DW01_add_0 add_8 ( .A({1'b0, a}), .B({1'b0, b}), .CI(1'b0), .SUM(s) );
endmodule

