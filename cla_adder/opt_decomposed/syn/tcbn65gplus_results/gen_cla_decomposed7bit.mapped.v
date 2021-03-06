/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Mon Apr 18 15:23:11 2016
/////////////////////////////////////////////////////////////


module gen_nonlinear_part ( a, b, n );
  input [6:0] a;
  input [6:0] b;
  output [119:0] n;


  AN2D0 U1 ( .A1(b[5]), .A2(n[36]), .Z(n[99]) );
  AN2D0 U2 ( .A1(n[35]), .A2(b[5]), .Z(n[98]) );
  AN2D0 U3 ( .A1(n[34]), .A2(b[5]), .Z(n[97]) );
  AN2D0 U4 ( .A1(n[33]), .A2(b[5]), .Z(n[96]) );
  AN2D0 U5 ( .A1(n[32]), .A2(b[5]), .Z(n[95]) );
  AN2D0 U6 ( .A1(n[31]), .A2(b[5]), .Z(n[94]) );
  AN2D0 U7 ( .A1(n[30]), .A2(b[5]), .Z(n[93]) );
  AN2D0 U8 ( .A1(n[29]), .A2(b[5]), .Z(n[92]) );
  AN2D0 U9 ( .A1(n[28]), .A2(b[5]), .Z(n[91]) );
  AN2D0 U10 ( .A1(n[27]), .A2(b[5]), .Z(n[90]) );
  AN2D0 U11 ( .A1(n[26]), .A2(b[5]), .Z(n[89]) );
  AN2D0 U12 ( .A1(a[5]), .A2(n[56]), .Z(n[88]) );
  AN2D0 U13 ( .A1(n[55]), .A2(a[5]), .Z(n[87]) );
  AN2D0 U14 ( .A1(n[54]), .A2(a[5]), .Z(n[86]) );
  AN2D0 U15 ( .A1(n[53]), .A2(a[5]), .Z(n[85]) );
  AN2D0 U16 ( .A1(n[52]), .A2(a[5]), .Z(n[84]) );
  AN2D0 U17 ( .A1(n[51]), .A2(a[5]), .Z(n[83]) );
  AN2D0 U18 ( .A1(n[50]), .A2(a[5]), .Z(n[82]) );
  AN2D0 U19 ( .A1(n[49]), .A2(a[5]), .Z(n[81]) );
  AN2D0 U20 ( .A1(n[48]), .A2(a[5]), .Z(n[80]) );
  AN2D0 U21 ( .A1(n[47]), .A2(a[5]), .Z(n[79]) );
  AN2D0 U22 ( .A1(n[46]), .A2(a[5]), .Z(n[78]) );
  AN2D0 U23 ( .A1(n[45]), .A2(a[5]), .Z(n[77]) );
  AN2D0 U24 ( .A1(n[44]), .A2(a[5]), .Z(n[76]) );
  AN2D0 U25 ( .A1(n[43]), .A2(a[5]), .Z(n[75]) );
  AN2D0 U26 ( .A1(n[42]), .A2(a[5]), .Z(n[74]) );
  AN2D0 U27 ( .A1(n[41]), .A2(a[5]), .Z(n[73]) );
  AN2D0 U28 ( .A1(n[40]), .A2(a[5]), .Z(n[72]) );
  AN2D0 U29 ( .A1(n[39]), .A2(a[5]), .Z(n[71]) );
  AN2D0 U30 ( .A1(n[38]), .A2(a[5]), .Z(n[70]) );
  AN2D0 U31 ( .A1(n[37]), .A2(a[5]), .Z(n[69]) );
  AN2D0 U32 ( .A1(a[5]), .A2(n[36]), .Z(n[68]) );
  AN2D0 U33 ( .A1(a[5]), .A2(n[35]), .Z(n[67]) );
  AN2D0 U34 ( .A1(a[5]), .A2(n[34]), .Z(n[66]) );
  AN2D0 U35 ( .A1(a[5]), .A2(n[33]), .Z(n[65]) );
  AN2D0 U36 ( .A1(a[5]), .A2(n[32]), .Z(n[64]) );
  AN2D0 U37 ( .A1(a[5]), .A2(n[31]), .Z(n[63]) );
  AN2D0 U38 ( .A1(a[5]), .A2(n[30]), .Z(n[62]) );
  AN2D0 U39 ( .A1(a[5]), .A2(n[29]), .Z(n[61]) );
  AN2D0 U40 ( .A1(a[5]), .A2(n[28]), .Z(n[60]) );
  AN2D0 U41 ( .A1(a[5]), .A2(n[27]), .Z(n[59]) );
  AN2D0 U42 ( .A1(a[5]), .A2(n[26]), .Z(n[58]) );
  AN2D0 U43 ( .A1(a[5]), .A2(b[5]), .Z(n[57]) );
  AN2D0 U44 ( .A1(n[20]), .A2(a[4]), .Z(n[36]) );
  AN2D0 U45 ( .A1(a[4]), .A2(n[19]), .Z(n[35]) );
  AN2D0 U46 ( .A1(a[4]), .A2(n[18]), .Z(n[34]) );
  AN2D0 U47 ( .A1(a[4]), .A2(n[17]), .Z(n[33]) );
  AN2D0 U48 ( .A1(a[4]), .A2(n[16]), .Z(n[32]) );
  AN2D0 U49 ( .A1(a[4]), .A2(n[15]), .Z(n[31]) );
  AN2D0 U50 ( .A1(a[4]), .A2(n[14]), .Z(n[30]) );
  AN2D0 U51 ( .A1(a[4]), .A2(n[13]), .Z(n[29]) );
  AN2D0 U52 ( .A1(a[4]), .A2(n[12]), .Z(n[28]) );
  AN2D0 U53 ( .A1(a[4]), .A2(n[11]), .Z(n[27]) );
  AN2D0 U54 ( .A1(a[4]), .A2(b[4]), .Z(n[26]) );
  AN2D0 U55 ( .A1(n[56]), .A2(b[5]), .Z(n[119]) );
  AN2D0 U56 ( .A1(b[4]), .A2(n[25]), .Z(n[56]) );
  AN2D0 U57 ( .A1(n[55]), .A2(b[5]), .Z(n[118]) );
  AN2D0 U58 ( .A1(b[4]), .A2(n[24]), .Z(n[55]) );
  AN2D0 U59 ( .A1(n[54]), .A2(b[5]), .Z(n[117]) );
  AN2D0 U60 ( .A1(b[4]), .A2(n[23]), .Z(n[54]) );
  AN2D0 U61 ( .A1(n[53]), .A2(b[5]), .Z(n[116]) );
  AN2D0 U62 ( .A1(b[4]), .A2(n[22]), .Z(n[53]) );
  AN2D0 U63 ( .A1(n[52]), .A2(b[5]), .Z(n[115]) );
  AN2D0 U64 ( .A1(b[4]), .A2(n[21]), .Z(n[52]) );
  AN2D0 U65 ( .A1(n[51]), .A2(b[5]), .Z(n[114]) );
  AN2D0 U66 ( .A1(n[20]), .A2(b[4]), .Z(n[51]) );
  AN2D0 U67 ( .A1(n[5]), .A2(b[3]), .Z(n[20]) );
  AN2D0 U68 ( .A1(n[50]), .A2(b[5]), .Z(n[113]) );
  AN2D0 U69 ( .A1(n[19]), .A2(b[4]), .Z(n[50]) );
  AN2D0 U70 ( .A1(b[3]), .A2(n[4]), .Z(n[19]) );
  AN2D0 U71 ( .A1(n[49]), .A2(b[5]), .Z(n[112]) );
  AN2D0 U72 ( .A1(n[18]), .A2(b[4]), .Z(n[49]) );
  AN2D0 U73 ( .A1(n[10]), .A2(a[3]), .Z(n[18]) );
  AN2D0 U74 ( .A1(n[48]), .A2(b[5]), .Z(n[111]) );
  AN2D0 U75 ( .A1(n[17]), .A2(b[4]), .Z(n[48]) );
  AN2D0 U76 ( .A1(a[3]), .A2(n[9]), .Z(n[17]) );
  AN2D0 U77 ( .A1(n[47]), .A2(b[5]), .Z(n[110]) );
  AN2D0 U78 ( .A1(n[16]), .A2(b[4]), .Z(n[47]) );
  AN2D0 U79 ( .A1(a[3]), .A2(n[8]), .Z(n[16]) );
  AN2D0 U80 ( .A1(n[46]), .A2(b[5]), .Z(n[109]) );
  AN2D0 U81 ( .A1(n[15]), .A2(b[4]), .Z(n[46]) );
  AN2D0 U82 ( .A1(a[3]), .A2(n[7]), .Z(n[15]) );
  AN2D0 U83 ( .A1(n[45]), .A2(b[5]), .Z(n[108]) );
  AN2D0 U84 ( .A1(n[14]), .A2(b[4]), .Z(n[45]) );
  AN2D0 U85 ( .A1(a[3]), .A2(n[6]), .Z(n[14]) );
  AN2D0 U86 ( .A1(n[44]), .A2(b[5]), .Z(n[107]) );
  AN2D0 U87 ( .A1(n[13]), .A2(b[4]), .Z(n[44]) );
  AN2D0 U88 ( .A1(n[5]), .A2(a[3]), .Z(n[13]) );
  AN2D0 U89 ( .A1(n[1]), .A2(a[2]), .Z(n[5]) );
  AN2D0 U90 ( .A1(n[43]), .A2(b[5]), .Z(n[106]) );
  AN2D0 U91 ( .A1(n[12]), .A2(b[4]), .Z(n[43]) );
  AN2D0 U92 ( .A1(n[4]), .A2(a[3]), .Z(n[12]) );
  AN2D0 U93 ( .A1(b[2]), .A2(a[2]), .Z(n[4]) );
  AN2D0 U94 ( .A1(n[42]), .A2(b[5]), .Z(n[105]) );
  AN2D0 U95 ( .A1(n[11]), .A2(b[4]), .Z(n[42]) );
  AN2D0 U96 ( .A1(b[3]), .A2(a[3]), .Z(n[11]) );
  AN2D0 U97 ( .A1(n[41]), .A2(b[5]), .Z(n[104]) );
  AN2D0 U98 ( .A1(a[4]), .A2(n[25]), .Z(n[41]) );
  AN2D0 U99 ( .A1(b[3]), .A2(n[10]), .Z(n[25]) );
  AN2D0 U100 ( .A1(b[2]), .A2(n[3]), .Z(n[10]) );
  AN2D0 U101 ( .A1(n[40]), .A2(b[5]), .Z(n[103]) );
  AN2D0 U102 ( .A1(a[4]), .A2(n[24]), .Z(n[40]) );
  AN2D0 U103 ( .A1(b[3]), .A2(n[9]), .Z(n[24]) );
  AN2D0 U104 ( .A1(n[2]), .A2(b[2]), .Z(n[9]) );
  AN2D0 U105 ( .A1(n[39]), .A2(b[5]), .Z(n[102]) );
  AN2D0 U106 ( .A1(a[4]), .A2(n[23]), .Z(n[39]) );
  AN2D0 U107 ( .A1(b[3]), .A2(n[8]), .Z(n[23]) );
  AN2D0 U108 ( .A1(b[2]), .A2(n[1]), .Z(n[8]) );
  AN2D0 U109 ( .A1(a[1]), .A2(b[1]), .Z(n[1]) );
  AN2D0 U110 ( .A1(n[38]), .A2(b[5]), .Z(n[101]) );
  AN2D0 U111 ( .A1(a[4]), .A2(n[22]), .Z(n[38]) );
  AN2D0 U112 ( .A1(b[3]), .A2(n[7]), .Z(n[22]) );
  AN2D0 U113 ( .A1(a[2]), .A2(n[3]), .Z(n[7]) );
  AN2D0 U114 ( .A1(n[0]), .A2(b[1]), .Z(n[3]) );
  AN2D0 U115 ( .A1(n[37]), .A2(b[5]), .Z(n[100]) );
  AN2D0 U116 ( .A1(a[4]), .A2(n[21]), .Z(n[37]) );
  AN2D0 U117 ( .A1(b[3]), .A2(n[6]), .Z(n[21]) );
  AN2D0 U118 ( .A1(n[2]), .A2(a[2]), .Z(n[6]) );
  AN2D0 U119 ( .A1(n[0]), .A2(a[1]), .Z(n[2]) );
  AN2D0 U120 ( .A1(b[0]), .A2(a[0]), .Z(n[0]) );
