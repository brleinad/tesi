// c65.v generated by perl script

module c65 (n__64, a__4, a__2, c, a__0, b__1, a__3);
	output n__64;
	wire n621, n__32, n616, n580, n__8, n649, n576;
	input a__4, a__2, c, a__0, b__1, a__3;
  assign n__64 = ~n621;
  assign n621 = ~(a__4 & n__32);
  assign n__32 = ~(n580 | n616);
  assign n580 = ~(n__8 & a__2);
  assign n__8 = ~(n576 | n649);
  assign n576 = ~(a__0 & c);
  assign n649 = ~b__1;
  assign n616 = ~a__3;
endmodule