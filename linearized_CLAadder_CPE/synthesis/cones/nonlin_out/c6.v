// c6.v generated by perl script

module c6 (n__5, a__1, c, a__0);
	output n__5;
	wire n576, n645;
	input a__1, c, a__0;
  assign n__5 = ~(n645 | n576);
  assign n645 = ~a__1;
  assign n576 = ~(a__0 & c);
endmodule