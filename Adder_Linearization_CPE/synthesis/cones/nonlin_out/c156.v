// c156.v generated by perl script

module c156 (n__155, a__5, b__4, a__2, b__0, a__0, a__1, a__3);
	output n__155;
	wire n533, n__91, n590, n__28, n616, n619, n__4, n645, n647;
	input a__5, b__4, a__2, b__0, a__0, a__1, a__3;
  assign n__155 = ~n533;
  assign n533 = ~(a__5 & n__91);
  assign n__91 = ~n590;
  assign n590 = ~(n__28 & b__4);
  assign n__28 = ~(n619 | n616);
  assign n619 = ~(a__2 & n__4);
  assign n__4 = ~(n647 | n645);
  assign n647 = ~(a__0 & b__0);
  assign n645 = ~a__1;
  assign n616 = ~a__3;
endmodule
