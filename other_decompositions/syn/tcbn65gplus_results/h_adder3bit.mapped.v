/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Fri May 13 10:50:09 2016
/////////////////////////////////////////////////////////////


module h_adder ( a, b, s );
  input [2:0] a;
  input [2:0] b;
  output [3:0] s;
  wire   n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57;

  OAI222D0 U35 ( .A1(n29), .A2(n30), .B1(n31), .B2(n32), .C1(n33), .C2(n34), 
        .ZN(s[3]) );
  CKND2D0 U36 ( .A1(n35), .A2(n36), .ZN(n32) );
  AOI21D0 U37 ( .A1(n37), .A2(n38), .B(n39), .ZN(n30) );
  CKND0 U38 ( .I(n31), .ZN(n37) );
  CKND0 U39 ( .I(n40), .ZN(n29) );
  OAI221D0 U40 ( .A1(n41), .A2(n40), .B1(n42), .B2(n31), .C(n43), .ZN(s[2]) );
  MUX2ND0 U41 ( .I0(n44), .I1(n45), .S(n38), .ZN(n43) );
  OAI22D0 U42 ( .A1(n31), .A2(n40), .B1(n46), .B2(n33), .ZN(n45) );
  OA21D0 U43 ( .A1(n47), .A2(n42), .B(n41), .Z(n33) );
  AOI21D0 U44 ( .A1(n31), .A2(n41), .B(n36), .ZN(n44) );
  OAI221D0 U45 ( .A1(n48), .A2(n40), .B1(n31), .B2(n34), .C(n49), .ZN(s[1]) );
  MUX2ND0 U46 ( .I0(n50), .I1(n51), .S(n47), .ZN(n49) );
  NR2D0 U47 ( .A1(n46), .A2(n42), .ZN(n51) );
  AOI31D0 U48 ( .A1(n48), .A2(n34), .A3(n52), .B(n53), .ZN(n50) );
  CKND0 U49 ( .I(n42), .ZN(n53) );
  AO21D0 U50 ( .A1(n40), .A2(n38), .B(n31), .Z(n52) );
  CKND2D0 U51 ( .A1(n46), .A2(n38), .ZN(n34) );
  OAI211D0 U52 ( .A1(n54), .A2(n40), .B(n55), .C(n56), .ZN(s[0]) );
  CKND0 U53 ( .I(n39), .ZN(n56) );
  NR2D0 U54 ( .A1(n41), .A2(n48), .ZN(n39) );
  IND2D0 U55 ( .A1(n38), .B1(n36), .ZN(n48) );
  CKND2D0 U56 ( .A1(n47), .A2(n42), .ZN(n41) );
  OAI211D0 U57 ( .A1(n47), .A2(n35), .B(n31), .C(n46), .ZN(n55) );
  CKND0 U58 ( .I(n36), .ZN(n46) );
  OAI21D0 U59 ( .A1(b[2]), .A2(a[2]), .B(n40), .ZN(n36) );
  CKND0 U60 ( .I(n57), .ZN(n47) );
  CKND2D0 U61 ( .A1(b[2]), .A2(a[2]), .ZN(n40) );
  NR2D0 U62 ( .A1(n31), .A2(n35), .ZN(n54) );
  CKND2D0 U63 ( .A1(n42), .A2(n38), .ZN(n35) );
  CKND2D0 U64 ( .A1(b[1]), .A2(a[1]), .ZN(n38) );
  XNR2D0 U65 ( .A1(b[1]), .A2(a[1]), .ZN(n42) );
  OAI21D0 U66 ( .A1(b[0]), .A2(a[0]), .B(n57), .ZN(n31) );
  CKND2D0 U67 ( .A1(b[0]), .A2(a[0]), .ZN(n57) );
endmodule

