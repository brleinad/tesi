
module linear_part(a,b,c_in,n,s,c_out);

parameter NBIT = 4; //Number of bits of the adder
parameter NNL= 56; //Number of bits of the non linear input
 
input [NBIT-1:0]  a,b;
input [0:0]      c_in;
input [NNL-1:0]   n;
output [NBIT-1:0]   s;
output            c_out;

assign s[0] = (a[0] ^ b[0]) ^ c_in;

parameter NNL=2**(NBIT+2)-NBIT-4; //Number of bits of the non-linear outputs
assign s[1] = (a[1] ^ b[1]) ^ (n[0]  ^ (n[1]  ^ n[2]));

assign s[2] = (a[2] ^ b[2]) ^ (n[3]  ^ n[4]  ^ n[5]  ^ n[6]  ^ n[7]  ^ n[8]  ^ n[9]);

assign s[3] = (a[3] ^ b[3]) ^ (n[10] ^ n[11] ^ n[12] ^ n[13] ^ n[14] ^ n[15] ^ n[16] ^ n[17] ^ n[18] ^ n[19] ^ n[20] ^ n[21] ^ n[22] ^ n[23] ^ n[24]);

assign c_out = (n[25] ^ n[26] ^ n[27] ^ n[28] ^ n[29] ^ n[30] ^ n[31] ^ n[32] ^ n[33] ^ n[34] ^ n[35] ^ n[36] ^ n[37] ^ n[38] ^ n[39] ^ n[40] ^ n[41] ^ n[42] ^ n[43] ^ n[44] ^ n[45] ^ n[46] ^ n[47] ^ n[48] ^ n[49] ^ n[50] ^ n[51] ^ n[52] ^ n[53] ^ n[54] ^ n[55]);


endmodule
