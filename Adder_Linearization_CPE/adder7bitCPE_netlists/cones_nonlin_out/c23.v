// c23.v generated by perl script

module c23 (n__22, b__2, b__0, a__0, b__1);
	output n__22;
	wire n573, n__7, n649, n647;
	input b__2, b__0, a__0, b__1;
  assign n__22 = ~n573;
  assign n573 = ~(n__7 & b__2);
  assign n__7 = ~(n647 | n649);
  assign n647 = ~(a__0 & b__0);
  assign n649 = ~b__1;
endmodule