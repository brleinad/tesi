// c75.v generated by perl script

module c75 (n__74, a__4, b__3, a__2, a__1, b__1);
	output n__74;
	wire n609, n__42, n627, n631, n__3, n649, n645;
	input a__4, b__3, a__2, a__1, b__1;
  assign n__74 = ~n609;
  assign n609 = ~(n__42 & a__4);
  assign n__42 = ~(n631 | n627);
  assign n631 = ~b__3;
  assign n627 = ~(a__2 & n__3);
  assign n__3 = ~(n645 | n649);
  assign n645 = ~a__1;
  assign n649 = ~b__1;
endmodule