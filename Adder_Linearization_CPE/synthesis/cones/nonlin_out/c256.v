// c256.v generated by perl script

module c256 (n__255, a__5, a__4, a__2, b__0, a__0, b__1, a__3, a__6);
	output n__255;
	wire n433, n561, n__63, n622, n__31, n616, n585, n__7, n649, n647;
	input a__5, a__4, a__2, b__0, a__0, b__1, a__3, a__6;
  assign n__255 = ~(n561 | n433);
  assign n561 = ~(a__5 & n__63);
  assign n__63 = ~n622;
  assign n622 = ~(a__4 & n__31);
  assign n__31 = ~(n585 | n616);
  assign n585 = ~(n__7 & a__2);
  assign n__7 = ~(n647 | n649);
  assign n647 = ~(a__0 & b__0);
  assign n649 = ~b__1;
  assign n616 = ~a__3;
  assign n433 = ~a__6;
endmodule