module cla_adder(
	a,b,s,cin,cout
);

parameter NBIT = 1024;

input [NBIT-1:0] a,b;
input cin;

output reg [NBIT-1:0] s;
output reg cout;

reg [NBIT-1:0] g, p;
reg [NBIT:0] c;

integer i, j, k;

always @(a,b,cin)
begin
        g = a & b;
        p = a ^ b;
        c[0] = cin;
/*
        c[0] = 0;
	c[1] = g[0];
	t(0) = 0;
*/
        for (i = 0; i < NBIT; i = i + 1)
        begin
/*
		for (j = 1; j <= 2**i; j = j + 1)
			t(i+j-1) =  g(i-1) | (p(i-1) & t(i+j-2);
		end

                c[i+1] = g[i] | (p[i] & t[i+j-1]) ;
*/
                c[i+1] = g[i] | (p[i] & c[i]) ;
        end

        //cout = c[NBIT];

        s = p ^ c[NBIT-1:0];
end

endmodule

/*
       c[0] = cin;
        c[1] = g[0] | (p[0] & c[0]);
        c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
        c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
        c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & p[0] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);
*/
