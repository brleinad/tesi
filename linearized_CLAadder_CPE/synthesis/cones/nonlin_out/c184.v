// c184.v generated by perl script

module c184 (n__183, b__5, b__4, a__4);
	output n__183;
	wire n505, n__56, n632;
	input b__5, b__4, a__4;
  assign n__183 = ~n505;
  assign n505 = ~(n__56 & b__5);
  assign n__56 = ~n632;
  assign n632 = ~(a__4 & b__4);
endmodule