module adder (a,b,s);

`include "constants.v"

input [NBIT-1:0] a,b;
output [NBIT-1:0] s;

assign s = a + b;

endmodule
