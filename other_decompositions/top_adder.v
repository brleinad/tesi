module top_adder(a,b,s);
`include "constants.v"


input [NBIT-1:0] a,b;
output [NBIT:0] s;

wire [NBIT:0] s_add, enc_s;

adder ADD(
    .a(a),
    .b(b),
    .s(s_add)
);

enc_lut ENC(
    .s(s_add),
    .enc_s(enc_s)
);

dec_lut DEC(
    .enc_s(enc_s),
    .dec_s(s)
);

endmodule
