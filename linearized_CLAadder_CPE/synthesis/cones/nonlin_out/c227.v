// c227.v generated by perl script

module c227 (n__226, b__5, b__4, a__3, b__2, a__1, c, a__0);
	output n__226;
	wire n462, n__99, n581, n__36, n575, n616, n__5, n576, n645;
	input b__5, b__4, a__3, b__2, a__1, c, a__0;
  assign n__226 = ~n462;
  assign n462 = ~(n__99 & b__5);
  assign n__99 = ~n581;
  assign n581 = ~(b__4 & n__36);
  assign n__36 = ~(n616 | n575);
  assign n616 = ~a__3;
  assign n575 = ~(b__2 & n__5);
  assign n__5 = ~(n645 | n576);
  assign n645 = ~a__1;
  assign n576 = ~(a__0 & c);
endmodule