// c154.v generated by perl script

module c154 (n__153, a__5, b__4, b__2, a__2, a__3);
	output n__153;
	wire n535, n__89, n592, n__26, n616, n629;
	input a__5, b__4, b__2, a__2, a__3;
  assign n__153 = ~n535;
  assign n535 = ~(a__5 & n__89);
  assign n__89 = ~n592;
  assign n592 = ~(n__26 & b__4);
  assign n__26 = ~(n629 | n616);
  assign n629 = ~(a__2 & b__2);
  assign n616 = ~a__3;
endmodule