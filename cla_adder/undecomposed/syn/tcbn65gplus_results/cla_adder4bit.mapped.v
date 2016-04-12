
module cla_adder ( a, b, s, cin, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] s;
  input cin;
  output cout;
  wire   N0, N1, N2;
  wire   [2:0] g;
  wire   [3:0] p;
  wire   [3:1] c;

  XOR2D1 C38 ( .A1(p[0]), .A2(cin), .Z(s[0]) );
  XOR2D1 C37 ( .A1(p[1]), .A2(c[1]), .Z(s[1]) );
  XOR2D1 C36 ( .A1(p[2]), .A2(c[2]), .Z(s[2]) );
  XOR2D1 C35 ( .A1(p[3]), .A2(c[3]), .Z(s[3]) );
  AN2D0 C34 ( .A1(p[2]), .A2(c[2]), .Z(N2) );
  OR2D1 C33 ( .A1(g[2]), .A2(N2), .Z(c[3]) );
  AN2D0 C32 ( .A1(p[1]), .A2(c[1]), .Z(N1) );
  OR2D1 C31 ( .A1(g[1]), .A2(N1), .Z(c[2]) );
  AN2D0 C30 ( .A1(p[0]), .A2(cin), .Z(N0) );
  OR2D1 C29 ( .A1(g[0]), .A2(N0), .Z(c[1]) );
  XOR2D1 C28 ( .A1(a[0]), .A2(b[0]), .Z(p[0]) );
  XOR2D1 C27 ( .A1(a[1]), .A2(b[1]), .Z(p[1]) );
  XOR2D1 C26 ( .A1(a[2]), .A2(b[2]), .Z(p[2]) );
  XOR2D1 C25 ( .A1(a[3]), .A2(b[3]), .Z(p[3]) );
  AN2D0 C24 ( .A1(a[0]), .A2(b[0]), .Z(g[0]) );
  AN2D0 C23 ( .A1(a[1]), .A2(b[1]), .Z(g[1]) );
  AN2D0 C22 ( .A1(a[2]), .A2(b[2]), .Z(g[2]) );
endmodule

