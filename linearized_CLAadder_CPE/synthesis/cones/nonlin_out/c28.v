// c28.v generated by perl script

module c28 (n__27, a__2, a__1, b__1, a__3);
	output n__27;
	wire n616, n627, n__3, n649, n645;
	input a__2, a__1, b__1, a__3;
  assign n__27 = ~(n627 | n616);
  assign n627 = ~(a__2 & n__3);
  assign n__3 = ~(n645 | n649);
  assign n645 = ~a__1;
  assign n649 = ~b__1;
  assign n616 = ~a__3;
endmodule
