module decomposed_rca_P(a,b,s);

parameter NBIT = 14;

input [NBIT-1:0] a,b;
output [NBIT-1:0] s;
wire [NBIT-1:0] sp;

decomposed_rca ADD(
    .a(a),
    .b(b),
    .s(sp)
);

parity PAR(
    .c(sp),
    .p(s)
);

endmodule
