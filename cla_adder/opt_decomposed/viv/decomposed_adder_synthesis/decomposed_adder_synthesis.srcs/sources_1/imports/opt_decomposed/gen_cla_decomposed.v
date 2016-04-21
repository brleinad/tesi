module gen_cla_decomposed(a,b,s);

input [3:0]  a,b;
output [3:0] s;
wire [10:0] n;
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