// c216.v generated by perl script

module c216 (n__215, b__5, b__4, b__3, a__3);
	output n__215;
	wire n473, n__88, n593, n__25, n616, n631;
	input b__5, b__4, b__3, a__3;
  assign n__215 = ~n473;
  assign n473 = ~(n__88 & b__5);
  assign n__88 = ~n593;
  assign n593 = ~(n__25 & b__4);
  assign n__25 = ~(n631 | n616);
  assign n631 = ~b__3;
  assign n616 = ~a__3;
endmodule