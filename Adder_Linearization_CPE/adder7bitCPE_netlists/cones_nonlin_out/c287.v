// c287.v generated by perl script

module c287 (n__286, a__5, b__4, a__2, b__0, a__0, b__1, a__3, a__6);
	output n__286;
	wire n436, n530, n__94, n587, n__31, n616, n585, n__7, n649, n647;
	input a__5, b__4, a__2, b__0, a__0, b__1, a__3, a__6;
  assign n__286 = ~(n530 | n436);
  assign n530 = ~(a__5 & n__94);
  assign n__94 = ~n587;
  assign n587 = ~(n__31 & b__4);
  assign n__31 = ~(n585 | n616);
  assign n585 = ~(n__7 & a__2);
  assign n__7 = ~(n647 | n649);
  assign n647 = ~(a__0 & b__0);
  assign n649 = ~b__1;
  assign n616 = ~a__3;
  assign n436 = ~a__6;
endmodule
