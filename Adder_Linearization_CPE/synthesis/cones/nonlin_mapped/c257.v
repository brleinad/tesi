// c257.v generated by perl script

module c257 (n__256, a__5, a__4, a__2, c, a__0, b__1, a__3, a__6);
	output n__256;
	wire n433, n560, n__64, n621, n__32, n616, n580, n__8, n649, n576;
	input a__5, a__4, a__2, c, a__0, b__1, a__3, a__6;
  assign n__256 = ~(n560 | n433);
  assign n560 = ~(a__5 & n__64);
  assign n__64 = ~n621;
  assign n621 = ~(a__4 & n__32);
  assign n__32 = ~(n580 | n616);
  assign n580 = ~(n__8 & a__2);
  assign n__8 = ~(n576 | n649);
  assign n576 = ~(a__0 & c);
  assign n649 = ~b__1;
  assign n616 = ~a__3;
  assign n433 = ~a__6;
endmodule