// c83.v generated by perl script

module c83 (n__82, a__4, b__3, b__2, b__0, a__0, a__1);
	output n__82;
	wire n600, n__50, n577, n631, n__4, n645, n647;
	input a__4, b__3, b__2, b__0, a__0, a__1;
  assign n__82 = ~n600;
  assign n600 = ~(n__50 & a__4);
  assign n__50 = ~(n631 | n577);
  assign n631 = ~b__3;
  assign n577 = ~(n__4 & b__2);
  assign n__4 = ~(n647 | n645);
  assign n647 = ~(a__0 & b__0);
  assign n645 = ~a__1;
endmodule
