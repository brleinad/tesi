// c290.v generated by perl script

module c290 (n__289, a__5, b__4, b__2, a__1, b__1, a__3, a__6);
	output n__289;
	wire n436, n527, n__97, n583, n__34, n616, n578, n__3, n649, n645;
	input a__5, b__4, b__2, a__1, b__1, a__3, a__6;
  assign n__289 = ~(n527 | n436);
  assign n527 = ~(a__5 & n__97);
  assign n__97 = ~n583;
  assign n583 = ~(n__34 & b__4);
  assign n__34 = ~(n578 | n616);
  assign n578 = ~(n__3 & b__2);
  assign n__3 = ~(n645 | n649);
  assign n645 = ~a__1;
  assign n649 = ~b__1;
  assign n616 = ~a__3;
  assign n436 = ~a__6;
endmodule
