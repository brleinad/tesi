// c489.v generated by perl script

module c489 (n__488, b__6, b__5, b__4, b__3, a__2, b__0, a__0, a__1);
	output n__488;
	wire n455, n431, n__106, n646, n__43, n619, n631, n__4, n645, n647;
	input b__6, b__5, b__4, b__3, a__2, b__0, a__0, a__1;
  assign n__488 = ~(n431 | n455);
  assign n431 = ~b__6;
  assign n455 = ~(n__106 & b__5);
  assign n__106 = ~n646;
  assign n646 = ~(n__43 & b__4);
  assign n__43 = ~(n631 | n619);
  assign n631 = ~b__3;
  assign n619 = ~(a__2 & n__4);
  assign n__4 = ~(n647 | n645);
  assign n647 = ~(a__0 & b__0);
  assign n645 = ~a__1;
endmodule