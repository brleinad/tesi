// c281.v generated by perl script

module c281 (n__280, a__5, b__4, b__3, a__3, a__6);
	output n__280;
	wire n435, n536, n__88, n593, n__25, n616, n631;
	input a__5, b__4, b__3, a__3, a__6;
  assign n__280 = ~(n536 | n435);
  assign n536 = ~(a__5 & n__88);
  assign n__88 = ~n593;
  assign n593 = ~(n__25 & b__4);
  assign n__25 = ~(n631 | n616);
  assign n631 = ~b__3;
  assign n616 = ~a__3;
  assign n435 = ~a__6;
endmodule
