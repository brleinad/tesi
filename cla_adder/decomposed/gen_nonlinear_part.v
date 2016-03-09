module gen_nonlinear_part(a,b,n);
input  [3:0] a, b; //adder inputs
output [24:0] n; // non-linear outputs

wire [25:0] g;

assign g[0] = 0;
//Assigning outputs for input bit 0
assign g[1] = a[0] & b[0];
assign g[2] = a[0] & g[0];
assign g[3] = b[0] & g[0];
//Assigning outputs for input bit 1
assign g[4] = a[1] & b[1];
assign g[5] = a[1] & g[1];
assign g[8] = b[1] & g[1];
assign g[6] = a[1] & g[2];
assign g[9] = b[1] & g[2];
assign g[7] = a[1] & g[3];
assign g[10] = b[1] & g[3];
//Assigning outputs for input bit 2
assign g[11] = a[2] & b[2];
assign g[12] = a[2] & g[4];
assign g[19] = b[2] & g[4];
assign g[13] = a[2] & g[5];
assign g[20] = b[2] & g[5];
assign g[14] = a[2] & g[6];
assign g[21] = b[2] & g[6];
assign g[15] = a[2] & g[7];
assign g[22] = b[2] & g[7];
assign g[16] = a[2] & g[8];
assign g[23] = b[2] & g[8];
assign g[17] = a[2] & g[9];
assign g[24] = b[2] & g[9];
assign g[18] = a[2] & g[10];
assign g[25] = b[2] & g[10];
assign n = g[25:1]; //assign outputs
endmodule