
module cla_adder ( a, b, s, cin, cout );
  input [8:0] a;
  input [8:0] b;
  output [8:0] s;
  input cin;
  output cout;
  wire   N0, N1, N2, N3, N4, N5, N6, N7;
  wire   [7:0] g;
  wire   [8:0] p;
  wire   [8:1] c;

  XOR2D1 C83 ( .A1(p[0]), .A2(cin), .Z(s[0]) );
  XOR2D1 C82 ( .A1(p[1]), .A2(c[1]), .Z(s[1]) );
  XOR2D1 C81 ( .A1(p[2]), .A2(c[2]), .Z(s[2]) );
  XOR2D1 C80 ( .A1(p[3]), .A2(c[3]), .Z(s[3]) );
  XOR2D1 C79 ( .A1(p[4]), .A2(c[4]), .Z(s[4]) );
  XOR2D1 C78 ( .A1(p[5]), .A2(c[5]), .Z(s[5]) );
  XOR2D1 C77 ( .A1(p[6]), .A2(c[6]), .Z(s[6]) );
  XOR2D1 C76 ( .A1(p[7]), .A2(c[7]), .Z(s[7]) );
  XOR2D1 C75 ( .A1(p[8]), .A2(c[8]), .Z(s[8]) );
  AN2D0 C74 ( .A1(p[7]), .A2(c[7]), .Z(N7) );
  OR2D1 C73 ( .A1(g[7]), .A2(N7), .Z(c[8]) );
  AN2D0 C72 ( .A1(p[6]), .A2(c[6]), .Z(N6) );
  OR2D1 C71 ( .A1(g[6]), .A2(N6), .Z(c[7]) );
  AN2D0 C70 ( .A1(p[5]), .A2(c[5]), .Z(N5) );
  OR2D1 C69 ( .A1(g[5]), .A2(N5), .Z(c[6]) );
  AN2D0 C68 ( .A1(p[4]), .A2(c[4]), .Z(N4) );
  OR2D1 C67 ( .A1(g[4]), .A2(N4), .Z(c[5]) );
  AN2D0 C66 ( .A1(p[3]), .A2(c[3]), .Z(N3) );
  OR2D1 C65 ( .A1(g[3]), .A2(N3), .Z(c[4]) );
  AN2D0 C64 ( .A1(p[2]), .A2(c[2]), .Z(N2) );
  OR2D1 C63 ( .A1(g[2]), .A2(N2), .Z(c[3]) );
  AN2D0 C62 ( .A1(p[1]), .A2(c[1]), .Z(N1) );
  OR2D1 C61 ( .A1(g[1]), .A2(N1), .Z(c[2]) );
  AN2D0 C60 ( .A1(p[0]), .A2(cin), .Z(N0) );
  OR2D1 C59 ( .A1(g[0]), .A2(N0), .Z(c[1]) );
  XOR2D1 C58 ( .A1(a[0]), .A2(b[0]), .Z(p[0]) );
  XOR2D1 C57 ( .A1(a[1]), .A2(b[1]), .Z(p[1]) );
  XOR2D1 C56 ( .A1(a[2]), .A2(b[2]), .Z(p[2]) );
  XOR2D1 C55 ( .A1(a[3]), .A2(b[3]), .Z(p[3]) );
  XOR2D1 C54 ( .A1(a[4]), .A2(b[4]), .Z(p[4]) );
  XOR2D1 C53 ( .A1(a[5]), .A2(b[5]), .Z(p[5]) );
  XOR2D1 C52 ( .A1(a[6]), .A2(b[6]), .Z(p[6]) );
  XOR2D1 C51 ( .A1(a[7]), .A2(b[7]), .Z(p[7]) );
  XOR2D1 C50 ( .A1(a[8]), .A2(b[8]), .Z(p[8]) );
  AN2D0 C49 ( .A1(a[0]), .A2(b[0]), .Z(g[0]) );
  AN2D0 C48 ( .A1(a[1]), .A2(b[1]), .Z(g[1]) );
  AN2D0 C47 ( .A1(a[2]), .A2(b[2]), .Z(g[2]) );
  AN2D0 C46 ( .A1(a[3]), .A2(b[3]), .Z(g[3]) );
  AN2D0 C45 ( .A1(a[4]), .A2(b[4]), .Z(g[4]) );
  AN2D0 C44 ( .A1(a[5]), .A2(b[5]), .Z(g[5]) );
  AN2D0 C43 ( .A1(a[6]), .A2(b[6]), .Z(g[6]) );
  AN2D0 C42 ( .A1(a[7]), .A2(b[7]), .Z(g[7]) );
endmodule

