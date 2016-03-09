module gen_linear_part(a,b,n,s);

input  [3:0] a, b; //adder inputs
input [24:0] n; // non-linear outputs
output [3:0] s;

//asigning bit 0assign s[0] = (a[0] ^ b[0]);
//asigning bit 1assign t[0] = n[0];
assign t[1] = t[0] ^ n[1];
assign t[2] = t[1] ^ n[2];

assign s[1] = ( a[1] ^ b [1] ) ^ t[2];

//asigning bit 2assign t[3] = n[3];
assign t[4] = t[3] ^ n[4];
assign t[5] = t[4] ^ n[5];
assign t[6] = t[5] ^ n[6];
assign t[7] = t[6] ^ n[7];
assign t[8] = t[7] ^ n[8];
assign t[9] = t[8] ^ n[9];

assign s[2] = ( a[2] ^ b [2] ) ^ t[9];

//asigning bit 3assign t[10] = n[10];
assign t[11] = t[10] ^ n[11];
assign t[12] = t[11] ^ n[12];
assign t[13] = t[12] ^ n[13];
assign t[14] = t[13] ^ n[14];
assign t[15] = t[14] ^ n[15];
assign t[16] = t[15] ^ n[16];
assign t[17] = t[16] ^ n[17];
assign t[18] = t[17] ^ n[18];
assign t[19] = t[18] ^ n[19];
assign t[20] = t[19] ^ n[20];
assign t[21] = t[20] ^ n[21];
assign t[22] = t[21] ^ n[22];
assign t[23] = t[22] ^ n[23];
assign t[24] = t[23] ^ n[24];

assign s[3] = ( a[3] ^ b [3] ) ^ t[24];

endmodule