// c309.v generated by perl script

module c309 (n__308, a__5, b__4, b__2, b__0, a__0, b__1, b__3, a__6);
	output n__308;
	wire n437, n508, n__116, n635, n__53, n631, n573, n__7, n649, n647;
	input a__5, b__4, b__2, b__0, a__0, b__1, b__3, a__6;
  assign n__308 = ~(n508 | n437);
  assign n508 = ~(a__5 & n__116);
  assign n__116 = ~n635;
  assign n635 = ~(n__53 & b__4);
  assign n__53 = ~(n573 | n631);
  assign n573 = ~(n__7 & b__2);
  assign n__7 = ~(n647 | n649);
  assign n647 = ~(a__0 & b__0);
  assign n649 = ~b__1;
  assign n631 = ~b__3;
  assign n437 = ~a__6;
endmodule