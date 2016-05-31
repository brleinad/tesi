module adder (a,b,s);
//`include "constants.v"
parameter NBIT = 14;

input [NBIT-1:0] a,b;
output [NBIT-1:0] s;

assign s[NBIT-1:0] = a + b;

endmodule
