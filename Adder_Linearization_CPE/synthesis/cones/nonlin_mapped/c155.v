// c155.v generated by perl script

module c155 (n__154, a__5, b__4, a__2, a__1, b__1, a__3);
	output n__154;
	wire n534, n__90, n591, n__27, n616, n627, n__3, n649, n645;
	input a__5, b__4, a__2, a__1, b__1, a__3;
  assign n__154 = ~n534;
  assign n534 = ~(a__5 & n__90);
  assign n__90 = ~n591;
  assign n591 = ~(n__27 & b__4);
  assign n__27 = ~(n627 | n616);
  assign n627 = ~(a__2 & n__3);
  assign n__3 = ~(n645 | n649);
  assign n645 = ~a__1;
  assign n649 = ~b__1;
  assign n616 = ~a__3;
endmodule
