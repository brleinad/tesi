// c467.v generated by perl script

module c467 (n__466, b__6, b__5, a__4, b__2, a__1, b__0, c, b__3);
	output n__466;
	wire n477, n430, n__84, n598, n__52, n631, n574, n__6, n570, n645;
	input b__6, b__5, a__4, b__2, a__1, b__0, c, b__3;
  assign n__466 = ~(n430 | n477);
  assign n430 = ~b__6;
  assign n477 = ~(n__84 & b__5);
  assign n__84 = ~n598;
  assign n598 = ~(n__52 & a__4);
  assign n__52 = ~(n574 | n631);
  assign n574 = ~(n__6 & b__2);
  assign n__6 = ~(n645 | n570);
  assign n645 = ~a__1;
  assign n570 = ~(c & b__0);
  assign n631 = ~b__3;
endmodule
