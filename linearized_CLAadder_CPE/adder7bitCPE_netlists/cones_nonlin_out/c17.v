// c17.v generated by perl script

module c17 (n__16, a__2, c, a__0, b__1);
	output n__16;
	wire n580, n__8, n649, n576;
	input a__2, c, a__0, b__1;
  assign n__16 = ~n580;
  assign n580 = ~(n__8 & a__2);
  assign n__8 = ~(n576 | n649);
  assign n576 = ~(a__0 & c);
  assign n649 = ~b__1;
endmodule
