// c29.v generated by perl script

module c29 (n__28, a__2, b__0, a__0, a__1, a__3);
	output n__28;
	wire n616, n619, n__4, n645, n647;
	input a__2, b__0, a__0, a__1, a__3;
  assign n__28 = ~(n619 | n616);
  assign n619 = ~(a__2 & n__4);
  assign n__4 = ~(n647 | n645);
  assign n647 = ~(a__0 & b__0);
  assign n645 = ~a__1;
  assign n616 = ~a__3;
endmodule
