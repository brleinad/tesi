// c2.v generated by perl script

module c2 (n__1, c, a__0);
	output n__1;
	wire n576;
	input c, a__0;
  assign n__1 = ~n576;
  assign n576 = ~(a__0 & c);
endmodule