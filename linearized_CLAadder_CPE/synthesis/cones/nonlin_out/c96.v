// c96.v generated by perl script

module c96 (n__95, b__4, a__2, c, a__0, b__1, a__3);
	output n__95;
	wire n586, n__32, n616, n580, n__8, n649, n576;
	input b__4, a__2, c, a__0, b__1, a__3;
  assign n__95 = ~n586;
  assign n586 = ~(n__32 & b__4);
  assign n__32 = ~(n580 | n616);
  assign n580 = ~(n__8 & a__2);
  assign n__8 = ~(n576 | n649);
  assign n576 = ~(a__0 & c);
  assign n649 = ~b__1;
  assign n616 = ~a__3;
endmodule