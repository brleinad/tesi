// c455.v generated by perl script

module c455 (n__454, b__6, b__5, a__4, b__2, b__1, b__0, c, a__3);
	output n__454;
	wire n489, n429, n__72, n611, n__40, n616, n571, n__9, n570, n649;
	input b__6, b__5, a__4, b__2, b__1, b__0, c, a__3;
  assign n__454 = ~(n429 | n489);
  assign n429 = ~b__6;
  assign n489 = ~(n__72 & b__5);
  assign n__72 = ~n611;
  assign n611 = ~(n__40 & a__4);
  assign n__40 = ~(n571 | n616);
  assign n571 = ~(n__9 & b__2);
  assign n__9 = ~(n649 | n570);
  assign n649 = ~b__1;
  assign n570 = ~(c & b__0);
  assign n616 = ~a__3;
endmodule
