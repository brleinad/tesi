// c143.v generated by perl script

module c143 (n__142, a__5, a__4, b__3, a__2, b__0, a__0, b__1);
	output n__142;
	wire n546, n__78, n604, n__46, n585, n631, n__7, n649, n647;
	input a__5, a__4, b__3, a__2, b__0, a__0, b__1;
  assign n__142 = ~n546;
  assign n546 = ~(a__5 & n__78);
  assign n__78 = ~n604;
  assign n604 = ~(n__46 & a__4);
  assign n__46 = ~(n631 | n585);
  assign n631 = ~b__3;
  assign n585 = ~(n__7 & a__2);
  assign n__7 = ~(n647 | n649);
  assign n647 = ~(a__0 & b__0);
  assign n649 = ~b__1;
endmodule