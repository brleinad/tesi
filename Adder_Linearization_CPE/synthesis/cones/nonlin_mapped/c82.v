// c82.v generated by perl script

module c82 (n__81, a__4, b__3, b__2, a__1, b__1);
	output n__81;
	wire n601, n__49, n578, n631, n__3, n649, n645;
	input a__4, b__3, b__2, a__1, b__1;
  assign n__81 = ~n601;
  assign n601 = ~(n__49 & a__4);
  assign n__49 = ~(n631 | n578);
  assign n631 = ~b__3;
  assign n578 = ~(n__3 & b__2);
  assign n__3 = ~(n645 | n649);
  assign n645 = ~a__1;
  assign n649 = ~b__1;
endmodule
