// c12.v generated by perl script

module c12 (n__11, a__2, a__1, b__1);
	output n__11;
	wire n627, n__3, n649, n645;
	input a__2, a__1, b__1;
  assign n__11 = ~n627;
  assign n627 = ~(a__2 & n__3);
  assign n__3 = ~(n645 | n649);
  assign n645 = ~a__1;
  assign n649 = ~b__1;
endmodule