// c26.v generated by perl script

module c26 (n__25, b__3, a__3);
	output n__25;
	wire n616, n631;
	input b__3, a__3;
  assign n__25 = ~(n631 | n616);
  assign n631 = ~b__3;
  assign n616 = ~a__3;
endmodule
