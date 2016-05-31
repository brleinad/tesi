/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Mon May 16 15:01:32 2016
/////////////////////////////////////////////////////////////


module adder_DW01_add_0 ( A, B, CI, SUM, CO );
  input [12:0] A;
  input [12:0] B;
  output [12:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57;

  XOR2D0 U1 ( .A1(n1), .A2(n2), .Z(SUM[9]) );
  XOR2D0 U2 ( .A1(B[9]), .A2(A[9]), .Z(n2) );
  XOR2D0 U3 ( .A1(n3), .A2(n4), .Z(SUM[8]) );
  XOR2D0 U4 ( .A1(B[8]), .A2(A[8]), .Z(n4) );
  XOR2D0 U5 ( .A1(n5), .A2(n6), .Z(SUM[7]) );
  XOR2D0 U6 ( .A1(B[7]), .A2(A[7]), .Z(n6) );
  XOR2D0 U7 ( .A1(n7), .A2(n8), .Z(SUM[6]) );
  XOR2D0 U8 ( .A1(B[6]), .A2(A[6]), .Z(n8) );
  XOR2D0 U9 ( .A1(n9), .A2(n10), .Z(SUM[5]) );
  XOR2D0 U10 ( .A1(B[5]), .A2(A[5]), .Z(n10) );
  XOR2D0 U11 ( .A1(n11), .A2(n12), .Z(SUM[4]) );
  XOR2D0 U12 ( .A1(B[4]), .A2(A[4]), .Z(n12) );
  XOR2D0 U13 ( .A1(n13), .A2(n14), .Z(SUM[3]) );
  XOR2D0 U14 ( .A1(B[3]), .A2(A[3]), .Z(n14) );
  XOR2D0 U15 ( .A1(n15), .A2(n16), .Z(SUM[2]) );
  XOR2D0 U16 ( .A1(B[2]), .A2(A[2]), .Z(n15) );
  XOR2D0 U17 ( .A1(n17), .A2(n18), .Z(SUM[1]) );
  XOR2D0 U18 ( .A1(B[1]), .A2(A[1]), .Z(n18) );
  XOR2D0 U19 ( .A1(n19), .A2(n20), .Z(SUM[12]) );
  OR2D0 U20 ( .A1(n21), .A2(n22), .Z(n20) );
  AN2D0 U21 ( .A1(A[11]), .A2(n23), .Z(n22) );
  AN2D0 U22 ( .A1(B[11]), .A2(n24), .Z(n21) );
  OR2D0 U23 ( .A1(A[11]), .A2(n23), .Z(n24) );
  XOR2D0 U24 ( .A1(B[12]), .A2(A[12]), .Z(n19) );
  XOR2D0 U25 ( .A1(n23), .A2(n25), .Z(SUM[11]) );
  XOR2D0 U26 ( .A1(B[11]), .A2(A[11]), .Z(n25) );
  OR2D0 U27 ( .A1(n26), .A2(n27), .Z(n23) );
  AN2D0 U28 ( .A1(A[10]), .A2(n28), .Z(n27) );
  AN2D0 U29 ( .A1(B[10]), .A2(n29), .Z(n26) );
  OR2D0 U30 ( .A1(A[10]), .A2(n28), .Z(n29) );
  XOR2D0 U31 ( .A1(n28), .A2(n30), .Z(SUM[10]) );
  XOR2D0 U32 ( .A1(B[10]), .A2(A[10]), .Z(n30) );
  OR2D0 U33 ( .A1(n31), .A2(n32), .Z(n28) );
  AN2D0 U34 ( .A1(A[9]), .A2(n1), .Z(n32) );
  AN2D0 U35 ( .A1(B[9]), .A2(n33), .Z(n31) );
  OR2D0 U36 ( .A1(A[9]), .A2(n1), .Z(n33) );
  OR2D0 U37 ( .A1(n34), .A2(n35), .Z(n1) );
  AN2D0 U38 ( .A1(A[8]), .A2(n3), .Z(n35) );
  AN2D0 U39 ( .A1(B[8]), .A2(n36), .Z(n34) );
  OR2D0 U40 ( .A1(A[8]), .A2(n3), .Z(n36) );
  OR2D0 U41 ( .A1(n37), .A2(n38), .Z(n3) );
  AN2D0 U42 ( .A1(A[7]), .A2(n5), .Z(n38) );
  AN2D0 U43 ( .A1(B[7]), .A2(n39), .Z(n37) );
  OR2D0 U44 ( .A1(A[7]), .A2(n5), .Z(n39) );
  OR2D0 U45 ( .A1(n40), .A2(n41), .Z(n5) );
  AN2D0 U46 ( .A1(A[6]), .A2(n7), .Z(n41) );
  AN2D0 U47 ( .A1(B[6]), .A2(n42), .Z(n40) );
  OR2D0 U48 ( .A1(A[6]), .A2(n7), .Z(n42) );
  OR2D0 U49 ( .A1(n43), .A2(n44), .Z(n7) );
  AN2D0 U50 ( .A1(A[5]), .A2(n9), .Z(n44) );
  AN2D0 U51 ( .A1(B[5]), .A2(n45), .Z(n43) );
  OR2D0 U52 ( .A1(A[5]), .A2(n9), .Z(n45) );
  OR2D0 U53 ( .A1(n46), .A2(n47), .Z(n9) );
  AN2D0 U54 ( .A1(A[4]), .A2(n11), .Z(n47) );
  AN2D0 U55 ( .A1(B[4]), .A2(n48), .Z(n46) );
  OR2D0 U56 ( .A1(A[4]), .A2(n11), .Z(n48) );
  OR2D0 U57 ( .A1(n49), .A2(n50), .Z(n11) );
  AN2D0 U58 ( .A1(A[3]), .A2(n13), .Z(n50) );
  AN2D0 U59 ( .A1(B[3]), .A2(n51), .Z(n49) );
  OR2D0 U60 ( .A1(A[3]), .A2(n13), .Z(n51) );
  OR2D0 U61 ( .A1(n52), .A2(n53), .Z(n13) );
  AN2D0 U62 ( .A1(A[2]), .A2(n16), .Z(n53) );
  AN2D0 U63 ( .A1(B[2]), .A2(n54), .Z(n52) );
  OR2D0 U64 ( .A1(A[2]), .A2(n16), .Z(n54) );
  OR2D0 U65 ( .A1(n55), .A2(n56), .Z(n16) );
  AN2D0 U66 ( .A1(A[1]), .A2(n17), .Z(n56) );
  AN2D0 U67 ( .A1(B[1]), .A2(n57), .Z(n55) );
  OR2D0 U68 ( .A1(n17), .A2(A[1]), .Z(n57) );
  AN2D0 U69 ( .A1(A[0]), .A2(B[0]), .Z(n17) );
  XOR2D0 U70 ( .A1(B[0]), .A2(A[0]), .Z(SUM[0]) );
endmodule


module adder ( a, b, s );
  input [12:0] a;
  input [12:0] b;
  output [12:0] s;


  adder_DW01_add_0 add_7 ( .A(a), .B(b), .CI(1'b0), .SUM(s) );
endmodule

