// c366.v generated by perl script

module c366 (n__365, b__5, b__4, b__3, a__2, c, a__0, b__1, a__6);
	output n__365;
	wire n442, n451, n__110, n641, n__47, n580, n631, n__8, n649, n576;
	input b__5, b__4, b__3, a__2, c, a__0, b__1, a__6;
  assign n__365 = ~(n451 | n442);
  assign n451 = ~(n__110 & b__5);
  assign n__110 = ~n641;
  assign n641 = ~(n__47 & b__4);
  assign n__47 = ~(n631 | n580);
  assign n631 = ~b__3;
  assign n580 = ~(n__8 & a__2);
  assign n__8 = ~(n576 | n649);
  assign n576 = ~(a__0 & c);
  assign n649 = ~b__1;
  assign n442 = ~a__6;
endmodule
