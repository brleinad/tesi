module cla_8bit(a,b,s,c_out);

parameter NBIT = 8; //Number of bits of the adder
parameter NNL= 56; //Number of bits of the non linear input
 
input [NBIT-1:0]  a,b;
output [NBIT-1:0] s;
output           c_out;

wire  c1;


cla_decomposed
LSBS (
        .a(a[NBIT/2-1:0]),
        .b(b[NBIT/2-1:0]),
        .c_in(1'b0),
        .s(s[NBIT/2-1:0]),
        .c_out(c1)
);

cla_decomposed
MSBS (
        .a(a[NBIT-1:NBIT/2]),
        .b(b[NBIT-1:NBIT/2]),
        .c_in(c1),
        .s(s[NBIT-1:NBIT/2]),
        .c_out(c_out)
);

endmodule
