// c122.v generated by perl script

module c122 (n__121, a__5, a__4, b__3, a__3);
	output n__121;
	wire n567, n__57, n630, n__25, n616, n631;
	input a__5, a__4, b__3, a__3;
  assign n__121 = ~n567;
  assign n567 = ~(a__5 & n__57);
  assign n__57 = ~n630;
  assign n630 = ~(a__4 & n__25);
  assign n__25 = ~(n631 | n616);
  assign n631 = ~b__3;
  assign n616 = ~a__3;
endmodule