
module cla_adder ( a, b, s, cin, cout );
  input [31:0] a;
  input [31:0] b;
  output [31:0] s;
  input cin;
  output cout;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30;
  wire   [30:0] g;
  wire   [31:0] p;
  wire   [31:1] c;

  XOR2D0 C290 ( .A1(p[0]), .A2(cin), .Z(s[0]) );
  XOR2D0 C289 ( .A1(p[1]), .A2(c[1]), .Z(s[1]) );
  XOR2D0 C288 ( .A1(p[2]), .A2(c[2]), .Z(s[2]) );
  XOR2D0 C287 ( .A1(p[3]), .A2(c[3]), .Z(s[3]) );
  XOR2D0 C286 ( .A1(p[4]), .A2(c[4]), .Z(s[4]) );
  XOR2D0 C285 ( .A1(p[5]), .A2(c[5]), .Z(s[5]) );
  XOR2D0 C284 ( .A1(p[6]), .A2(c[6]), .Z(s[6]) );
  XOR2D0 C283 ( .A1(p[7]), .A2(c[7]), .Z(s[7]) );
  XOR2D0 C282 ( .A1(p[8]), .A2(c[8]), .Z(s[8]) );
  XOR2D0 C281 ( .A1(p[9]), .A2(c[9]), .Z(s[9]) );
  XOR2D0 C280 ( .A1(p[10]), .A2(c[10]), .Z(s[10]) );
  XOR2D0 C279 ( .A1(p[11]), .A2(c[11]), .Z(s[11]) );
  XOR2D0 C278 ( .A1(p[12]), .A2(c[12]), .Z(s[12]) );
  XOR2D0 C277 ( .A1(p[13]), .A2(c[13]), .Z(s[13]) );
  XOR2D0 C276 ( .A1(p[14]), .A2(c[14]), .Z(s[14]) );
  XOR2D0 C275 ( .A1(p[15]), .A2(c[15]), .Z(s[15]) );
  XOR2D0 C274 ( .A1(p[16]), .A2(c[16]), .Z(s[16]) );
  XOR2D0 C273 ( .A1(p[17]), .A2(c[17]), .Z(s[17]) );
  XOR2D0 C272 ( .A1(p[18]), .A2(c[18]), .Z(s[18]) );
  XOR2D0 C271 ( .A1(p[19]), .A2(c[19]), .Z(s[19]) );
  XOR2D0 C270 ( .A1(p[20]), .A2(c[20]), .Z(s[20]) );
  XOR2D0 C269 ( .A1(p[21]), .A2(c[21]), .Z(s[21]) );
  XOR2D0 C268 ( .A1(p[22]), .A2(c[22]), .Z(s[22]) );
  XOR2D0 C267 ( .A1(p[23]), .A2(c[23]), .Z(s[23]) );
  XOR2D0 C266 ( .A1(p[24]), .A2(c[24]), .Z(s[24]) );
  XOR2D0 C265 ( .A1(p[25]), .A2(c[25]), .Z(s[25]) );
  XOR2D0 C264 ( .A1(p[26]), .A2(c[26]), .Z(s[26]) );
  XOR2D0 C263 ( .A1(p[27]), .A2(c[27]), .Z(s[27]) );
  XOR2D0 C262 ( .A1(p[28]), .A2(c[28]), .Z(s[28]) );
  XOR2D0 C261 ( .A1(p[29]), .A2(c[29]), .Z(s[29]) );
  XOR2D0 C260 ( .A1(p[30]), .A2(c[30]), .Z(s[30]) );
  XOR2D0 C259 ( .A1(p[31]), .A2(c[31]), .Z(s[31]) );
  AN2D0 C258 ( .A1(p[30]), .A2(c[30]), .Z(N30) );
  OR2D0 C257 ( .A1(g[30]), .A2(N30), .Z(c[31]) );
  AN2D0 C256 ( .A1(p[29]), .A2(c[29]), .Z(N29) );
  OR2D0 C255 ( .A1(g[29]), .A2(N29), .Z(c[30]) );
  AN2D0 C254 ( .A1(p[28]), .A2(c[28]), .Z(N28) );
  OR2D0 C253 ( .A1(g[28]), .A2(N28), .Z(c[29]) );
  AN2D0 C252 ( .A1(p[27]), .A2(c[27]), .Z(N27) );
  OR2D0 C251 ( .A1(g[27]), .A2(N27), .Z(c[28]) );
  AN2D0 C250 ( .A1(p[26]), .A2(c[26]), .Z(N26) );
  OR2D0 C249 ( .A1(g[26]), .A2(N26), .Z(c[27]) );
  AN2D0 C248 ( .A1(p[25]), .A2(c[25]), .Z(N25) );
  OR2D0 C247 ( .A1(g[25]), .A2(N25), .Z(c[26]) );
  AN2D0 C246 ( .A1(p[24]), .A2(c[24]), .Z(N24) );
  OR2D0 C245 ( .A1(g[24]), .A2(N24), .Z(c[25]) );
  AN2D0 C244 ( .A1(p[23]), .A2(c[23]), .Z(N23) );
  OR2D0 C243 ( .A1(g[23]), .A2(N23), .Z(c[24]) );
  AN2D0 C242 ( .A1(p[22]), .A2(c[22]), .Z(N22) );
  OR2D0 C241 ( .A1(g[22]), .A2(N22), .Z(c[23]) );
  AN2D0 C240 ( .A1(p[21]), .A2(c[21]), .Z(N21) );
  OR2D0 C239 ( .A1(g[21]), .A2(N21), .Z(c[22]) );
  AN2D0 C238 ( .A1(p[20]), .A2(c[20]), .Z(N20) );
  OR2D0 C237 ( .A1(g[20]), .A2(N20), .Z(c[21]) );
  AN2D0 C236 ( .A1(p[19]), .A2(c[19]), .Z(N19) );
  OR2D0 C235 ( .A1(g[19]), .A2(N19), .Z(c[20]) );
  AN2D0 C234 ( .A1(p[18]), .A2(c[18]), .Z(N18) );
  OR2D0 C233 ( .A1(g[18]), .A2(N18), .Z(c[19]) );
  AN2D0 C232 ( .A1(p[17]), .A2(c[17]), .Z(N17) );
  OR2D0 C231 ( .A1(g[17]), .A2(N17), .Z(c[18]) );
  AN2D0 C230 ( .A1(p[16]), .A2(c[16]), .Z(N16) );
  OR2D0 C229 ( .A1(g[16]), .A2(N16), .Z(c[17]) );
  AN2D0 C228 ( .A1(p[15]), .A2(c[15]), .Z(N15) );
  OR2D0 C227 ( .A1(g[15]), .A2(N15), .Z(c[16]) );
  AN2D0 C226 ( .A1(p[14]), .A2(c[14]), .Z(N14) );
  OR2D0 C225 ( .A1(g[14]), .A2(N14), .Z(c[15]) );
  AN2D0 C224 ( .A1(p[13]), .A2(c[13]), .Z(N13) );
  OR2D0 C223 ( .A1(g[13]), .A2(N13), .Z(c[14]) );
  AN2D0 C222 ( .A1(p[12]), .A2(c[12]), .Z(N12) );
  OR2D0 C221 ( .A1(g[12]), .A2(N12), .Z(c[13]) );
  AN2D0 C220 ( .A1(p[11]), .A2(c[11]), .Z(N11) );
  OR2D0 C219 ( .A1(g[11]), .A2(N11), .Z(c[12]) );
  AN2D0 C218 ( .A1(p[10]), .A2(c[10]), .Z(N10) );
  OR2D0 C217 ( .A1(g[10]), .A2(N10), .Z(c[11]) );
  AN2D0 C216 ( .A1(p[9]), .A2(c[9]), .Z(N9) );
  OR2D0 C215 ( .A1(g[9]), .A2(N9), .Z(c[10]) );
  AN2D0 C214 ( .A1(p[8]), .A2(c[8]), .Z(N8) );
  OR2D0 C213 ( .A1(g[8]), .A2(N8), .Z(c[9]) );
  AN2D0 C212 ( .A1(p[7]), .A2(c[7]), .Z(N7) );
  OR2D0 C211 ( .A1(g[7]), .A2(N7), .Z(c[8]) );
  AN2D0 C210 ( .A1(p[6]), .A2(c[6]), .Z(N6) );
  OR2D0 C209 ( .A1(g[6]), .A2(N6), .Z(c[7]) );
  AN2D0 C208 ( .A1(p[5]), .A2(c[5]), .Z(N5) );
  OR2D0 C207 ( .A1(g[5]), .A2(N5), .Z(c[6]) );
  AN2D0 C206 ( .A1(p[4]), .A2(c[4]), .Z(N4) );
  OR2D0 C205 ( .A1(g[4]), .A2(N4), .Z(c[5]) );
  AN2D0 C204 ( .A1(p[3]), .A2(c[3]), .Z(N3) );
  OR2D0 C203 ( .A1(g[3]), .A2(N3), .Z(c[4]) );
  AN2D0 C202 ( .A1(p[2]), .A2(c[2]), .Z(N2) );
  OR2D0 C201 ( .A1(g[2]), .A2(N2), .Z(c[3]) );
  AN2D0 C200 ( .A1(p[1]), .A2(c[1]), .Z(N1) );
  OR2D0 C199 ( .A1(g[1]), .A2(N1), .Z(c[2]) );
  AN2D0 C198 ( .A1(p[0]), .A2(cin), .Z(N0) );
  OR2D0 C197 ( .A1(g[0]), .A2(N0), .Z(c[1]) );
  XOR2D0 C196 ( .A1(a[0]), .A2(b[0]), .Z(p[0]) );
  XOR2D0 C195 ( .A1(a[1]), .A2(b[1]), .Z(p[1]) );
  XOR2D0 C194 ( .A1(a[2]), .A2(b[2]), .Z(p[2]) );
  XOR2D0 C193 ( .A1(a[3]), .A2(b[3]), .Z(p[3]) );
  XOR2D0 C192 ( .A1(a[4]), .A2(b[4]), .Z(p[4]) );
  XOR2D0 C191 ( .A1(a[5]), .A2(b[5]), .Z(p[5]) );
  XOR2D0 C190 ( .A1(a[6]), .A2(b[6]), .Z(p[6]) );
  XOR2D0 C189 ( .A1(a[7]), .A2(b[7]), .Z(p[7]) );
  XOR2D0 C188 ( .A1(a[8]), .A2(b[8]), .Z(p[8]) );
  XOR2D0 C187 ( .A1(a[9]), .A2(b[9]), .Z(p[9]) );
  XOR2D0 C186 ( .A1(a[10]), .A2(b[10]), .Z(p[10]) );
  XOR2D0 C185 ( .A1(a[11]), .A2(b[11]), .Z(p[11]) );
  XOR2D0 C184 ( .A1(a[12]), .A2(b[12]), .Z(p[12]) );
  XOR2D0 C183 ( .A1(a[13]), .A2(b[13]), .Z(p[13]) );
  XOR2D0 C182 ( .A1(a[14]), .A2(b[14]), .Z(p[14]) );
  XOR2D0 C181 ( .A1(a[15]), .A2(b[15]), .Z(p[15]) );
  XOR2D0 C180 ( .A1(a[16]), .A2(b[16]), .Z(p[16]) );
  XOR2D0 C179 ( .A1(a[17]), .A2(b[17]), .Z(p[17]) );
  XOR2D0 C178 ( .A1(a[18]), .A2(b[18]), .Z(p[18]) );
  XOR2D0 C177 ( .A1(a[19]), .A2(b[19]), .Z(p[19]) );
  XOR2D0 C176 ( .A1(a[20]), .A2(b[20]), .Z(p[20]) );
  XOR2D0 C175 ( .A1(a[21]), .A2(b[21]), .Z(p[21]) );
  XOR2D0 C174 ( .A1(a[22]), .A2(b[22]), .Z(p[22]) );
  XOR2D0 C173 ( .A1(a[23]), .A2(b[23]), .Z(p[23]) );
  XOR2D0 C172 ( .A1(a[24]), .A2(b[24]), .Z(p[24]) );
  XOR2D0 C171 ( .A1(a[25]), .A2(b[25]), .Z(p[25]) );
  XOR2D0 C170 ( .A1(a[26]), .A2(b[26]), .Z(p[26]) );
  XOR2D0 C169 ( .A1(a[27]), .A2(b[27]), .Z(p[27]) );
  XOR2D0 C168 ( .A1(a[28]), .A2(b[28]), .Z(p[28]) );
  XOR2D0 C167 ( .A1(a[29]), .A2(b[29]), .Z(p[29]) );
  XOR2D0 C166 ( .A1(a[30]), .A2(b[30]), .Z(p[30]) );
  XOR2D0 C165 ( .A1(a[31]), .A2(b[31]), .Z(p[31]) );
  AN2D0 C164 ( .A1(a[0]), .A2(b[0]), .Z(g[0]) );
  AN2D0 C163 ( .A1(a[1]), .A2(b[1]), .Z(g[1]) );
  AN2D0 C162 ( .A1(a[2]), .A2(b[2]), .Z(g[2]) );
  AN2D0 C161 ( .A1(a[3]), .A2(b[3]), .Z(g[3]) );
  AN2D0 C160 ( .A1(a[4]), .A2(b[4]), .Z(g[4]) );
  AN2D0 C159 ( .A1(a[5]), .A2(b[5]), .Z(g[5]) );
  AN2D0 C158 ( .A1(a[6]), .A2(b[6]), .Z(g[6]) );
  AN2D0 C157 ( .A1(a[7]), .A2(b[7]), .Z(g[7]) );
  AN2D0 C156 ( .A1(a[8]), .A2(b[8]), .Z(g[8]) );
  AN2D0 C155 ( .A1(a[9]), .A2(b[9]), .Z(g[9]) );
  AN2D0 C154 ( .A1(a[10]), .A2(b[10]), .Z(g[10]) );
  AN2D0 C153 ( .A1(a[11]), .A2(b[11]), .Z(g[11]) );
  AN2D0 C152 ( .A1(a[12]), .A2(b[12]), .Z(g[12]) );
  AN2D0 C151 ( .A1(a[13]), .A2(b[13]), .Z(g[13]) );
  AN2D0 C150 ( .A1(a[14]), .A2(b[14]), .Z(g[14]) );
  AN2D0 C149 ( .A1(a[15]), .A2(b[15]), .Z(g[15]) );
  AN2D0 C148 ( .A1(a[16]), .A2(b[16]), .Z(g[16]) );
  AN2D0 C147 ( .A1(a[17]), .A2(b[17]), .Z(g[17]) );
  AN2D0 C146 ( .A1(a[18]), .A2(b[18]), .Z(g[18]) );
  AN2D0 C145 ( .A1(a[19]), .A2(b[19]), .Z(g[19]) );
  AN2D0 C144 ( .A1(a[20]), .A2(b[20]), .Z(g[20]) );
  AN2D0 C143 ( .A1(a[21]), .A2(b[21]), .Z(g[21]) );
  AN2D0 C142 ( .A1(a[22]), .A2(b[22]), .Z(g[22]) );
  AN2D0 C141 ( .A1(a[23]), .A2(b[23]), .Z(g[23]) );
  AN2D0 C140 ( .A1(a[24]), .A2(b[24]), .Z(g[24]) );
  AN2D0 C139 ( .A1(a[25]), .A2(b[25]), .Z(g[25]) );
  AN2D0 C138 ( .A1(a[26]), .A2(b[26]), .Z(g[26]) );
  AN2D0 C137 ( .A1(a[27]), .A2(b[27]), .Z(g[27]) );
  AN2D0 C136 ( .A1(a[28]), .A2(b[28]), .Z(g[28]) );
  AN2D0 C135 ( .A1(a[29]), .A2(b[29]), .Z(g[29]) );
  AN2D0 C134 ( .A1(a[30]), .A2(b[30]), .Z(g[30]) );
endmodule

