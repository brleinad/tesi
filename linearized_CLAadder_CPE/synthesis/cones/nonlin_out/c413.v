// c413.v generated by perl script

module c413 (n__412, b__6, a__5, b__4, a__2, a__1, b__0, c, a__3);
	output n__412;
	wire n531, n426, n__93, n588, n__30, n616, n596, n__6, n570, n645;
	input b__6, a__5, b__4, a__2, a__1, b__0, c, a__3;
  assign n__412 = ~(n426 | n531);
  assign n426 = ~b__6;
  assign n531 = ~(a__5 & n__93);
  assign n__93 = ~n588;
  assign n588 = ~(n__30 & b__4);
  assign n__30 = ~(n596 | n616);
  assign n596 = ~(n__6 & a__2);
  assign n__6 = ~(n645 | n570);
  assign n645 = ~a__1;
  assign n570 = ~(c & b__0);
  assign n616 = ~a__3;
endmodule
