// c484.v generated by perl script

module c484 (n__483, b__6, b__5, b__4, b__2, b__0, a__0, b__1, a__3);
	output n__483;
	wire n460, n431, n__101, n653, n__38, n616, n573, n__7, n649, n647;
	input b__6, b__5, b__4, b__2, b__0, a__0, b__1, a__3;
  assign n__483 = ~(n431 | n460);
  assign n431 = ~b__6;
  assign n460 = ~(n__101 & b__5);
  assign n__101 = ~n653;
  assign n653 = ~(n__38 & b__4);
  assign n__38 = ~(n573 | n616);
  assign n573 = ~(n__7 & b__2);
  assign n__7 = ~(n647 | n649);
  assign n647 = ~(a__0 & b__0);
  assign n649 = ~b__1;
  assign n616 = ~a__3;
endmodule
