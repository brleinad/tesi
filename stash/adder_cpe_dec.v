module adder_cpe(a,b,dec_sum);

parameter NBIT = 7;
parameter NCODE = 15;
//parameter NNL=2**(NBIT+2)-NBIT-4; //Number of bits of the non-linear outputs
parameter NNL=2**(NBIT+1)-NBIT-2; //Number of bits of the non-linear outputs

input [NBIT-1:0] a,b; //Adder inputs
input [NBIT-1:0] dec_sum; //decoded sum output

wire [NCODE-1:0] code, syndrome ; //CPE codeword output, detector's syndrome vector
wire [NCODE-1:0] corrected_code;

wire [NBIT-1:0] sum; //Adder output, CPE input
wire [NNL-1:0] nonlin; // non-linear outputs

wire error_flag; //detector tells corrector when there is an error
wire error_corrected; //corrector tells when error has been corrected


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
        .i(sum),
        .c(code)
);

detector
DEC0 (
	.c(code),
	.s(syndrome),
	.error(error_flag)
);

corrector
DEC1 (
	.c(code),
	.clk(clk),
	.error(error_flag),
	.ready(error_corrected),
	.ccw(corrected_code)
);

//decoded sum output
assign dec_sum = corrected_code[6:0];

endmodule
