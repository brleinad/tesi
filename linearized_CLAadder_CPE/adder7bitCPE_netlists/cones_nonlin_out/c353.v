// c353.v generated by perl script

module c353 (n__352, b__5, b__4, b__2, a__1, b__1, a__3, a__6);
	output n__352;
	wire n441, n464, n__97, n583, n__34, n616, n578, n__3, n649, n645;
	input b__5, b__4, b__2, a__1, b__1, a__3, a__6;
  assign n__352 = ~(n464 | n441);
  assign n464 = ~(n__97 & b__5);
  assign n__97 = ~n583;
  assign n583 = ~(n__34 & b__4);
  assign n__34 = ~(n578 | n616);
  assign n578 = ~(n__3 & b__2);
  assign n__3 = ~(n645 | n649);
  assign n645 = ~a__1;
  assign n649 = ~b__1;
  assign n616 = ~a__3;
  assign n441 = ~a__6;
endmodule