// c325.v generated by perl script

module c325 (n__324, b__5, a__4, b__2, a__1, b__0, c, a__3, a__6);
	output n__324;
	wire n439, n492, n__69, n614, n__37, n616, n574, n__6, n570, n645;
	input b__5, a__4, b__2, a__1, b__0, c, a__3, a__6;
  assign n__324 = ~(n492 | n439);
  assign n492 = ~(n__69 & b__5);
  assign n__69 = ~n614;
  assign n614 = ~(n__37 & a__4);
  assign n__37 = ~(n574 | n616);
  assign n574 = ~(n__6 & b__2);
  assign n__6 = ~(n645 | n570);
  assign n645 = ~a__1;
  assign n570 = ~(c & b__0);
  assign n616 = ~a__3;
  assign n439 = ~a__6;
endmodule
