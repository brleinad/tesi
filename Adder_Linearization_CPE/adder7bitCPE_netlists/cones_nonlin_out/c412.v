// c412.v generated by perl script

module c412 (n__411, b__6, a__5, b__4, a__2, a__1, c, a__0, a__3);
	output n__411;
	wire n532, n425, n__92, n589, n__29, n616, n607, n__5, n576, n645;
	input b__6, a__5, b__4, a__2, a__1, c, a__0, a__3;
  assign n__411 = ~(n425 | n532);
  assign n425 = ~b__6;
  assign n532 = ~(a__5 & n__92);
  assign n__92 = ~n589;
  assign n589 = ~(n__29 & b__4);
  assign n__29 = ~(n607 | n616);
  assign n607 = ~(a__2 & n__5);
  assign n__5 = ~(n645 | n576);
  assign n645 = ~a__1;
  assign n576 = ~(a__0 & c);
  assign n616 = ~a__3;
endmodule
