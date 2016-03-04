//module gen_linear_part(a,b,c_in,n,s,c_out);
module gen_linear_part(a,b,c_in,n,s);

//parameter NBIT = 7; //Number of bits of the adder
//parameter NNL=2**(NBIT+2)-NBIT-4; //Number of bits of the non-linear outputs
`include "constants.v"
 
input [NBIT-1:0]  a,b;
input       c_in;
input [NNL-1:0]   n;
output [NBIT:0] s;
//output            c_out;

reg [NBIT:0] s;
reg [NNL:0] t ;//= 0; //linear intermediate values
integer i, ii,inter;

always @(a or b or c_in or n)
begin
        //initial values
        i = 1;
        inter = 3;

        //first bit can be calculated directly with the carry in
        s[0] = (a[0] ^ b[0]) ^ c_in;

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
endmodule
