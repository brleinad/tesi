/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Mon May 30 21:58:48 2016
/////////////////////////////////////////////////////////////


module decomposed_rca ( A, B, S );
  input [13:0] A;
  input [13:0] B;
  output [13:0] S;
  wire   L_PART_n1;
  wire   [10:0] r;
  wire   [36:0] nl;

  AN2D0 NL_PART_U37 ( .A1(B[0]), .A2(A[0]), .Z(nl[0]) );
  AN2D0 NL_PART_U36 ( .A1(A[4]), .A2(B[4]), .Z(nl[10]) );
  AN2D0 NL_PART_U35 ( .A1(A[4]), .A2(r[2]), .Z(nl[11]) );
  AN2D0 NL_PART_U34 ( .A1(r[2]), .A2(B[4]), .Z(nl[12]) );
  AN2D0 NL_PART_U33 ( .A1(A[5]), .A2(B[5]), .Z(nl[13]) );
  AN2D0 NL_PART_U32 ( .A1(A[5]), .A2(r[3]), .Z(nl[14]) );
  AN2D0 NL_PART_U31 ( .A1(r[3]), .A2(B[5]), .Z(nl[15]) );
  AN2D0 NL_PART_U30 ( .A1(A[6]), .A2(B[6]), .Z(nl[16]) );
  AN2D0 NL_PART_U29 ( .A1(A[6]), .A2(r[4]), .Z(nl[17]) );
  AN2D0 NL_PART_U28 ( .A1(r[4]), .A2(B[6]), .Z(nl[18]) );
  AN2D0 NL_PART_U27 ( .A1(A[7]), .A2(B[7]), .Z(nl[19]) );
  AN2D0 NL_PART_U26 ( .A1(A[1]), .A2(B[1]), .Z(nl[1]) );
  AN2D0 NL_PART_U25 ( .A1(A[7]), .A2(r[5]), .Z(nl[20]) );
  AN2D0 NL_PART_U24 ( .A1(r[5]), .A2(B[7]), .Z(nl[21]) );
  AN2D0 NL_PART_U23 ( .A1(A[8]), .A2(B[8]), .Z(nl[22]) );
  AN2D0 NL_PART_U22 ( .A1(A[8]), .A2(r[6]), .Z(nl[23]) );
  AN2D0 NL_PART_U21 ( .A1(r[6]), .A2(B[8]), .Z(nl[24]) );
  AN2D0 NL_PART_U20 ( .A1(A[9]), .A2(B[9]), .Z(nl[25]) );
  AN2D0 NL_PART_U19 ( .A1(A[9]), .A2(r[7]), .Z(nl[26]) );
  AN2D0 NL_PART_U18 ( .A1(r[7]), .A2(B[9]), .Z(nl[27]) );
  AN2D0 NL_PART_U17 ( .A1(A[10]), .A2(B[10]), .Z(nl[28]) );
  AN2D0 NL_PART_U16 ( .A1(A[10]), .A2(r[8]), .Z(nl[29]) );
  AN2D0 NL_PART_U15 ( .A1(A[1]), .A2(nl[0]), .Z(nl[2]) );
  AN2D0 NL_PART_U14 ( .A1(r[8]), .A2(B[10]), .Z(nl[30]) );
  AN2D0 NL_PART_U13 ( .A1(A[11]), .A2(B[11]), .Z(nl[31]) );
  AN2D0 NL_PART_U12 ( .A1(A[11]), .A2(r[9]), .Z(nl[32]) );
  AN2D0 NL_PART_U11 ( .A1(r[9]), .A2(B[11]), .Z(nl[33]) );
  AN2D0 NL_PART_U10 ( .A1(A[12]), .A2(B[12]), .Z(nl[34]) );
  AN2D0 NL_PART_U9 ( .A1(A[12]), .A2(r[10]), .Z(nl[35]) );
  AN2D0 NL_PART_U8 ( .A1(r[10]), .A2(B[12]), .Z(nl[36]) );
  AN2D0 NL_PART_U7 ( .A1(B[1]), .A2(nl[0]), .Z(nl[3]) );
  AN2D0 NL_PART_U6 ( .A1(A[2]), .A2(B[2]), .Z(nl[4]) );
  AN2D0 NL_PART_U5 ( .A1(A[2]), .A2(r[0]), .Z(nl[5]) );
  AN2D0 NL_PART_U4 ( .A1(r[0]), .A2(B[2]), .Z(nl[6]) );
  AN2D0 NL_PART_U3 ( .A1(A[3]), .A2(B[3]), .Z(nl[7]) );
  AN2D0 NL_PART_U2 ( .A1(A[3]), .A2(r[1]), .Z(nl[8]) );
  AN2D0 NL_PART_U1 ( .A1(r[1]), .A2(B[3]), .Z(nl[9]) );
  XOR3D0 L_PART_U26 ( .A1(nl[3]), .A2(nl[2]), .A3(nl[1]), .Z(r[0]) );
  XOR3D0 L_PART_U25 ( .A1(nl[33]), .A2(nl[32]), .A3(nl[31]), .Z(r[10]) );
  XOR3D0 L_PART_U24 ( .A1(nl[6]), .A2(nl[5]), .A3(nl[4]), .Z(r[1]) );
  XOR3D0 L_PART_U23 ( .A1(nl[9]), .A2(nl[8]), .A3(nl[7]), .Z(r[2]) );
  XOR3D0 L_PART_U22 ( .A1(nl[12]), .A2(nl[11]), .A3(nl[10]), .Z(r[3]) );
  XOR3D0 L_PART_U21 ( .A1(nl[15]), .A2(nl[14]), .A3(nl[13]), .Z(r[4]) );
  XOR3D0 L_PART_U20 ( .A1(nl[18]), .A2(nl[17]), .A3(nl[16]), .Z(r[5]) );
  XOR3D0 L_PART_U19 ( .A1(nl[21]), .A2(nl[20]), .A3(nl[19]), .Z(r[6]) );
  XOR3D0 L_PART_U18 ( .A1(nl[24]), .A2(nl[23]), .A3(nl[22]), .Z(r[7]) );
  XOR3D0 L_PART_U17 ( .A1(nl[27]), .A2(nl[26]), .A3(nl[25]), .Z(r[8]) );
  XOR3D0 L_PART_U16 ( .A1(nl[30]), .A2(nl[29]), .A3(nl[28]), .Z(r[9]) );
  XOR2D0 L_PART_U15 ( .A1(B[0]), .A2(A[0]), .Z(S[0]) );
  XOR3D0 L_PART_U14 ( .A1(B[10]), .A2(A[10]), .A3(r[8]), .Z(S[10]) );
  XOR3D0 L_PART_U13 ( .A1(B[11]), .A2(A[11]), .A3(r[9]), .Z(S[11]) );
  XOR3D0 L_PART_U12 ( .A1(B[12]), .A2(A[12]), .A3(r[10]), .Z(S[12]) );
  XOR3D0 L_PART_U11 ( .A1(nl[36]), .A2(nl[35]), .A3(nl[34]), .Z(L_PART_n1) );
  XOR3D0 L_PART_U10 ( .A1(B[13]), .A2(A[13]), .A3(L_PART_n1), .Z(S[13]) );
  XOR3D0 L_PART_U9 ( .A1(nl[0]), .A2(B[1]), .A3(A[1]), .Z(S[1]) );
  XOR3D0 L_PART_U8 ( .A1(B[2]), .A2(A[2]), .A3(r[0]), .Z(S[2]) );
  XOR3D0 L_PART_U7 ( .A1(B[3]), .A2(A[3]), .A3(r[1]), .Z(S[3]) );
  XOR3D0 L_PART_U6 ( .A1(B[4]), .A2(A[4]), .A3(r[2]), .Z(S[4]) );
  XOR3D0 L_PART_U5 ( .A1(B[5]), .A2(A[5]), .A3(r[3]), .Z(S[5]) );
  XOR3D0 L_PART_U4 ( .A1(B[6]), .A2(A[6]), .A3(r[4]), .Z(S[6]) );
  XOR3D0 L_PART_U3 ( .A1(B[7]), .A2(A[7]), .A3(r[5]), .Z(S[7]) );
  XOR3D0 L_PART_U2 ( .A1(B[8]), .A2(A[8]), .A3(r[6]), .Z(S[8]) );
  XOR3D0 L_PART_U1 ( .A1(B[9]), .A2(A[9]), .A3(r[7]), .Z(S[9]) );
endmodule

