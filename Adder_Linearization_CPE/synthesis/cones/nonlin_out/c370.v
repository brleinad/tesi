// c370.v generated by perl script

module c370 (n__369, b__5, b__4, b__3, b__2, a__1, c, a__0, a__6);
	output n__369;
	wire n442, n447, n__114, n637, n__51, n575, n631, n__5, n576, n645;
	input b__5, b__4, b__3, b__2, a__1, c, a__0, a__6;
  assign n__369 = ~(n447 | n442);
  assign n447 = ~(n__114 & b__5);
  assign n__114 = ~n637;
  assign n637 = ~(n__51 & b__4);
  assign n__51 = ~(n631 | n575);
  assign n631 = ~b__3;
  assign n575 = ~(b__2 & n__5);
  assign n__5 = ~(n645 | n576);
  assign n645 = ~a__1;
  assign n576 = ~(a__0 & c);
  assign n442 = ~a__6;
endmodule
