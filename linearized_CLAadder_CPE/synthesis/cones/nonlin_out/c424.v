// c424.v generated by perl script

module c424 (n__423, b__6, a__5, b__4, b__3, b__2, a__2);
	output n__423;
	wire n520, n426, n__104, n650, n__41, n629, n631;
	input b__6, a__5, b__4, b__3, b__2, a__2;
  assign n__423 = ~(n426 | n520);
  assign n426 = ~b__6;
  assign n520 = ~(a__5 & n__104);
  assign n__104 = ~n650;
  assign n650 = ~(n__41 & b__4);
  assign n__41 = ~(n631 | n629);
  assign n631 = ~b__3;
  assign n629 = ~(a__2 & b__2);
endmodule
