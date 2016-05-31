/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Mon May 16 15:01:33 2016
/////////////////////////////////////////////////////////////


module adder ( a, b, s );
  input [12:0] a;
  input [12:0] b;
  output [12:0] s;
  wire   add_7_n57, add_7_n56, add_7_n55, add_7_n54, add_7_n53, add_7_n52,
         add_7_n51, add_7_n50, add_7_n49, add_7_n48, add_7_n47, add_7_n46,
         add_7_n45, add_7_n44, add_7_n43, add_7_n42, add_7_n41, add_7_n40,
         add_7_n39, add_7_n38, add_7_n37, add_7_n36, add_7_n35, add_7_n34,
         add_7_n33, add_7_n32, add_7_n31, add_7_n30, add_7_n29, add_7_n28,
         add_7_n27, add_7_n26, add_7_n25, add_7_n24, add_7_n23, add_7_n22,
         add_7_n21, add_7_n20, add_7_n19, add_7_n18, add_7_n17, add_7_n16,
         add_7_n15, add_7_n14, add_7_n13, add_7_n12, add_7_n11, add_7_n10,
         add_7_n9, add_7_n8, add_7_n7, add_7_n6, add_7_n5, add_7_n4, add_7_n3,
         add_7_n2, add_7_n1;

  XOR2D0 add_7_U70 ( .A1(b[0]), .A2(a[0]), .Z(s[0]) );
  AN2D0 add_7_U69 ( .A1(a[0]), .A2(b[0]), .Z(add_7_n17) );
  OR2D0 add_7_U68 ( .A1(add_7_n17), .A2(a[1]), .Z(add_7_n57) );
  AN2D0 add_7_U67 ( .A1(b[1]), .A2(add_7_n57), .Z(add_7_n55) );
  AN2D0 add_7_U66 ( .A1(a[1]), .A2(add_7_n17), .Z(add_7_n56) );
  OR2D0 add_7_U65 ( .A1(add_7_n55), .A2(add_7_n56), .Z(add_7_n16) );
  OR2D0 add_7_U64 ( .A1(a[2]), .A2(add_7_n16), .Z(add_7_n54) );
  AN2D0 add_7_U63 ( .A1(b[2]), .A2(add_7_n54), .Z(add_7_n52) );
  AN2D0 add_7_U62 ( .A1(a[2]), .A2(add_7_n16), .Z(add_7_n53) );
  OR2D0 add_7_U61 ( .A1(add_7_n52), .A2(add_7_n53), .Z(add_7_n13) );
  OR2D0 add_7_U60 ( .A1(a[3]), .A2(add_7_n13), .Z(add_7_n51) );
  AN2D0 add_7_U59 ( .A1(b[3]), .A2(add_7_n51), .Z(add_7_n49) );
  AN2D0 add_7_U58 ( .A1(a[3]), .A2(add_7_n13), .Z(add_7_n50) );
  OR2D0 add_7_U57 ( .A1(add_7_n49), .A2(add_7_n50), .Z(add_7_n11) );
  OR2D0 add_7_U56 ( .A1(a[4]), .A2(add_7_n11), .Z(add_7_n48) );
  AN2D0 add_7_U55 ( .A1(b[4]), .A2(add_7_n48), .Z(add_7_n46) );
  AN2D0 add_7_U54 ( .A1(a[4]), .A2(add_7_n11), .Z(add_7_n47) );
  OR2D0 add_7_U53 ( .A1(add_7_n46), .A2(add_7_n47), .Z(add_7_n9) );
  OR2D0 add_7_U52 ( .A1(a[5]), .A2(add_7_n9), .Z(add_7_n45) );
  AN2D0 add_7_U51 ( .A1(b[5]), .A2(add_7_n45), .Z(add_7_n43) );
  AN2D0 add_7_U50 ( .A1(a[5]), .A2(add_7_n9), .Z(add_7_n44) );
  OR2D0 add_7_U49 ( .A1(add_7_n43), .A2(add_7_n44), .Z(add_7_n7) );
  OR2D0 add_7_U48 ( .A1(a[6]), .A2(add_7_n7), .Z(add_7_n42) );
  AN2D0 add_7_U47 ( .A1(b[6]), .A2(add_7_n42), .Z(add_7_n40) );
  AN2D0 add_7_U46 ( .A1(a[6]), .A2(add_7_n7), .Z(add_7_n41) );
  OR2D0 add_7_U45 ( .A1(add_7_n40), .A2(add_7_n41), .Z(add_7_n5) );
  OR2D0 add_7_U44 ( .A1(a[7]), .A2(add_7_n5), .Z(add_7_n39) );
  AN2D0 add_7_U43 ( .A1(b[7]), .A2(add_7_n39), .Z(add_7_n37) );
  AN2D0 add_7_U42 ( .A1(a[7]), .A2(add_7_n5), .Z(add_7_n38) );
  OR2D0 add_7_U41 ( .A1(add_7_n37), .A2(add_7_n38), .Z(add_7_n3) );
  OR2D0 add_7_U40 ( .A1(a[8]), .A2(add_7_n3), .Z(add_7_n36) );
  AN2D0 add_7_U39 ( .A1(b[8]), .A2(add_7_n36), .Z(add_7_n34) );
  AN2D0 add_7_U38 ( .A1(a[8]), .A2(add_7_n3), .Z(add_7_n35) );
  OR2D0 add_7_U37 ( .A1(add_7_n34), .A2(add_7_n35), .Z(add_7_n1) );
  OR2D0 add_7_U36 ( .A1(a[9]), .A2(add_7_n1), .Z(add_7_n33) );
  AN2D0 add_7_U35 ( .A1(b[9]), .A2(add_7_n33), .Z(add_7_n31) );
  AN2D0 add_7_U34 ( .A1(a[9]), .A2(add_7_n1), .Z(add_7_n32) );
  OR2D0 add_7_U33 ( .A1(add_7_n31), .A2(add_7_n32), .Z(add_7_n28) );
  XOR2D0 add_7_U32 ( .A1(b[10]), .A2(a[10]), .Z(add_7_n30) );
  XOR2D0 add_7_U31 ( .A1(add_7_n28), .A2(add_7_n30), .Z(s[10]) );
  OR2D0 add_7_U30 ( .A1(a[10]), .A2(add_7_n28), .Z(add_7_n29) );
  AN2D0 add_7_U29 ( .A1(b[10]), .A2(add_7_n29), .Z(add_7_n26) );
  AN2D0 add_7_U28 ( .A1(a[10]), .A2(add_7_n28), .Z(add_7_n27) );
  OR2D0 add_7_U27 ( .A1(add_7_n26), .A2(add_7_n27), .Z(add_7_n23) );
  XOR2D0 add_7_U26 ( .A1(b[11]), .A2(a[11]), .Z(add_7_n25) );
  XOR2D0 add_7_U25 ( .A1(add_7_n23), .A2(add_7_n25), .Z(s[11]) );
  XOR2D0 add_7_U24 ( .A1(b[12]), .A2(a[12]), .Z(add_7_n19) );
  OR2D0 add_7_U23 ( .A1(a[11]), .A2(add_7_n23), .Z(add_7_n24) );
  AN2D0 add_7_U22 ( .A1(b[11]), .A2(add_7_n24), .Z(add_7_n21) );
  AN2D0 add_7_U21 ( .A1(a[11]), .A2(add_7_n23), .Z(add_7_n22) );
  OR2D0 add_7_U20 ( .A1(add_7_n21), .A2(add_7_n22), .Z(add_7_n20) );
  XOR2D0 add_7_U19 ( .A1(add_7_n19), .A2(add_7_n20), .Z(s[12]) );
  XOR2D0 add_7_U18 ( .A1(b[1]), .A2(a[1]), .Z(add_7_n18) );
  XOR2D0 add_7_U17 ( .A1(add_7_n17), .A2(add_7_n18), .Z(s[1]) );
  XOR2D0 add_7_U16 ( .A1(b[2]), .A2(a[2]), .Z(add_7_n15) );
  XOR2D0 add_7_U15 ( .A1(add_7_n15), .A2(add_7_n16), .Z(s[2]) );
  XOR2D0 add_7_U14 ( .A1(b[3]), .A2(a[3]), .Z(add_7_n14) );
  XOR2D0 add_7_U13 ( .A1(add_7_n13), .A2(add_7_n14), .Z(s[3]) );
  XOR2D0 add_7_U12 ( .A1(b[4]), .A2(a[4]), .Z(add_7_n12) );
  XOR2D0 add_7_U11 ( .A1(add_7_n11), .A2(add_7_n12), .Z(s[4]) );
  XOR2D0 add_7_U10 ( .A1(b[5]), .A2(a[5]), .Z(add_7_n10) );
  XOR2D0 add_7_U9 ( .A1(add_7_n9), .A2(add_7_n10), .Z(s[5]) );
  XOR2D0 add_7_U8 ( .A1(b[6]), .A2(a[6]), .Z(add_7_n8) );
  XOR2D0 add_7_U7 ( .A1(add_7_n7), .A2(add_7_n8), .Z(s[6]) );
  XOR2D0 add_7_U6 ( .A1(b[7]), .A2(a[7]), .Z(add_7_n6) );
  XOR2D0 add_7_U5 ( .A1(add_7_n5), .A2(add_7_n6), .Z(s[7]) );
  XOR2D0 add_7_U4 ( .A1(b[8]), .A2(a[8]), .Z(add_7_n4) );
  XOR2D0 add_7_U3 ( .A1(add_7_n3), .A2(add_7_n4), .Z(s[8]) );
  XOR2D0 add_7_U2 ( .A1(b[9]), .A2(a[9]), .Z(add_7_n2) );
  XOR2D0 add_7_U1 ( .A1(add_7_n1), .A2(add_7_n2), .Z(s[9]) );
endmodule

