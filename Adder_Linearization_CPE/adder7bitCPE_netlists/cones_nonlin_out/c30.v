// c30.v generated by perl script

module c30 (n__29, a__2, a__1, c, a__0, a__3);
	output n__29;
	wire n616, n607, n__5, n576, n645;
	input a__2, a__1, c, a__0, a__3;
  assign n__29 = ~(n607 | n616);
  assign n607 = ~(a__2 & n__5);
  assign n__5 = ~(n645 | n576);
  assign n645 = ~a__1;
  assign n576 = ~(a__0 & c);
  assign n616 = ~a__3;
endmodule