// c132.v generated by perl script

module c132 (n__131, a__5, a__4, b__2, b__0, a__0, a__1, a__3);
	output n__131;
	wire n557, n__67, n617, n__35, n616, n577, n__4, n645, n647;
	input a__5, a__4, b__2, b__0, a__0, a__1, a__3;
  assign n__131 = ~n557;
  assign n557 = ~(a__5 & n__67);
  assign n__67 = ~n617;
  assign n617 = ~(a__4 & n__35);
  assign n__35 = ~(n577 | n616);
  assign n577 = ~(n__4 & b__2);
  assign n__4 = ~(n647 | n645);
  assign n647 = ~(a__0 & b__0);
  assign n645 = ~a__1;
  assign n616 = ~a__3;
endmodule
