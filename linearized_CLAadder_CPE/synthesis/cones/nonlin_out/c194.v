// c194.v generated by perl script

module c194 (n__193, b__5, a__4, b__2, a__1, b__1, a__3);
	output n__193;
	wire n495, n__66, n618, n__34, n616, n578, n__3, n649, n645;
	input b__5, a__4, b__2, a__1, b__1, a__3;
  assign n__193 = ~n495;
  assign n495 = ~(n__66 & b__5);
  assign n__66 = ~n618;
  assign n618 = ~(a__4 & n__34);
  assign n__34 = ~(n578 | n616);
  assign n578 = ~(n__3 & b__2);
  assign n__3 = ~(n645 | n649);
  assign n645 = ~a__1;
  assign n649 = ~b__1;
  assign n616 = ~a__3;
endmodule
