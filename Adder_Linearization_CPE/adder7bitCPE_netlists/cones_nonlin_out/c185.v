// c185.v generated by perl script

module c185 (n__184, b__5, a__4, b__3, a__3);
	output n__184;
	wire n504, n__57, n630, n__25, n616, n631;
	input b__5, a__4, b__3, a__3;
  assign n__184 = ~n504;
  assign n504 = ~(n__57 & b__5);
  assign n__57 = ~n630;
  assign n630 = ~(a__4 & n__25);
  assign n__25 = ~(n631 | n616);
  assign n631 = ~b__3;
  assign n616 = ~a__3;
endmodule