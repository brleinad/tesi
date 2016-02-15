module cla_adder(
	a,b,cin,s,cout
);

parameter NBIT = 4;

input [NBIT-1:0] a,b;
input cin;

output [NBIT-1:0] s;
output cout;

wire [NBIT-1:0] g, p, c;


