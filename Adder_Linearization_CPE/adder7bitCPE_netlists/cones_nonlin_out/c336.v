// c336.v generated by perl script

module c336 (n__335, b__5, a__4, b__3, a__2, b__1, b__0, c, a__6);
	output n__335;
	wire n439, n481, n__80, n602, n__48, n579, n631, n__9, n570, n649;
	input b__5, a__4, b__3, a__2, b__1, b__0, c, a__6;
  assign n__335 = ~(n481 | n439);
  assign n481 = ~(n__80 & b__5);
  assign n__80 = ~n602;
  assign n602 = ~(n__48 & a__4);
  assign n__48 = ~(n631 | n579);
  assign n631 = ~b__3;
  assign n579 = ~(a__2 & n__9);
  assign n__9 = ~(n649 | n570);
  assign n649 = ~b__1;
  assign n570 = ~(c & b__0);
  assign n439 = ~a__6;
endmodule