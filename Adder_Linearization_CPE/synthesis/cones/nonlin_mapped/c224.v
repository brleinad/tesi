// c224.v generated by perl script

module c224 (n__223, b__5, b__4, a__2, b__1, b__0, c, a__3);
	output n__223;
	wire n465, n__96, n584, n__33, n616, n579, n__9, n570, n649;
	input b__5, b__4, a__2, b__1, b__0, c, a__3;
  assign n__223 = ~n465;
  assign n465 = ~(n__96 & b__5);
  assign n__96 = ~n584;
  assign n584 = ~(n__33 & b__4);
  assign n__33 = ~(n579 | n616);
  assign n579 = ~(a__2 & n__9);
  assign n__9 = ~(n649 | n570);
  assign n649 = ~b__1;
  assign n570 = ~(c & b__0);
  assign n616 = ~a__3;
endmodule
