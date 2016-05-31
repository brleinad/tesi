module decoder(a,d);
input [1:0] a;
output [4:0] d;

assign d[0] = (~a[1]) & (~a[0]);
assign d[1] = (~a[1]) & (a[0]);
assign d[2] = (a[1])  & (~a[0]);
assign d[3] = (a[1])  & (a[0]);

endmodule
