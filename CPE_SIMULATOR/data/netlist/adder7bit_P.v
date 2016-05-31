module adder7bit_P( c, s);
input [13:0] c;
output [13:0] s;

assign s[0] = c[1] ^ c[4] ^ c[6] ^ c[9] ^ c[10] ^ c[12] ^ c[13];
assign s[1] = c[0] ^ c[1] ^ c[4] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[11] ^ c[13];
assign s[2] = c[1] ^ c[2] ^ c[3] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[10];
assign s[3] = c[0] ^ c[3] ^ c[4] ^ c[6] ^ c[8] ^ c[9] ^ c[10] ^ c[12] ^ c[13];
assign s[4] = c[2] ^ c[3] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[13];
assign s[5] = c[1] ^ c[2] ^ c[6] ^ c[9] ^ c[10];
assign s[6] = c[0] ^ c[6] ^ c[7] ^ c[10] ^ c[11] ^ c[12] ^ c[13];
assign s[7] = c[0] ^ c[2] ^ c[3] ^ c[4] ^ c[6] ^ c[8] ^ c[9] ^ c[11] ^ c[13];
assign s[8] = c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[6] ^ c[7] ^ c[11] ^ c[12] ^ c[13];
assign s[9] = c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[13];
assign s[10] = c[1] ^ c[2] ^ c[3] ^ c[6] ^ c[7] ^ c[9] ^ c[10];
assign s[11] = c[2] ^ c[5] ^ c[7] ^ c[9] ^ c[11];
assign s[12] = c[0] ^ c[3] ^ c[4] ^ c[7] ^ c[8] ^ c[9] ^ c[12];
assign s[13] = c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[13];

endmodule
