module simple_adder(a,b,cin,s,cout);

parameter NB = 7;

input [NB-1:0] a,b;
input cin;

output [NB-1:0] s;
output cout;

wire [NB:0] sum;

assign sum = a + b + cin;
assign cout = sum[NB];
assign s = sum[7:0];

endmodule
