// c153.v generated by perl script

module c153 (n__152, a__5, b__4, b__3, a__3);
	output n__152;
	wire n536, n__88, n593, n__25, n616, n631;
	input a__5, b__4, b__3, a__3;
  assign n__152 = ~n536;
  assign n536 = ~(a__5 & n__88);
  assign n__88 = ~n593;
  assign n593 = ~(n__25 & b__4);
  assign n__25 = ~(n631 | n616);
  assign n631 = ~b__3;
  assign n616 = ~a__3;
endmodule
