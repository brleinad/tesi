
################# ckt2cones.pl

The verilog file: generator_mapped.v has been accepted
Process Begin...

The netlist is:
-------------------------------------
  input i__0, i__1, i__2, i__3, i__4, i__5, i__6;
  output c__0, c__1, c__2, c__3, c__4, c__5, c__6, c__7, c__8, c__9, c__10, c__11, c__12, c__13, c__14;
  wire   N2, n1, n2, n3, n4, n5, n6, n7;
  assign c__9 = N2 ^ c__5;
  assign N2 = c__2 ^ c__3;
  assign n4 = c__3 ^ c__4;
  assign c__10 = c__6 ^ n4;
  assign n3 = c__1 ^ c__4;
  assign c__8 = c__2 ^ n3;
  assign n2 = c__0 ^ c__1;
  assign c__11 = n7 ^ n4;
  assign n7 = c__5 ^ n2;
  assign c__7 = c__3 ^ n2;
  assign n1 = c__2 ^ c__6;
  assign c__14 = c__0 ^ n1;
  assign c__13 = n6 ^ n2;
  assign n6 = c__5 ^ n1;
  assign c__12 = n5 ^ n3;
  assign n5 = c__5 ^ n1;
