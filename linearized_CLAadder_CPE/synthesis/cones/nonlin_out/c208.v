// c208.v generated by perl script

module c208 (n__207, b__5, a__4, b__3, a__2, b__1, b__0, c);
	output n__207;
	wire n481, n__80, n602, n__48, n579, n631, n__9, n570, n649;
	input b__5, a__4, b__3, a__2, b__1, b__0, c;
  assign n__207 = ~n481;
  assign n481 = ~(n__80 & b__5);
  assign n__80 = ~n602;
  assign n602 = ~(n__48 & a__4);
  assign n__48 = ~(n631 | n579);
  assign n631 = ~b__3;
  assign n579 = ~(a__2 & n__9);
  assign n__9 = ~(n649 | n570);
  assign n649 = ~b__1;
  assign n570 = ~(c & b__0);
endmodule