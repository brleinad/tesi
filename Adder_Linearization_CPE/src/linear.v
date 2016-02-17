module linear(a,b,n,code);

parameter NBIT = 7;
parameter NCODE = 15;
parameter NNL=2**(NBIT+2)-NBIT-4; //Number of bits of the non-linear outputs

input [NBIT-1:0] a,b; //Adder inputs
input [NNL-1:0] n; // non-linear outputs
output [NCODE-1:0] code; //CPE codeword output

wire [NCODE-1:0] c; //CPE codeword output

reg [NBIT:0] s;
reg [NNL:0] t ;//= 0; //linear intermediate values
integer i, ii,inter;

always @(a or b  or n)
begin
        //initial values
        i = 1;
        inter = 3;

        //first bit can be calculated directly with the carry in
        s[0] = (a[0] ^ b[0]) ^ 1'b0;

        //the next NBIT-1 bits  are a bit more complicated
        for (i = 1; i < NBIT; i = i + 1)
        begin
                // take the first non-linear input for this interval
                t[inter-i-2] = n[inter-i-2]; 
                for (ii = 0; ii < inter - 1; ii = ii + 1)
                begin
                        //the following elements needed for the sum are a series of the previous EXORed by the correcponding non-linear input
                        t[inter-i-1+ii] = t[inter-i-2+ii] ^ n[inter-i-1+ii];
                end
                //for the final sum take the inputs plus the result from the nonlinear inputs
                s[i] = ( a[i] ^ b [i] ) ^ t[inter-i-2+ii];
                //the next interval increases exponentially
                inter = inter + 2**(i+1);
        end
        //lastly, take care of the carry out bit
        //this is very similar to the previous case but we have no more inputs
        t[inter-i-2] = n[inter-i-2];
        for (ii = 0; ii < inter - 1; ii = ii + 1)
        begin
                t[inter-i-1+ii] = t[inter-i-2+ii] ^ n[inter-i-1+ii];
        end
        s[i] = t[inter-i-2+ii];
end

assign code = c;

assign c[0]=s[0];
assign c[1]=s[1];
assign c[2]=s[2];
assign c[3]=s[3];
assign c[4]=s[4];
assign c[5]=s[5];
assign c[6]=s[6];
// parity bits
xor(c[7] , s[0], s[1], s[3]);
xor(c[8] , s[1], s[2], s[4]);
xor(c[9] , s[2], s[3], s[5]);
xor(c[10], s[3], s[4], s[6]);
xor(c[11], s[0], s[1], s[3], s[4], s[5]);
xor(c[12], s[1], s[2], s[4], s[5], s[6]);
xor(c[13], s[0], s[1], s[2], s[5], s[6]);
xor(c[14], s[0], s[2], s[6]);      

/*
gen_linear_part
LIN_ADDER (
        .a(a),
        .b(b),
        .c_in(1'b0),
        .n(nonlin),
        .s(sum) 
);

generator
CPE (
        .i(sum[NBIT-1:0]),//don't need the carry out
        .c(code)
);
*/

endmodule
