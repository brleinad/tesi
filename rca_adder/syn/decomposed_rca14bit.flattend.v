/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Mon May 30 21:58:48 2016
/////////////////////////////////////////////////////////////


module decomposed_rca ( A, B, S );
  input [13:0] A;
  input [13:0] B;
  output [13:0] S;
  wire   L_PART_n1, r_0, r_1, r_2, r_3, r_4, r_5, r_6, r_7, r_8, r_9, r_10, nl_0, nl_1, nl_2, nl_3, nl_4, nl_5, nl_6, nl_7, nl_8, nl_9, nl_10, nl_11, nl_12, nl_13, nl_14, nl_15, nl_16, nl_17, nl_18, nl_19, nl_20, nl_21, nl_22, nl_23, nl_24, nl_25, nl_26, nl_27, nl_28, nl_29, nl_30, nl_31, nl_32, nl_33, nl_34, nl_35, nl_36;

  AN2D0 NL_PART_U37 ( .A1(B[0]), .A2(A[0]), .Z(nl_0) );
  AN2D0 NL_PART_U36 ( .A1(A[4]), .A2(B[4]), .Z(nl_10) );
  AN2D0 NL_PART_U35 ( .A1(A[4]), .A2(r_2), .Z(nl_11) );
  AN2D0 NL_PART_U34 ( .A1(r_2), .A2(B[4]), .Z(nl_12) );
  AN2D0 NL_PART_U33 ( .A1(A[5]), .A2(B[5]), .Z(nl_13) );
  AN2D0 NL_PART_U32 ( .A1(A[5]), .A2(r_3), .Z(nl_14) );
  AN2D0 NL_PART_U31 ( .A1(r_3), .A2(B[5]), .Z(nl_15) );
  AN2D0 NL_PART_U30 ( .A1(A[6]), .A2(B[6]), .Z(nl_16) );
  AN2D0 NL_PART_U29 ( .A1(A[6]), .A2(r_4), .Z(nl_17) );
  AN2D0 NL_PART_U28 ( .A1(r_4), .A2(B[6]), .Z(nl_18) );
  AN2D0 NL_PART_U27 ( .A1(A[7]), .A2(B[7]), .Z(nl_19) );
  AN2D0 NL_PART_U26 ( .A1(A[1]), .A2(B[1]), .Z(nl_1) );
  AN2D0 NL_PART_U25 ( .A1(A[7]), .A2(r_5), .Z(nl_20) );
  AN2D0 NL_PART_U24 ( .A1(r_5), .A2(B[7]), .Z(nl_21) );
  AN2D0 NL_PART_U23 ( .A1(A[8]), .A2(B[8]), .Z(nl_22) );
  AN2D0 NL_PART_U22 ( .A1(A[8]), .A2(r_6), .Z(nl_23) );
  AN2D0 NL_PART_U21 ( .A1(r_6), .A2(B[8]), .Z(nl_24) );
  AN2D0 NL_PART_U20 ( .A1(A[9]), .A2(B[9]), .Z(nl_25) );
  AN2D0 NL_PART_U19 ( .A1(A[9]), .A2(r_7), .Z(nl_26) );
  AN2D0 NL_PART_U18 ( .A1(r_7), .A2(B[9]), .Z(nl_27) );
  AN2D0 NL_PART_U17 ( .A1(A[10]), .A2(B[10]), .Z(nl_28) );
  AN2D0 NL_PART_U16 ( .A1(A[10]), .A2(r_8), .Z(nl_29) );
  AN2D0 NL_PART_U15 ( .A1(A[1]), .A2(nl_0), .Z(nl_2) );
  AN2D0 NL_PART_U14 ( .A1(r_8), .A2(B[10]), .Z(nl_30) );
  AN2D0 NL_PART_U13 ( .A1(A[11]), .A2(B[11]), .Z(nl_31) );
  AN2D0 NL_PART_U12 ( .A1(A[11]), .A2(r_9), .Z(nl_32) );
  AN2D0 NL_PART_U11 ( .A1(r_9), .A2(B[11]), .Z(nl_33) );
  AN2D0 NL_PART_U10 ( .A1(A[12]), .A2(B[12]), .Z(nl_34) );
  AN2D0 NL_PART_U9 ( .A1(A[12]), .A2(r_10), .Z(nl_35) );
  AN2D0 NL_PART_U8 ( .A1(r_10), .A2(B[12]), .Z(nl_36) );
  AN2D0 NL_PART_U7 ( .A1(B[1]), .A2(nl_0), .Z(nl_3) );
  AN2D0 NL_PART_U6 ( .A1(A[2]), .A2(B[2]), .Z(nl_4) );
  AN2D0 NL_PART_U5 ( .A1(A[2]), .A2(r_0), .Z(nl_5) );
  AN2D0 NL_PART_U4 ( .A1(r_0), .A2(B[2]), .Z(nl_6) );
  AN2D0 NL_PART_U3 ( .A1(A[3]), .A2(B[3]), .Z(nl_7) );
  AN2D0 NL_PART_U2 ( .A1(A[3]), .A2(r_1), .Z(nl_8) );
  AN2D0 NL_PART_U1 ( .A1(r_1), .A2(B[3]), .Z(nl_9) );
  XOR3D0 L_PART_U26 ( .A1(nl_3), .A2(nl_2), .A3(nl_1), .Z(r_0) );
  XOR3D0 L_PART_U25 ( .A1(nl_33), .A2(nl_32), .A3(nl_31), .Z(r_10) );
  XOR3D0 L_PART_U24 ( .A1(nl_6), .A2(nl_5), .A3(nl_4), .Z(r_1) );
  XOR3D0 L_PART_U23 ( .A1(nl_9), .A2(nl_8), .A3(nl_7), .Z(r_2) );
  XOR3D0 L_PART_U22 ( .A1(nl_12), .A2(nl_11), .A3(nl_10), .Z(r_3) );
  XOR3D0 L_PART_U21 ( .A1(nl_15), .A2(nl_14), .A3(nl_13), .Z(r_4) );
  XOR3D0 L_PART_U20 ( .A1(nl_18), .A2(nl_17), .A3(nl_16), .Z(r_5) );
  XOR3D0 L_PART_U19 ( .A1(nl_21), .A2(nl_20), .A3(nl_19), .Z(r_6) );
  XOR3D0 L_PART_U18 ( .A1(nl_24), .A2(nl_23), .A3(nl_22), .Z(r_7) );
  XOR3D0 L_PART_U17 ( .A1(nl_27), .A2(nl_26), .A3(nl_25), .Z(r_8) );
  XOR3D0 L_PART_U16 ( .A1(nl_30), .A2(nl_29), .A3(nl_28), .Z(r_9) );
  XOR2D0 L_PART_U15 ( .A1(B[0]), .A2(A[0]), .Z(S[0]) );
  XOR3D0 L_PART_U14 ( .A1(B[10]), .A2(A[10]), .A3(r_8), .Z(S[10]) );
  XOR3D0 L_PART_U13 ( .A1(B[11]), .A2(A[11]), .A3(r_9), .Z(S[11]) );
  XOR3D0 L_PART_U12 ( .A1(B[12]), .A2(A[12]), .A3(r_10), .Z(S[12]) );
  XOR3D0 L_PART_U11 ( .A1(nl_36), .A2(nl_35), .A3(nl_34), .Z(L_PART_n1) );
  XOR3D0 L_PART_U10 ( .A1(B[13]), .A2(A[13]), .A3(L_PART_n1), .Z(S[13]) );
  XOR3D0 L_PART_U9 ( .A1(nl_0), .A2(B[1]), .A3(A[1]), .Z(S[1]) );
  XOR3D0 L_PART_U8 ( .A1(B[2]), .A2(A[2]), .A3(r_0), .Z(S[2]) );
  XOR3D0 L_PART_U7 ( .A1(B[3]), .A2(A[3]), .A3(r_1), .Z(S[3]) );
  XOR3D0 L_PART_U6 ( .A1(B[4]), .A2(A[4]), .A3(r_2), .Z(S[4]) );
  XOR3D0 L_PART_U5 ( .A1(B[5]), .A2(A[5]), .A3(r_3), .Z(S[5]) );
  XOR3D0 L_PART_U4 ( .A1(B[6]), .A2(A[6]), .A3(r_4), .Z(S[6]) );
  XOR3D0 L_PART_U3 ( .A1(B[7]), .A2(A[7]), .A3(r_5), .Z(S[7]) );
  XOR3D0 L_PART_U2 ( .A1(B[8]), .A2(A[8]), .A3(r_6), .Z(S[8]) );
  XOR3D0 L_PART_U1 ( .A1(B[9]), .A2(A[9]), .A3(r_7), .Z(S[9]) );
endmodule

