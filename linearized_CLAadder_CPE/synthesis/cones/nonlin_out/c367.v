// c367.v generated by perl script

module c367 (n__366, b__5, b__4, b__3, a__2, b__1, b__0, c, a__6);
	output n__366;
	wire n442, n450, n__111, n640, n__48, n579, n631, n__9, n570, n649;
	input b__5, b__4, b__3, a__2, b__1, b__0, c, a__6;
  assign n__366 = ~(n450 | n442);
  assign n450 = ~(n__111 & b__5);
  assign n__111 = ~n640;
  assign n640 = ~(n__48 & b__4);
  assign n__48 = ~(n631 | n579);
  assign n631 = ~b__3;
  assign n579 = ~(a__2 & n__9);
  assign n__9 = ~(n649 | n570);
  assign n649 = ~b__1;
  assign n570 = ~(c & b__0);
  assign n442 = ~a__6;
endmodule
