// c470.v generated by perl script

module c470 (n__469, b__6, b__5, a__4, b__2, b__1, b__0, c, b__3);
	output n__469;
	wire n474, n430, n__87, n594, n__55, n631, n571, n__9, n570, n649;
	input b__6, b__5, a__4, b__2, b__1, b__0, c, b__3;
  assign n__469 = ~(n430 | n474);
  assign n430 = ~b__6;
  assign n474 = ~(n__87 & b__5);
  assign n__87 = ~n594;
  assign n594 = ~(a__4 & n__55);
  assign n__55 = ~(n571 | n631);
  assign n571 = ~(n__9 & b__2);
  assign n__9 = ~(n649 | n570);
  assign n649 = ~b__1;
  assign n570 = ~(c & b__0);
  assign n631 = ~b__3;
endmodule