// c108.v generated by perl script

module c108 (n__107, b__4, b__3, a__2, a__1, c, a__0);
	output n__107;
	wire n644, n__44, n607, n631, n__5, n576, n645;
	input b__4, b__3, a__2, a__1, c, a__0;
  assign n__107 = ~n644;
  assign n644 = ~(n__44 & b__4);
  assign n__44 = ~(n631 | n607);
  assign n631 = ~b__3;
  assign n607 = ~(a__2 & n__5);
  assign n__5 = ~(n645 | n576);
  assign n645 = ~a__1;
  assign n576 = ~(a__0 & c);
endmodule
