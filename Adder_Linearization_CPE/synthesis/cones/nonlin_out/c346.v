// c346.v generated by perl script

module c346 (n__345, b__5, b__4, a__2, a__1, b__1, a__3, a__6);
	output n__345;
	wire n440, n471, n__90, n591, n__27, n616, n627, n__3, n649, n645;
	input b__5, b__4, a__2, a__1, b__1, a__3, a__6;
  assign n__345 = ~(n471 | n440);
  assign n471 = ~(n__90 & b__5);
  assign n__90 = ~n591;
  assign n591 = ~(n__27 & b__4);
  assign n__27 = ~(n627 | n616);
  assign n627 = ~(a__2 & n__3);
  assign n__3 = ~(n645 | n649);
  assign n645 = ~a__1;
  assign n649 = ~b__1;
  assign n616 = ~a__3;
  assign n440 = ~a__6;
endmodule
