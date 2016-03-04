module nonlinear_part(a,b,c,n);

parameter NBIT = 4; //Number of bits of the adder
parameter NNL= 56; //Number of bits of the non linear input
 
input [NBIT-1:0]  a,b;
input [0:0]       c; //carry in
output [NNL-1:0]  n; //NON-linear outputs

wire [NNL-1:0]  g; //NON-linear intermiadate value


assign g[0]  = a[0] & b[0];
assign g[1]  = a[0] & c;
assign g[2]  = b[0] & c;

assign g[3]  = a[1] & b[1];
assign g[4]  = a[1] & g[0]; 
assign g[5]  = a[1] & g[1]; 
assign g[6]  = a[1] & g[2];
assign g[7]  = b[1] & g[0];
assign g[8]  = b[1] & g[1];
assign g[9]  = b[1] & g[2];


assign g[10]  = a[2] & b[2];
assign g[11]  = a[2] & g[3];
assign g[12]  = a[2] & g[4];
assign g[13]  = a[2] & g[5];
assign g[14]  = a[2] & g[6];
assign g[15]  = a[2] & g[7];
assign g[16]  = a[2] & g[8];
assign g[17]  = a[2] & g[9];
assign g[18]  = b[2] & g[3];
assign g[19]  = b[2] & g[4];
assign g[20]  = b[2] & g[5];
assign g[21]  = b[2] & g[6];
assign g[22]  = b[2] & g[7];
assign g[23]  = b[2] & g[8];
assign g[24]  = b[2] & g[9];


assign g[25]  = a[3] & b[3];
assign g[26]  = a[3] & g[10];
assign g[27]  = a[3] & g[11];
assign g[28]  = a[3] & g[12];
assign g[29]  = a[3] & g[13];
assign g[30]  = a[3] & g[14];
assign g[31]  = a[3] & g[15];
assign g[32]  = a[3] & g[16];
assign g[33]  = a[3] & g[17];
assign g[34]  = a[3] & g[18];
assign g[35]  = a[3] & g[19];
assign g[36]  = a[3] & g[20];
assign g[37]  = a[3] & g[21];
assign g[38]  = a[3] & g[22];
assign g[39]  = a[3] & g[23];
assign g[40]  = a[3] & g[24];

assign g[41]  = b[3] & g[10];
assign g[42]  = b[3] & g[11];
assign g[43]  = b[3] & g[12];
assign g[44]  = b[3] & g[13];
assign g[45]  = b[3] & g[14];
assign g[46]  = b[3] & g[15];
assign g[47]  = b[3] & g[16];
assign g[48]  = b[3] & g[17];
assign g[49]  = b[3] & g[18];
assign g[50]  = b[3] & g[19];
assign g[51]  = b[3] & g[20];
assign g[52]  = b[3] & g[21];
assign g[53]  = b[3] & g[22];
assign g[54]  = b[3] & g[23];
assign g[55]  = b[3] & g[24];

assign n = g;


endmodule

