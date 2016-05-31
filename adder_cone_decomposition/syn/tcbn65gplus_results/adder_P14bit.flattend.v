/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Tue May 24 14:28:22 2016
/////////////////////////////////////////////////////////////


module adder_P ( a, b, s );
  input [13:0] a;
  input [13:0] b;
  output [13:0] s;
  wire   ADD_add_8_n62, ADD_add_8_n61, ADD_add_8_n60, ADD_add_8_n59,
         ADD_add_8_n58, ADD_add_8_n57, ADD_add_8_n56, ADD_add_8_n55,
         ADD_add_8_n54, ADD_add_8_n53, ADD_add_8_n52, ADD_add_8_n51,
         ADD_add_8_n50, ADD_add_8_n49, ADD_add_8_n48, ADD_add_8_n47,
         ADD_add_8_n46, ADD_add_8_n45, ADD_add_8_n44, ADD_add_8_n43,
         ADD_add_8_n42, ADD_add_8_n41, ADD_add_8_n40, ADD_add_8_n39,
         ADD_add_8_n38, ADD_add_8_n37, ADD_add_8_n36, ADD_add_8_n35,
         ADD_add_8_n34, ADD_add_8_n33, ADD_add_8_n32, ADD_add_8_n31,
         ADD_add_8_n30, ADD_add_8_n29, ADD_add_8_n28, ADD_add_8_n27,
         ADD_add_8_n26, ADD_add_8_n25, ADD_add_8_n24, ADD_add_8_n23,
         ADD_add_8_n22, ADD_add_8_n21, ADD_add_8_n20, ADD_add_8_n19,
         ADD_add_8_n18, ADD_add_8_n17, ADD_add_8_n16, ADD_add_8_n15,
         ADD_add_8_n14, ADD_add_8_n13, ADD_add_8_n12, ADD_add_8_n11,
         ADD_add_8_n10, ADD_add_8_n9, ADD_add_8_n8, ADD_add_8_n7, ADD_add_8_n6,
         ADD_add_8_n5, ADD_add_8_n4, ADD_add_8_n3, ADD_add_8_n2, ADD_add_8_n1,
         PAR_n34, PAR_n33, PAR_n32, PAR_n31, PAR_n30, PAR_n29, PAR_n28,
         PAR_n27, PAR_n26, PAR_n25, PAR_n24, PAR_n23, PAR_n22, PAR_n21,
         PAR_n20, PAR_n19, PAR_n18, PAR_n17, PAR_n16, PAR_n15, PAR_n14,
         PAR_n13, PAR_n12, PAR_n11, PAR_n10, PAR_n9, PAR_n8, PAR_n7, PAR_n6,
         PAR_n5, PAR_n4, PAR_n3, PAR_n2, PAR_n1,
         sp_0, sp_1, sp_2, sp_3, sp_4, sp_5, sp_6, sp_7, sp_8, sp_9, sp_10, sp_11, sp_12, sp_13;

  XOR2D0 ADD_add_8_U76 ( .A1(b[0]), .A2(a[0]), .Z(sp_0) );
  AN2D0 ADD_add_8_U75 ( .A1(a[0]), .A2(b[0]), .Z(ADD_add_8_n17) );
  OR2D0 ADD_add_8_U74 ( .A1(ADD_add_8_n17), .A2(a[1]), .Z(ADD_add_8_n62) );
  AN2D0 ADD_add_8_U73 ( .A1(b[1]), .A2(ADD_add_8_n62), .Z(ADD_add_8_n60) );
  AN2D0 ADD_add_8_U72 ( .A1(a[1]), .A2(ADD_add_8_n17), .Z(ADD_add_8_n61) );
  OR2D0 ADD_add_8_U71 ( .A1(ADD_add_8_n60), .A2(ADD_add_8_n61), .Z(ADD_add_8_n16) );
  OR2D0 ADD_add_8_U70 ( .A1(a[2]), .A2(ADD_add_8_n16), .Z(ADD_add_8_n59) );
  AN2D0 ADD_add_8_U69 ( .A1(b[2]), .A2(ADD_add_8_n59), .Z(ADD_add_8_n57) );
  AN2D0 ADD_add_8_U68 ( .A1(a[2]), .A2(ADD_add_8_n16), .Z(ADD_add_8_n58) );
  OR2D0 ADD_add_8_U67 ( .A1(ADD_add_8_n57), .A2(ADD_add_8_n58), .Z(ADD_add_8_n13) );
  OR2D0 ADD_add_8_U66 ( .A1(a[3]), .A2(ADD_add_8_n13), .Z(ADD_add_8_n56) );
  AN2D0 ADD_add_8_U65 ( .A1(b[3]), .A2(ADD_add_8_n56), .Z(ADD_add_8_n54) );
  AN2D0 ADD_add_8_U64 ( .A1(a[3]), .A2(ADD_add_8_n13), .Z(ADD_add_8_n55) );
  OR2D0 ADD_add_8_U63 ( .A1(ADD_add_8_n54), .A2(ADD_add_8_n55), .Z(ADD_add_8_n11) );
  OR2D0 ADD_add_8_U62 ( .A1(a[4]), .A2(ADD_add_8_n11), .Z(ADD_add_8_n53) );
  AN2D0 ADD_add_8_U61 ( .A1(b[4]), .A2(ADD_add_8_n53), .Z(ADD_add_8_n51) );
  AN2D0 ADD_add_8_U60 ( .A1(a[4]), .A2(ADD_add_8_n11), .Z(ADD_add_8_n52) );
  OR2D0 ADD_add_8_U59 ( .A1(ADD_add_8_n51), .A2(ADD_add_8_n52), .Z(ADD_add_8_n9) );
  OR2D0 ADD_add_8_U58 ( .A1(a[5]), .A2(ADD_add_8_n9), .Z(ADD_add_8_n50) );
  AN2D0 ADD_add_8_U57 ( .A1(b[5]), .A2(ADD_add_8_n50), .Z(ADD_add_8_n48) );
  AN2D0 ADD_add_8_U56 ( .A1(a[5]), .A2(ADD_add_8_n9), .Z(ADD_add_8_n49) );
  OR2D0 ADD_add_8_U55 ( .A1(ADD_add_8_n48), .A2(ADD_add_8_n49), .Z(ADD_add_8_n7) );
  OR2D0 ADD_add_8_U54 ( .A1(a[6]), .A2(ADD_add_8_n7), .Z(ADD_add_8_n47) );
  AN2D0 ADD_add_8_U53 ( .A1(b[6]), .A2(ADD_add_8_n47), .Z(ADD_add_8_n45) );
  AN2D0 ADD_add_8_U52 ( .A1(a[6]), .A2(ADD_add_8_n7), .Z(ADD_add_8_n46) );
  OR2D0 ADD_add_8_U51 ( .A1(ADD_add_8_n45), .A2(ADD_add_8_n46), .Z(ADD_add_8_n5) );
  OR2D0 ADD_add_8_U50 ( .A1(a[7]), .A2(ADD_add_8_n5), .Z(ADD_add_8_n44) );
  AN2D0 ADD_add_8_U49 ( .A1(b[7]), .A2(ADD_add_8_n44), .Z(ADD_add_8_n42) );
  AN2D0 ADD_add_8_U48 ( .A1(a[7]), .A2(ADD_add_8_n5), .Z(ADD_add_8_n43) );
  OR2D0 ADD_add_8_U47 ( .A1(ADD_add_8_n42), .A2(ADD_add_8_n43), .Z(ADD_add_8_n3) );
  OR2D0 ADD_add_8_U46 ( .A1(a[8]), .A2(ADD_add_8_n3), .Z(ADD_add_8_n41) );
  AN2D0 ADD_add_8_U45 ( .A1(b[8]), .A2(ADD_add_8_n41), .Z(ADD_add_8_n39) );
  AN2D0 ADD_add_8_U44 ( .A1(a[8]), .A2(ADD_add_8_n3), .Z(ADD_add_8_n40) );
  OR2D0 ADD_add_8_U43 ( .A1(ADD_add_8_n39), .A2(ADD_add_8_n40), .Z(ADD_add_8_n1) );
  OR2D0 ADD_add_8_U42 ( .A1(a[9]), .A2(ADD_add_8_n1), .Z(ADD_add_8_n38) );
  AN2D0 ADD_add_8_U41 ( .A1(b[9]), .A2(ADD_add_8_n38), .Z(ADD_add_8_n36) );
  AN2D0 ADD_add_8_U40 ( .A1(a[9]), .A2(ADD_add_8_n1), .Z(ADD_add_8_n37) );
  OR2D0 ADD_add_8_U39 ( .A1(ADD_add_8_n36), .A2(ADD_add_8_n37), .Z(ADD_add_8_n33) );
  XOR2D0 ADD_add_8_U38 ( .A1(b[10]), .A2(a[10]), .Z(ADD_add_8_n35) );
  XOR2D0 ADD_add_8_U37 ( .A1(ADD_add_8_n33), .A2(ADD_add_8_n35), .Z(sp_10) );
  OR2D0 ADD_add_8_U36 ( .A1(a[10]), .A2(ADD_add_8_n33), .Z(ADD_add_8_n34) );
  AN2D0 ADD_add_8_U35 ( .A1(b[10]), .A2(ADD_add_8_n34), .Z(ADD_add_8_n31) );
  AN2D0 ADD_add_8_U34 ( .A1(a[10]), .A2(ADD_add_8_n33), .Z(ADD_add_8_n32) );
  OR2D0 ADD_add_8_U33 ( .A1(ADD_add_8_n31), .A2(ADD_add_8_n32), .Z(ADD_add_8_n28) );
  XOR2D0 ADD_add_8_U32 ( .A1(b[11]), .A2(a[11]), .Z(ADD_add_8_n30) );
  XOR2D0 ADD_add_8_U31 ( .A1(ADD_add_8_n28), .A2(ADD_add_8_n30), .Z(sp_11) );
  OR2D0 ADD_add_8_U30 ( .A1(a[11]), .A2(ADD_add_8_n28), .Z(ADD_add_8_n29) );
  AN2D0 ADD_add_8_U29 ( .A1(b[11]), .A2(ADD_add_8_n29), .Z(ADD_add_8_n26) );
  AN2D0 ADD_add_8_U28 ( .A1(a[11]), .A2(ADD_add_8_n28), .Z(ADD_add_8_n27) );
  OR2D0 ADD_add_8_U27 ( .A1(ADD_add_8_n26), .A2(ADD_add_8_n27), .Z(ADD_add_8_n23) );
  XOR2D0 ADD_add_8_U26 ( .A1(b[12]), .A2(a[12]), .Z(ADD_add_8_n25) );
  XOR2D0 ADD_add_8_U25 ( .A1(ADD_add_8_n23), .A2(ADD_add_8_n25), .Z(sp_12) );
  XOR2D0 ADD_add_8_U24 ( .A1(b[13]), .A2(a[13]), .Z(ADD_add_8_n19) );
  OR2D0 ADD_add_8_U23 ( .A1(a[12]), .A2(ADD_add_8_n23), .Z(ADD_add_8_n24) );
  AN2D0 ADD_add_8_U22 ( .A1(b[12]), .A2(ADD_add_8_n24), .Z(ADD_add_8_n21) );
  AN2D0 ADD_add_8_U21 ( .A1(a[12]), .A2(ADD_add_8_n23), .Z(ADD_add_8_n22) );
  OR2D0 ADD_add_8_U20 ( .A1(ADD_add_8_n21), .A2(ADD_add_8_n22), .Z(ADD_add_8_n20) );
  XOR2D0 ADD_add_8_U19 ( .A1(ADD_add_8_n19), .A2(ADD_add_8_n20), .Z(sp_13) );
  XOR2D0 ADD_add_8_U18 ( .A1(b[1]), .A2(a[1]), .Z(ADD_add_8_n18) );
  XOR2D0 ADD_add_8_U17 ( .A1(ADD_add_8_n17), .A2(ADD_add_8_n18), .Z(sp_1) );
  XOR2D0 ADD_add_8_U16 ( .A1(b[2]), .A2(a[2]), .Z(ADD_add_8_n15) );
  XOR2D0 ADD_add_8_U15 ( .A1(ADD_add_8_n15), .A2(ADD_add_8_n16), .Z(sp_2) );
  XOR2D0 ADD_add_8_U14 ( .A1(b[3]), .A2(a[3]), .Z(ADD_add_8_n14) );
  XOR2D0 ADD_add_8_U13 ( .A1(ADD_add_8_n13), .A2(ADD_add_8_n14), .Z(sp_3) );
  XOR2D0 ADD_add_8_U12 ( .A1(b[4]), .A2(a[4]), .Z(ADD_add_8_n12) );
  XOR2D0 ADD_add_8_U11 ( .A1(ADD_add_8_n11), .A2(ADD_add_8_n12), .Z(sp_4) );
  XOR2D0 ADD_add_8_U10 ( .A1(b[5]), .A2(a[5]), .Z(ADD_add_8_n10) );
  XOR2D0 ADD_add_8_U9 ( .A1(ADD_add_8_n9), .A2(ADD_add_8_n10), .Z(sp_5) );
  XOR2D0 ADD_add_8_U8 ( .A1(b[6]), .A2(a[6]), .Z(ADD_add_8_n8) );
  XOR2D0 ADD_add_8_U7 ( .A1(ADD_add_8_n7), .A2(ADD_add_8_n8), .Z(sp_6) );
  XOR2D0 ADD_add_8_U6 ( .A1(b[7]), .A2(a[7]), .Z(ADD_add_8_n6) );
  XOR2D0 ADD_add_8_U5 ( .A1(ADD_add_8_n5), .A2(ADD_add_8_n6), .Z(sp_7) );
  XOR2D0 ADD_add_8_U4 ( .A1(b[8]), .A2(a[8]), .Z(ADD_add_8_n4) );
  XOR2D0 ADD_add_8_U3 ( .A1(ADD_add_8_n3), .A2(ADD_add_8_n4), .Z(sp_8) );
  XOR2D0 ADD_add_8_U2 ( .A1(b[9]), .A2(a[9]), .Z(ADD_add_8_n2) );
  XOR2D0 ADD_add_8_U1 ( .A1(ADD_add_8_n1), .A2(ADD_add_8_n2), .Z(sp_9) );
  XOR2D0 PAR_U48 ( .A1(sp_9), .A2(sp_10), .Z(PAR_n23) );
  XOR2D0 PAR_U47 ( .A1(PAR_n23), .A2(sp_6), .Z(PAR_n16) );
  XOR2D0 PAR_U46 ( .A1(PAR_n16), .A2(sp_1), .Z(PAR_n13) );
  XOR2D0 PAR_U45 ( .A1(PAR_n13), .A2(sp_12), .Z(PAR_n34) );
  XOR2D0 PAR_U44 ( .A1(sp_4), .A2(sp_13), .Z(PAR_n27) );
  XOR2D0 PAR_U43 ( .A1(PAR_n34), .A2(PAR_n27), .Z(s[0]) );
  XOR2D0 PAR_U42 ( .A1(sp_3), .A2(sp_2), .Z(PAR_n7) );
  XOR2D0 PAR_U41 ( .A1(PAR_n7), .A2(sp_1), .Z(PAR_n1) );
  XOR2D0 PAR_U40 ( .A1(PAR_n16), .A2(PAR_n1), .Z(PAR_n19) );
  XOR2D0 PAR_U39 ( .A1(PAR_n19), .A2(sp_7), .Z(s[10]) );
  XOR2D0 PAR_U38 ( .A1(sp_9), .A2(sp_7), .Z(PAR_n33) );
  XOR2D0 PAR_U37 ( .A1(sp_5), .A2(PAR_n33), .Z(PAR_n31) );
  XOR2D0 PAR_U36 ( .A1(sp_2), .A2(sp_11), .Z(PAR_n32) );
  XOR2D0 PAR_U35 ( .A1(PAR_n31), .A2(PAR_n32), .Z(s[11]) );
  XOR2D0 PAR_U34 ( .A1(sp_9), .A2(sp_4), .Z(PAR_n30) );
  XOR2D0 PAR_U33 ( .A1(sp_0), .A2(PAR_n30), .Z(PAR_n28) );
  XOR2D0 PAR_U32 ( .A1(sp_7), .A2(sp_8), .Z(PAR_n24) );
  XOR2D0 PAR_U31 ( .A1(sp_3), .A2(sp_12), .Z(PAR_n18) );
  XOR2D0 PAR_U30 ( .A1(PAR_n24), .A2(PAR_n18), .Z(PAR_n29) );
  XOR2D0 PAR_U29 ( .A1(PAR_n28), .A2(PAR_n29), .Z(s[12]) );
  XOR2D0 PAR_U28 ( .A1(PAR_n24), .A2(sp_5), .Z(PAR_n20) );
  XOR2D0 PAR_U27 ( .A1(PAR_n7), .A2(PAR_n20), .Z(PAR_n14) );
  XOR2D0 PAR_U26 ( .A1(PAR_n14), .A2(PAR_n23), .Z(PAR_n26) );
  XOR2D0 PAR_U25 ( .A1(PAR_n26), .A2(PAR_n27), .Z(s[13]) );
  XOR2D0 PAR_U24 ( .A1(sp_13), .A2(sp_0), .Z(PAR_n12) );
  XOR2D0 PAR_U23 ( .A1(PAR_n12), .A2(sp_4), .Z(PAR_n3) );
  XOR2D0 PAR_U22 ( .A1(sp_1), .A2(sp_11), .Z(PAR_n25) );
  XOR2D0 PAR_U21 ( .A1(PAR_n3), .A2(PAR_n25), .Z(PAR_n21) );
  XOR2D0 PAR_U20 ( .A1(PAR_n23), .A2(PAR_n24), .Z(PAR_n22) );
  XOR2D0 PAR_U19 ( .A1(PAR_n21), .A2(PAR_n22), .Z(s[1]) );
  XOR2D0 PAR_U18 ( .A1(PAR_n19), .A2(PAR_n20), .Z(s[2]) );
  XOR2D0 PAR_U17 ( .A1(sp_8), .A2(PAR_n3), .Z(PAR_n8) );
  XOR2D0 PAR_U16 ( .A1(PAR_n8), .A2(PAR_n16), .Z(PAR_n17) );
  XOR2D0 PAR_U15 ( .A1(PAR_n17), .A2(PAR_n18), .Z(s[3]) );
  XOR2D0 PAR_U14 ( .A1(PAR_n16), .A2(sp_13), .Z(PAR_n15) );
  XOR2D0 PAR_U13 ( .A1(PAR_n14), .A2(PAR_n15), .Z(s[4]) );
  XOR2D0 PAR_U12 ( .A1(PAR_n13), .A2(sp_2), .Z(s[5]) );
  XOR2D0 PAR_U11 ( .A1(sp_6), .A2(sp_11), .Z(PAR_n9) );
  XOR2D0 PAR_U10 ( .A1(PAR_n12), .A2(PAR_n9), .Z(PAR_n10) );
  XOR2D0 PAR_U9 ( .A1(sp_7), .A2(sp_12), .Z(PAR_n11) );
  XOR2D0 PAR_U8 ( .A1(PAR_n10), .A2(PAR_n11), .Z(PAR_n4) );
  XOR2D0 PAR_U7 ( .A1(PAR_n4), .A2(sp_10), .Z(s[6]) );
  XOR2D0 PAR_U6 ( .A1(PAR_n8), .A2(PAR_n9), .Z(PAR_n5) );
  XOR2D0 PAR_U5 ( .A1(PAR_n7), .A2(sp_9), .Z(PAR_n6) );
  XOR2D0 PAR_U4 ( .A1(PAR_n5), .A2(PAR_n6), .Z(s[7]) );
  XOR2D0 PAR_U3 ( .A1(PAR_n4), .A2(PAR_n1), .Z(s[8]) );
  XOR2D0 PAR_U2 ( .A1(PAR_n3), .A2(sp_5), .Z(PAR_n2) );
  XOR2D0 PAR_U1 ( .A1(PAR_n1), .A2(PAR_n2), .Z(s[9]) );
endmodule
