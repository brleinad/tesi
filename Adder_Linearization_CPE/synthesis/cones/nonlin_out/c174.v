// c174.v generated by perl script

module c174 (n__173, a__5, b__4, b__3, a__2, b__0, a__0, b__1);
	output n__173;
	wire n515, n__109, n642, n__46, n585, n631, n__7, n649, n647;
	input a__5, b__4, b__3, a__2, b__0, a__0, b__1;
  assign n__173 = ~n515;
  assign n515 = ~(a__5 & n__109);
  assign n__109 = ~n642;
  assign n642 = ~(n__46 & b__4);
  assign n__46 = ~(n631 | n585);
  assign n631 = ~b__3;
  assign n585 = ~(n__7 & a__2);
  assign n__7 = ~(n647 | n649);
  assign n647 = ~(a__0 & b__0);
  assign n649 = ~b__1;
endmodule
