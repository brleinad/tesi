// c441.v generated by perl script

module c441 (n__440, b__6, b__5, a__4, b__2, a__2, a__3);
	output n__440;
	wire n503, n428, n__58, n628, n__26, n616, n629;
	input b__6, b__5, a__4, b__2, a__2, a__3;
  assign n__440 = ~(n428 | n503);
  assign n428 = ~b__6;
  assign n503 = ~(n__58 & b__5);
  assign n__58 = ~n628;
  assign n628 = ~(a__4 & n__26);
  assign n__26 = ~(n629 | n616);
  assign n629 = ~(a__2 & b__2);
  assign n616 = ~a__3;
endmodule