// c465.v generated by perl script

module c465 (n__464, b__6, b__5, a__4, b__3, b__2, b__0, a__0, a__1);
	output n__464;
	wire n479, n430, n__82, n600, n__50, n577, n631, n__4, n645, n647;
	input b__6, b__5, a__4, b__3, b__2, b__0, a__0, a__1;
  assign n__464 = ~(n430 | n479);
  assign n430 = ~b__6;
  assign n479 = ~(n__82 & b__5);
  assign n__82 = ~n600;
  assign n600 = ~(n__50 & a__4);
  assign n__50 = ~(n631 | n577);
  assign n631 = ~b__3;
  assign n577 = ~(n__4 & b__2);
  assign n__4 = ~(n647 | n645);
  assign n647 = ~(a__0 & b__0);
  assign n645 = ~a__1;
endmodule
