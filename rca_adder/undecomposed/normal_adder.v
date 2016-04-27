module normal_adder(
    a,b,s
);

`include "constants.v"

input [NBIT-1:0] a,b;

output [NBIT-1:0] s;

wire [NBIT-2:0] c;

assign c[0] = a[0] & b[0];
genvar i;
generate
    for (i = 0; i < NBIT - 2 ; i = i + 1)
    begin
        assign c[i+1] = (a[i+1] & b[i+1]) | (a[i+1] & c[i]) | (b[i+1] & c[i]);
    end

endgenerate
assign s[0] = a[0] ^ b[0];
assign s[NBIT-1:1] = a[NBIT-1:1] ^ b[NBIT-1:1] ^ c;

endmodule

