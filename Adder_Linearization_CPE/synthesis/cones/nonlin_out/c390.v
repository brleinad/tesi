// c390.v generated by perl script

module c390 (n__389, b__6, a__5, a__4, b__2, b__0, a__0, b__1, a__3);
	output n__389;
	wire n554, n424, n__70, n613, n__38, n616, n573, n__7, n649, n647;
	input b__6, a__5, a__4, b__2, b__0, a__0, b__1, a__3;
  assign n__389 = ~(n424 | n554);
  assign n424 = ~b__6;
  assign n554 = ~(a__5 & n__70);
  assign n__70 = ~n613;
  assign n613 = ~(n__38 & a__4);
  assign n__38 = ~(n573 | n616);
  assign n573 = ~(n__7 & b__2);
  assign n__7 = ~(n647 | n649);
  assign n647 = ~(a__0 & b__0);
  assign n649 = ~b__1;
  assign n616 = ~a__3;
endmodule