endmodule


module gen_linear_part ( a, b, n, s );
  input [6:0] a;
  input [6:0] b;
  input [119:0] n;
  output [6:0] s;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;

  XOR3D0 U1 ( .A1(n1), .A2(n2), .A3(n[119]), .Z(s[6]) );
  XOR4D0 U2 ( .A1(a[6]), .A2(n3), .A3(n[114]), .A4(b[6]), .Z(n2) );
  XOR4D0 U3 ( .A1(n[109]), .A2(n[108]), .A3(n4), .A4(n5), .Z(n3) );
  XOR3D0 U4 ( .A1(n6), .A2(n7), .A3(n[107]), .Z(n5) );
  XOR4D0 U5 ( .A1(n[100]), .A2(n8), .A3(n[102]), .A4(n[101]), .Z(n7) );
  XOR4D0 U6 ( .A1(n[95]), .A2(n[94]), .A3(n9), .A4(n10), .Z(n8) );
  XOR3D0 U7 ( .A1(n11), .A2(n12), .A3(n[93]), .Z(n10) );
  XOR4D0 U8 ( .A1(n[86]), .A2(n13), .A3(n[88]), .A4(n[87]), .Z(n12) );
  XOR4D0 U9 ( .A1(n[81]), .A2(n[80]), .A3(n14), .A4(n15), .Z(n13) );
  XOR3D0 U10 ( .A1(n16), .A2(n17), .A3(n[79]), .Z(n15) );
  XOR4D0 U11 ( .A1(n[72]), .A2(n18), .A3(n[74]), .A4(n[73]), .Z(n17) );
  XOR4D0 U12 ( .A1(n[67]), .A2(n[66]), .A3(n19), .A4(n20), .Z(n18) );
  XOR3D0 U13 ( .A1(n21), .A2(n22), .A3(n[65]), .Z(n20) );
  XOR4D0 U14 ( .A1(n[58]), .A2(n[57]), .A3(n[60]), .A4(n[59]), .Z(n22) );
  XOR4D0 U15 ( .A1(n[62]), .A2(n[61]), .A3(n[64]), .A4(n[63]), .Z(n21) );
  XOR4D0 U16 ( .A1(n[69]), .A2(n[68]), .A3(n[71]), .A4(n[70]), .Z(n19) );
  XOR4D0 U17 ( .A1(n[76]), .A2(n[75]), .A3(n[78]), .A4(n[77]), .Z(n16) );
  XOR4D0 U18 ( .A1(n[83]), .A2(n[82]), .A3(n[85]), .A4(n[84]), .Z(n14) );
  XOR4D0 U19 ( .A1(n[90]), .A2(n[89]), .A3(n[92]), .A4(n[91]), .Z(n11) );
  XOR4D0 U20 ( .A1(n[97]), .A2(n[96]), .A3(n[99]), .A4(n[98]), .Z(n9) );
  XOR4D0 U21 ( .A1(n[104]), .A2(n[103]), .A3(n[106]), .A4(n[105]), .Z(n6) );
  XOR4D0 U22 ( .A1(n[111]), .A2(n[110]), .A3(n[113]), .A4(n[112]), .Z(n4) );
  XOR4D0 U23 ( .A1(n[116]), .A2(n[115]), .A3(n[118]), .A4(n[117]), .Z(n1) );
  XOR4D0 U24 ( .A1(n23), .A2(n24), .A3(n25), .A4(n[51]), .Z(s[5]) );
  XOR3D0 U25 ( .A1(n[54]), .A2(n[53]), .A3(n[52]), .Z(n25) );
  XOR4D0 U26 ( .A1(a[5]), .A2(n26), .A3(n[48]), .A4(b[5]), .Z(n24) );
  XOR4D0 U27 ( .A1(n[43]), .A2(n[42]), .A3(n27), .A4(n28), .Z(n26) );
  XOR3D0 U28 ( .A1(n29), .A2(n30), .A3(n[41]), .Z(n28) );
  XOR3D0 U29 ( .A1(n[36]), .A2(n[35]), .A3(n31), .Z(n30) );
  XOR3D0 U30 ( .A1(n32), .A2(n33), .A3(n[34]), .Z(n31) );
  XOR4D0 U31 ( .A1(n[27]), .A2(n[26]), .A3(n[29]), .A4(n[28]), .Z(n33) );
  XOR4D0 U32 ( .A1(n[31]), .A2(n[30]), .A3(n[33]), .A4(n[32]), .Z(n32) );
  XOR4D0 U33 ( .A1(n[38]), .A2(n[37]), .A3(n[40]), .A4(n[39]), .Z(n29) );
  XOR4D0 U34 ( .A1(n[45]), .A2(n[44]), .A3(n[47]), .A4(n[46]), .Z(n27) );
  XOR4D0 U35 ( .A1(n[50]), .A2(n[49]), .A3(n[56]), .A4(n[55]), .Z(n23) );
  XOR4D0 U36 ( .A1(b[4]), .A2(a[4]), .A3(n34), .A4(n35), .Z(s[4]) );
  XOR3D0 U37 ( .A1(n[21]), .A2(n[20]), .A3(n36), .Z(n35) );
  XOR3D0 U38 ( .A1(n37), .A2(n38), .A3(n[19]), .Z(n36) );
  XOR4D0 U39 ( .A1(n[12]), .A2(n[11]), .A3(n[14]), .A4(n[13]), .Z(n38) );
  XOR4D0 U40 ( .A1(n[16]), .A2(n[15]), .A3(n[18]), .A4(n[17]), .Z(n37) );
  XOR4D0 U41 ( .A1(n[23]), .A2(n[22]), .A3(n[25]), .A4(n[24]), .Z(n34) );
  XOR3D0 U42 ( .A1(n39), .A2(n40), .A3(n[9]), .Z(s[3]) );
  XOR4D0 U43 ( .A1(b[3]), .A2(a[3]), .A3(n[4]), .A4(n[10]), .Z(n40) );
  XOR4D0 U44 ( .A1(n[6]), .A2(n[5]), .A3(n[8]), .A4(n[7]), .Z(n39) );
  XOR3D0 U45 ( .A1(b[2]), .A2(a[2]), .A3(n41), .Z(s[2]) );
  XOR3D0 U46 ( .A1(n[3]), .A2(n[2]), .A3(n[1]), .Z(n41) );
  XOR3D0 U47 ( .A1(n[0]), .A2(b[1]), .A3(a[1]), .Z(s[1]) );
  XOR2D0 U48 ( .A1(b[0]), .A2(a[0]), .Z(s[0]) );
endmodule


module gen_cla_decomposed ( a, b, s );
  input [6:0] a;
  input [6:0] b;
  output [6:0] s;

  wire   [119:0] n;

  gen_nonlinear_part NLIN ( .a(a), .b(b), .n(n) );
  gen_linear_part LIN ( .a(a), .b(b), .n(n), .s(s) );
endmodule

