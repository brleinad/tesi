// c165.v generated by perl script

module c165 (n__164, a__5, b__4, b__2, a__1, b__0, c, a__3);
	output n__164;
	wire n524, n__100, n654, n__37, n616, n574, n__6, n570, n645;
	input a__5, b__4, b__2, a__1, b__0, c, a__3;
  assign n__164 = ~n524;
  assign n524 = ~(a__5 & n__100);
  assign n__100 = ~n654;
  assign n654 = ~(n__37 & b__4);
  assign n__37 = ~(n574 | n616);
  assign n574 = ~(n__6 & b__2);
  assign n__6 = ~(n645 | n570);
  assign n645 = ~a__1;
  assign n570 = ~(c & b__0);
  assign n616 = ~a__3;
endmodule
