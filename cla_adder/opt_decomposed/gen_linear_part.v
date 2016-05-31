module gen_linear_part(a,b,n,s);

input  [3:0] a, b; //adder inputs
input [10:0] n; // non-linear outputs
output [3:0] s;

wire [10:0] t; // non-linear outputs
//asigning bit 0
assign s[0] = a[0] ^ b[0];
assign t[0] = n[0];

//asigning bit 1
assign s[1] = ( a[1] ^ b [1] ) ^ t[0];

assign t[1] = n[1];
assign t[2] = t[1] ^ n[2];
assign t[3] = t[2] ^ n[3];

//asigning bit 2
assign s[2] = ( a[2] ^ b [2] ) ^ t[3];

assign t[4] = n[4];
assign t[5] = t[4] ^ n[5];
assign t[6] = t[5] ^ n[6];
assign t[7] = t[6] ^ n[7];
assign t[8] = t[7] ^ n[8];
assign t[9] = t[8] ^ n[9];
assign t[10] = t[9] ^ n[10];

//asigning bit 3
assign s[3] = ( a[3] ^ b [3] ) ^ t[10];

endmodule