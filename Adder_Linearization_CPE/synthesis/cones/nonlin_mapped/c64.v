// c64.v generated by perl script

module c64 (n__63, a__4, a__2, b__0, a__0, b__1, a__3);
	output n__63;
	wire n622, n__31, n616, n585, n__7, n649, n647;
	input a__4, a__2, b__0, a__0, b__1, a__3;
  assign n__63 = ~n622;
  assign n622 = ~(a__4 & n__31);
  assign n__31 = ~(n585 | n616);
  assign n585 = ~(n__7 & a__2);
  assign n__7 = ~(n647 | n649);
  assign n647 = ~(a__0 & b__0);
  assign n649 = ~b__1;
  assign n616 = ~a__3;
endmodule