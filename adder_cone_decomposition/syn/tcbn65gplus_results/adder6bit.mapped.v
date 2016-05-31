/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Mon May 16 15:00:47 2016
/////////////////////////////////////////////////////////////


module adder_DW01_add_0 ( A, B, CI, SUM, CO );
  input [5:0] A;
  input [5:0] B;
  output [5:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22;

  XOR2D0 U1 ( .A1(n1), .A2(n2), .Z(SUM[5]) );
  OR2D0 U2 ( .A1(n3), .A2(n4), .Z(n2) );
  AN2D0 U3 ( .A1(A[4]), .A2(n5), .Z(n4) );
  AN2D0 U4 ( .A1(B[4]), .A2(n6), .Z(n3) );
  OR2D0 U5 ( .A1(A[4]), .A2(n5), .Z(n6) );
  XOR2D0 U6 ( .A1(B[5]), .A2(A[5]), .Z(n1) );
  XOR2D0 U7 ( .A1(n5), .A2(n7), .Z(SUM[4]) );
  XOR2D0 U8 ( .A1(B[4]), .A2(A[4]), .Z(n7) );
  OR2D0 U9 ( .A1(n8), .A2(n9), .Z(n5) );
  AN2D0 U10 ( .A1(A[3]), .A2(n10), .Z(n9) );
  AN2D0 U11 ( .A1(B[3]), .A2(n11), .Z(n8) );
  OR2D0 U12 ( .A1(A[3]), .A2(n10), .Z(n11) );
  XOR2D0 U13 ( .A1(n10), .A2(n12), .Z(SUM[3]) );
  XOR2D0 U14 ( .A1(B[3]), .A2(A[3]), .Z(n12) );
  OR2D0 U15 ( .A1(n13), .A2(n14), .Z(n10) );
  AN2D0 U16 ( .A1(A[2]), .A2(n15), .Z(n14) );
  AN2D0 U17 ( .A1(B[2]), .A2(n16), .Z(n13) );
  OR2D0 U18 ( .A1(A[2]), .A2(n15), .Z(n16) );
  XOR2D0 U19 ( .A1(n17), .A2(n15), .Z(SUM[2]) );
  OR2D0 U20 ( .A1(n18), .A2(n19), .Z(n15) );
  AN2D0 U21 ( .A1(A[1]), .A2(n20), .Z(n19) );
  AN2D0 U22 ( .A1(B[1]), .A2(n21), .Z(n18) );
  OR2D0 U23 ( .A1(n20), .A2(A[1]), .Z(n21) );
  XOR2D0 U24 ( .A1(B[2]), .A2(A[2]), .Z(n17) );
  XOR2D0 U25 ( .A1(n20), .A2(n22), .Z(SUM[1]) );
  XOR2D0 U26 ( .A1(B[1]), .A2(A[1]), .Z(n22) );
  AN2D0 U27 ( .A1(A[0]), .A2(B[0]), .Z(n20) );
  XOR2D0 U28 ( .A1(B[0]), .A2(A[0]), .Z(SUM[0]) );
endmodule


module adder ( a, b, s );
  input [5:0] a;
  input [5:0] b;
  output [5:0] s;


  adder_DW01_add_0 add_7 ( .A(a), .B(b), .CI(1'b0), .SUM(s) );
endmodule

