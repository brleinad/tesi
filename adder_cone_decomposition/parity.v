module parity( c, p);
input [13:0] c;
output [13:0] p;

assign p[0] = c[1] ^ c[4] ^ c[6] ^ c[9] ^ c[10] ^ c[12] ^ c[13];
assign p[1] = c[0] ^ c[1] ^ c[4] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[11] ^ c[13];
assign p[2] = c[1] ^ c[2] ^ c[3] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[10];
assign p[3] = c[0] ^ c[3] ^ c[4] ^ c[6] ^ c[8] ^ c[9] ^ c[10] ^ c[12] ^ c[13];
assign p[4] = c[2] ^ c[3] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[13];
assign p[5] = c[1] ^ c[2] ^ c[6] ^ c[9] ^ c[10];
assign p[6] = c[0] ^ c[6] ^ c[7] ^ c[10] ^ c[11] ^ c[12] ^ c[13];
assign p[7] = c[0] ^ c[2] ^ c[3] ^ c[4] ^ c[6] ^ c[8] ^ c[9] ^ c[11] ^ c[13];
assign p[8] = c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[6] ^ c[7] ^ c[11] ^ c[12] ^ c[13];
assign p[9] = c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[13];
assign p[10] = c[1] ^ c[2] ^ c[3] ^ c[6] ^ c[7] ^ c[9] ^ c[10];
assign p[11] = c[2] ^ c[5] ^ c[7] ^ c[9] ^ c[11];
assign p[12] = c[0] ^ c[3] ^ c[4] ^ c[7] ^ c[8] ^ c[9] ^ c[12];
assign p[13] = c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[13];

endmodule
