// c321.v generated by perl script

module c321 (n__320, b__5, a__4, a__2, b__1, b__0, c, a__3, a__6);
	output n__320;
	wire n438, n496, n__65, n620, n__33, n616, n579, n__9, n570, n649;
	input b__5, a__4, a__2, b__1, b__0, c, a__3, a__6;
  assign n__320 = ~(n496 | n438);
  assign n496 = ~(n__65 & b__5);
  assign n__65 = ~n620;
  assign n620 = ~(a__4 & n__33);
  assign n__33 = ~(n579 | n616);
  assign n579 = ~(a__2 & n__9);
  assign n__9 = ~(n649 | n570);
  assign n649 = ~b__1;
  assign n570 = ~(c & b__0);
  assign n616 = ~a__3;
  assign n438 = ~a__6;
endmodule
