// c457.v generated by perl script

module c457 (n__456, b__6, b__5, a__4, b__3, a__2, a__1, b__1);
	output n__456;
	wire n487, n429, n__74, n609, n__42, n627, n631, n__3, n649, n645;
	input b__6, b__5, a__4, b__3, a__2, a__1, b__1;
  assign n__456 = ~(n429 | n487);
  assign n429 = ~b__6;
  assign n487 = ~(n__74 & b__5);
  assign n__74 = ~n609;
  assign n609 = ~(n__42 & a__4);
  assign n__42 = ~(n631 | n627);
  assign n631 = ~b__3;
  assign n627 = ~(a__2 & n__3);
  assign n__3 = ~(n645 | n649);
  assign n645 = ~a__1;
  assign n649 = ~b__1;
endmodule