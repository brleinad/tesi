// c383.v generated by perl script

module c383 (n__382, b__6, a__5, a__4, a__2, b__0, a__0, b__1, a__3);
	output n__382;
	wire n561, n423, n__63, n622, n__31, n616, n585, n__7, n649, n647;
	input b__6, a__5, a__4, a__2, b__0, a__0, b__1, a__3;
  assign n__382 = ~(n423 | n561);
  assign n423 = ~b__6;
  assign n561 = ~(a__5 & n__63);
  assign n__63 = ~n622;
  assign n622 = ~(a__4 & n__31);
  assign n__31 = ~(n585 | n616);
  assign n585 = ~(n__7 & a__2);
  assign n__7 = ~(n647 | n649);
  assign n647 = ~(a__0 & b__0);
  assign n649 = ~b__1;
  assign n616 = ~a__3;
endmodule
