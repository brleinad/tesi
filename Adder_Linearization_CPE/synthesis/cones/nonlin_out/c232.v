// c232.v generated by perl script

module c232 (n__231, b__5, b__4, b__3, b__2, a__2);
	output n__231;
	wire n457, n__104, n650, n__41, n629, n631;
	input b__5, b__4, b__3, b__2, a__2;
  assign n__231 = ~n457;
  assign n457 = ~(n__104 & b__5);
  assign n__104 = ~n650;
  assign n650 = ~(n__41 & b__4);
  assign n__41 = ~(n631 | n629);
  assign n631 = ~b__3;
  assign n629 = ~(a__2 & b__2);
endmodule
