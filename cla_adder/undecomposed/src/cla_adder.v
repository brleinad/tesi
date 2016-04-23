module cla_adder(
	a,b,s
);

`include constants.v

input [NBIT-1:0] a,b;

output reg [NBIT-1:0] s;

reg [NBIT-1:0] g, p;
reg [NBIT-1:0] c;

integer i, j, k;

always @(a,b,cin)
begin
        g = a & b;
        p = a ^ b;
        c[0] = 0;
        for (i = 0; i < NBIT - 1; i = i + 1)
        begin
                c[i+1] = g[i] | (p[i] & c[i]) ;
        end

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
