// c301.v generated by perl script

module c301 (n__300, a__5, b__4, b__3, a__2, a__1, b__0, c, a__6);
	output n__300;
	wire n437, n516, n__108, n643, n__45, n596, n631, n__6, n570, n645;
	input a__5, b__4, b__3, a__2, a__1, b__0, c, a__6;
  assign n__300 = ~(n516 | n437);
  assign n516 = ~(a__5 & n__108);
  assign n__108 = ~n643;
  assign n643 = ~(n__45 & b__4);
  assign n__45 = ~(n631 | n596);
  assign n631 = ~b__3;
  assign n596 = ~(n__6 & a__2);
  assign n__6 = ~(n645 | n570);
  assign n645 = ~a__1;
  assign n570 = ~(c & b__0);
  assign n437 = ~a__6;
endmodule
