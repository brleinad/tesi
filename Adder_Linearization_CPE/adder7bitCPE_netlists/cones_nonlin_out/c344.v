// c344.v generated by perl script

module c344 (n__343, b__5, b__4, b__3, a__3, a__6);
	output n__343;
	wire n440, n473, n__88, n593, n__25, n616, n631;
	input b__5, b__4, b__3, a__3, a__6;
  assign n__343 = ~(n473 | n440);
  assign n473 = ~(n__88 & b__5);
  assign n__88 = ~n593;
  assign n593 = ~(n__25 & b__4);
  assign n__25 = ~(n631 | n616);
  assign n631 = ~b__3;
  assign n616 = ~a__3;
  assign n440 = ~a__6;
endmodule
