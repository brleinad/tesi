// c369.v generated by perl script

module c369 (n__368, b__5, b__4, b__3, b__2, b__0, a__0, a__1, a__6);
	output n__368;
	wire n442, n448, n__113, n638, n__50, n577, n631, n__4, n645, n647;
	input b__5, b__4, b__3, b__2, b__0, a__0, a__1, a__6;
  assign n__368 = ~(n448 | n442);
  assign n448 = ~(n__113 & b__5);
  assign n__113 = ~n638;
  assign n638 = ~(n__50 & b__4);
  assign n__50 = ~(n631 | n577);
  assign n631 = ~b__3;
  assign n577 = ~(n__4 & b__2);
  assign n__4 = ~(n647 | n645);
  assign n647 = ~(a__0 & b__0);
  assign n645 = ~a__1;
  assign n442 = ~a__6;
endmodule