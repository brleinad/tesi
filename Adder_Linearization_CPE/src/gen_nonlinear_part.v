module gen_nonlinear_part(a,b,c,n);

parameter NBIT = 7; // number of bits of the adder
//parameter NNL=56; //Number of bits of the non-linear outputs
parameter NNL=2**(NBIT+2)-NBIT-4; //Number of bits of the non-linear outputs

input [NBIT-1:0] a, b; //adder inputs
input c; // carry in

output [NNL-1:0] n; // non-linear outputs

reg [NNL:0] g ;//= 0; //non-linear intermediate values
integer i,j, ii,inter;

always @(a or b or c)
begin
        //initial values
        i = 1; //index for g
        j = 0; //index for a, b
        inter = 1; //interval

        g[0] = c; 

        while (i < NNL)
        begin 
                g[i] = a[j] & b[j];
                i = i + 1;  //go to next g
                for (ii = 0; ii < inter; ii = ii + 1)
                begin
                        g[i+ii] = a[j] & g[i+ii-inter-1];
                        g[i+ii+inter] = b[j] & g[i+ii-inter-1];
                end
                i = i + inter + ii; //go to next g after the last one assigned
                j = j + 1; //go to next input bit
                inter = inter + 2**j; // interval increases exponentially 
        end
end
assign n = g[NNL:1];//assign outputs

endmodule
