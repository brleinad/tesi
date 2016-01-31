module gen_cla_decomposed(a,b, c_in ,s);
//module gen_cla_decomposed(a,b, c_in ,s,c_out);

parameter NBIT = 7; //Number of bits of the adder
//parameter NNL= 56; //Number of bits of the non linear input
parameter NNL=2**(NBIT+2)-NBIT-4; //Number of bits of the non-linear outputs
 
input [NBIT-1:0]  a,b;
input             c_in;
output [NBIT:0] s;
//output           c_out;

wire [NNL-1:0]   n;

gen_nonlinear_part
//nonlinear_part
NLIN(
        .a (a),
        .b (b),
        .c (c_in),
        .n (n)
);

gen_linear_part
LIN(
        .a (a),
        .b (b),
        .c_in (c_in), //first carry in is zero
        .n (n),
        .s (s)//,
        //.c_out(c_out)
);

endmodule
