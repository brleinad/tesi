// c101.v generated by perl script

module c101 (n__100, b__4, b__2, a__1, b__0, c, a__3);
	output n__100;
	wire n654, n__37, n616, n574, n__6, n570, n645;
	input b__4, b__2, a__1, b__0, c, a__3;
  assign n__100 = ~n654;
  assign n654 = ~(n__37 & b__4);
  assign n__37 = ~(n574 | n616);
  assign n574 = ~(n__6 & b__2);
  assign n__6 = ~(n645 | n570);
  assign n645 = ~a__1;
  assign n570 = ~(c & b__0);
  assign n616 = ~a__3;
endmodule
