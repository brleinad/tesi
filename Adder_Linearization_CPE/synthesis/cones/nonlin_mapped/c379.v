// c379.v generated by perl script

module c379 (n__378, b__6, a__5, a__4, a__2, a__1, b__1, a__3);
	output n__378;
	wire n565, n423, n__59, n626, n__27, n616, n627, n__3, n649, n645;
	input b__6, a__5, a__4, a__2, a__1, b__1, a__3;
  assign n__378 = ~(n423 | n565);
  assign n423 = ~b__6;
  assign n565 = ~(a__5 & n__59);
  assign n__59 = ~n626;
  assign n626 = ~(a__4 & n__27);
  assign n__27 = ~(n627 | n616);
  assign n627 = ~(a__2 & n__3);
  assign n__3 = ~(n645 | n649);
  assign n645 = ~a__1;
  assign n649 = ~b__1;
  assign n616 = ~a__3;
endmodule
