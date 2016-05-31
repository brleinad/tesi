module gen_nonlinear_part(a,b,n);
input  [3:0] a, b; //adder inputs
output [10:0] n; // non-linear outputs

wire [10:0] g; 

assign n = g; //assign outputs

//Assigning outputs for input bit 1
assign g[0] = a[0] & b[0];
//Assigning outputs for input bit 2
assign g[1] = a[1] & b[1];
assign g[2] = a[1] & g[0];
assign g[3] = b[1] & g[0];
//Assigning outputs for input bit 3
assign g[4] = a[2] & b[2];
assign g[5] = a[2] & g[1];
assign g[8] = b[2] & g[1];
assign g[6] = a[2] & g[2];
assign g[9] = b[2] & g[2];
assign g[7] = a[2] & g[3];
assign g[10] = b[2] & g[3];
endmodule