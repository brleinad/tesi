/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Mon Apr 18 16:27:22 2016
/////////////////////////////////////////////////////////////


module nand2 ( a, b, c );
  input a, b;
  output c;


  CKND2D0 U2 ( .A1(b), .A2(a), .ZN(c) );
endmodule

