// c120.v generated by perl script

module c120 (n__119, b__5, a__5);
	output n__119;
	wire n569;
	input b__5, a__5;
  assign n__119 = ~n569;
  assign n569 = ~(a__5 & b__5);
endmodule