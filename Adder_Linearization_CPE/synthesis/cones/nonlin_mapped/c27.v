// c27.v generated by perl script

module c27 (n__26, b__2, a__2, a__3);
	output n__26;
	wire n616, n629;
	input b__2, a__2, a__3;
  assign n__26 = ~(n629 | n616);
  assign n629 = ~(a__2 & b__2);
  assign n616 = ~a__3;
endmodule