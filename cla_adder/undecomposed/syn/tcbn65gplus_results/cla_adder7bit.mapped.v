
module cla_adder ( a, b, s, cin, cout );
  input [6:0] a;
  input [6:0] b;
  output [6:0] s;
  input cin;
  output cout;
  wire   N0, N1, N2, N3, N4, N5;
  wire   [5:0] g;
  wire   [6:0] p;
  wire   [6:1] c;

  XOR2D1 C65 ( .A1(p[0]), .A2(cin), .Z(s[0]) );
  XOR2D1 C64 ( .A1(p[1]), .A2(c[1]), .Z(s[1]) );
  XOR2D1 C63 ( .A1(p[2]), .A2(c[2]), .Z(s[2]) );
  XOR2D1 C62 ( .A1(p[3]), .A2(c[3]), .Z(s[3]) );
  XOR2D1 C61 ( .A1(p[4]), .A2(c[4]), .Z(s[4]) );
  XOR2D1 C60 ( .A1(p[5]), .A2(c[5]), .Z(s[5]) );
  XOR2D1 C59 ( .A1(p[6]), .A2(c[6]), .Z(s[6]) );
  AN2D0 C58 ( .A1(p[5]), .A2(c[5]), .Z(N5) );
  OR2D1 C57 ( .A1(g[5]), .A2(N5), .Z(c[6]) );
  AN2D0 C56 ( .A1(p[4]), .A2(c[4]), .Z(N4) );
  OR2D1 C55 ( .A1(g[4]), .A2(N4), .Z(c[5]) );
  AN2D0 C54 ( .A1(p[3]), .A2(c[3]), .Z(N3) );
  OR2D1 C53 ( .A1(g[3]), .A2(N3), .Z(c[4]) );
  AN2D0 C52 ( .A1(p[2]), .A2(c[2]), .Z(N2) );
  OR2D1 C51 ( .A1(g[2]), .A2(N2), .Z(c[3]) );
  AN2D0 C50 ( .A1(p[1]), .A2(c[1]), .Z(N1) );
  OR2D1 C49 ( .A1(g[1]), .A2(N1), .Z(c[2]) );
  AN2D0 C48 ( .A1(p[0]), .A2(cin), .Z(N0) );
  OR2D1 C47 ( .A1(g[0]), .A2(N0), .Z(c[1]) );
  XOR2D1 C46 ( .A1(a[0]), .A2(b[0]), .Z(p[0]) );
  XOR2D1 C45 ( .A1(a[1]), .A2(b[1]), .Z(p[1]) );
  XOR2D1 C44 ( .A1(a[2]), .A2(b[2]), .Z(p[2]) );
  XOR2D1 C43 ( .A1(a[3]), .A2(b[3]), .Z(p[3]) );
  XOR2D1 C42 ( .A1(a[4]), .A2(b[4]), .Z(p[4]) );
  XOR2D1 C41 ( .A1(a[5]), .A2(b[5]), .Z(p[5]) );
  XOR2D1 C40 ( .A1(a[6]), .A2(b[6]), .Z(p[6]) );
  AN2D0 C39 ( .A1(a[0]), .A2(b[0]), .Z(g[0]) );
  AN2D0 C38 ( .A1(a[1]), .A2(b[1]), .Z(g[1]) );
  AN2D0 C37 ( .A1(a[2]), .A2(b[2]), .Z(g[2]) );
  AN2D0 C36 ( .A1(a[3]), .A2(b[3]), .Z(g[3]) );
  AN2D0 C35 ( .A1(a[4]), .A2(b[4]), .Z(g[4]) );
  AN2D0 C34 ( .A1(a[5]), .A2(b[5]), .Z(g[5]) );
endmodule

