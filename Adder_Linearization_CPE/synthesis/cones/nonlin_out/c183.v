// c183.v generated by perl script

module c183 (n__182, a__5, b__4, b__2, b__1, b__0, c, b__3);
	output n__182;
	wire n506, n__118, n633, n__55, n631, n571, n__9, n570, n649;
	input a__5, b__4, b__2, b__1, b__0, c, b__3;
  assign n__182 = ~n506;
  assign n506 = ~(a__5 & n__118);
  assign n__118 = ~n633;
  assign n633 = ~(n__55 & b__4);
  assign n__55 = ~(n571 | n631);
  assign n571 = ~(n__9 & b__2);
  assign n__9 = ~(n649 | n570);
  assign n649 = ~b__1;
  assign n570 = ~(c & b__0);
  assign n631 = ~b__3;
endmodule
