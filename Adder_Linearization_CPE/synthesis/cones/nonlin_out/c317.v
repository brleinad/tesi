// c317.v generated by perl script

module c317 (n__316, b__5, a__4, a__2, a__1, c, a__0, a__3, a__6);
	output n__316;
	wire n438, n500, n__61, n624, n__29, n616, n607, n__5, n576, n645;
	input b__5, a__4, a__2, a__1, c, a__0, a__3, a__6;
  assign n__316 = ~(n500 | n438);
  assign n500 = ~(n__61 & b__5);
  assign n__61 = ~n624;
  assign n624 = ~(a__4 & n__29);
  assign n__29 = ~(n607 | n616);
  assign n607 = ~(a__2 & n__5);
  assign n__5 = ~(n645 | n576);
  assign n645 = ~a__1;
  assign n576 = ~(a__0 & c);
  assign n616 = ~a__3;
  assign n438 = ~a__6;
endmodule
