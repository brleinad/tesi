module gen_cla_decomposed(a,b,s);

input [11:0]  a,b;
output [11:0] s;
wire [8176:0] n;
gen_nonlinear_part
NLIN(
        .a (a),
        .b (b),
        .n (n)
);

gen_linear_part
LIN(
        .a (a),
        .b (b),
        .n (n),
        .s (s)
);

endmodule