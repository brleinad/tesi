// c40.v generated by perl script

module c40 (n__39, b__2, c, a__0, b__1, a__3);
	output n__39;
	wire n616, n572, n__8, n649, n576;
	input b__2, c, a__0, b__1, a__3;
  assign n__39 = ~(n572 | n616);
  assign n572 = ~(n__8 & b__2);
  assign n__8 = ~(n576 | n649);
  assign n576 = ~(a__0 & c);
  assign n649 = ~b__1;
  assign n616 = ~a__3;
endmodule
