// c285.v generated by perl script

module c285 (n__284, a__5, b__4, a__2, a__1, c, a__0, a__3, a__6);
	output n__284;
	wire n435, n532, n__92, n589, n__29, n616, n607, n__5, n576, n645;
	input a__5, b__4, a__2, a__1, c, a__0, a__3, a__6;
  assign n__284 = ~(n532 | n435);
  assign n532 = ~(a__5 & n__92);
  assign n__92 = ~n589;
  assign n589 = ~(n__29 & b__4);
  assign n__29 = ~(n607 | n616);
  assign n607 = ~(a__2 & n__5);
  assign n__5 = ~(n645 | n576);
  assign n645 = ~a__1;
  assign n576 = ~(a__0 & c);
  assign n616 = ~a__3;
  assign n435 = ~a__6;
endmodule
