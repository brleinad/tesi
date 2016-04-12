
module cla_adder ( a, b, s, cin, cout );
  input [5:0] a;
  input [5:0] b;
  output [5:0] s;
  input cin;
  output cout;
  wire   N0, N1, N2, N3, N4;
  wire   [4:0] g;
  wire   [5:0] p;
  wire   [5:1] c;

  XOR2D1 C56 ( .A1(p[0]), .A2(cin), .Z(s[0]) );
  XOR2D1 C55 ( .A1(p[1]), .A2(c[1]), .Z(s[1]) );
  XOR2D1 C54 ( .A1(p[2]), .A2(c[2]), .Z(s[2]) );
  XOR2D1 C53 ( .A1(p[3]), .A2(c[3]), .Z(s[3]) );
  XOR2D1 C52 ( .A1(p[4]), .A2(c[4]), .Z(s[4]) );
  XOR2D1 C51 ( .A1(p[5]), .A2(c[5]), .Z(s[5]) );
  AN2D0 C50 ( .A1(p[4]), .A2(c[4]), .Z(N4) );
  OR2D1 C49 ( .A1(g[4]), .A2(N4), .Z(c[5]) );
  AN2D0 C48 ( .A1(p[3]), .A2(c[3]), .Z(N3) );
  OR2D1 C47 ( .A1(g[3]), .A2(N3), .Z(c[4]) );
  AN2D0 C46 ( .A1(p[2]), .A2(c[2]), .Z(N2) );
  OR2D1 C45 ( .A1(g[2]), .A2(N2), .Z(c[3]) );
  AN2D0 C44 ( .A1(p[1]), .A2(c[1]), .Z(N1) );
  OR2D1 C43 ( .A1(g[1]), .A2(N1), .Z(c[2]) );
  AN2D0 C42 ( .A1(p[0]), .A2(cin), .Z(N0) );
  OR2D1 C41 ( .A1(g[0]), .A2(N0), .Z(c[1]) );
  XOR2D1 C40 ( .A1(a[0]), .A2(b[0]), .Z(p[0]) );
  XOR2D1 C39 ( .A1(a[1]), .A2(b[1]), .Z(p[1]) );
  XOR2D1 C38 ( .A1(a[2]), .A2(b[2]), .Z(p[2]) );
  XOR2D1 C37 ( .A1(a[3]), .A2(b[3]), .Z(p[3]) );
  XOR2D1 C36 ( .A1(a[4]), .A2(b[4]), .Z(p[4]) );
  XOR2D1 C35 ( .A1(a[5]), .A2(b[5]), .Z(p[5]) );
  AN2D0 C34 ( .A1(a[0]), .A2(b[0]), .Z(g[0]) );
  AN2D0 C33 ( .A1(a[1]), .A2(b[1]), .Z(g[1]) );
  AN2D0 C32 ( .A1(a[2]), .A2(b[2]), .Z(g[2]) );
  AN2D0 C31 ( .A1(a[3]), .A2(b[3]), .Z(g[3]) );
  AN2D0 C30 ( .A1(a[4]), .A2(b[4]), .Z(g[4]) );
endmodule

