module adder_cpe(a,b,code);

parameter NBIT = 7;
parameter NCODE = 15;
parameter NNL=2**(NBIT+2)-NBIT-4; //Number of bits of the non-linear outputs

input [NBIT-1:0] a,b; //Adder inputs
output [NCODE-1:0] code; //CPE codeword output

wire [NBIT:0] sum; //Adder output, CPE input
output [NNL-1:0] nonlin; // non-linear outputs

gen_nonlinear_part
NONLIN_ADDER (
        .a(a),
        .b(b),
        .c(1'b0),
        .n(nonlin)
);

gen_linear_part
LIN_ADDER (
        .a(a),
        .b(b),
        .c_in(1'b0),
        .n(nonlin),
        .s(sum) 
);

generator
CPE (
        .i(sum[NBIT-1:0]),//don't need the carry out
        .c(code)
);

endmodule
