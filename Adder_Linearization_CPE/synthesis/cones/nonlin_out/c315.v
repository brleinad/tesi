// c315.v generated by perl script

module c315 (n__314, b__5, a__4, a__2, a__1, b__1, a__3, a__6);
	output n__314;
	wire n438, n502, n__59, n626, n__27, n616, n627, n__3, n649, n645;
	input b__5, a__4, a__2, a__1, b__1, a__3, a__6;
  assign n__314 = ~(n502 | n438);
  assign n502 = ~(n__59 & b__5);
  assign n__59 = ~n626;
  assign n626 = ~(a__4 & n__27);
  assign n__27 = ~(n627 | n616);
  assign n627 = ~(a__2 & n__3);
  assign n__3 = ~(n645 | n649);
  assign n645 = ~a__1;
  assign n649 = ~b__1;
  assign n616 = ~a__3;
  assign n438 = ~a__6;
endmodule
