module gen_nonlinear_part(a,b,c,n);

parameter NBIT = 4; // number of bits of the adder
parameter NNL=56; //Number of bits of the non-linear outputs

input [NBIT-1:0] a, b; //adder inputs
input c; // carry in

output [NNL-1:0] n; // non-linear outputs

reg [NNL:0] g = 0; //non-linear intermediate values
integer i,j, ii,inter;

always @(a or b or c)
begin
        //initial values
        i = 1; 
        j = 0; //index for g and index for a, b
        inter = 1; //interval

        g[0] = c;

        while (i < NNL)
        begin 
                g[i] = a[j] & b[j];
                i = i + i;  //go to next g
                ii = 0;
                while (ii < inter)
                begin
                        g[i] = a[j] & g[i-inter-1];
                        g[i+inter] = b[j] & g[i-inter-1];
                        ii = ii + 1; //go forward in the interval
                        i = i + 1; // go  to next g
                end
                i = i + inter + 1; //go to next g after the last one assigned
                j = j + 1; //go to next input bit
                inter = inter + 2**j; // interval increases exponentially 
        end
end

/*
wire [NNL-1:0] g; //non-linear intermediate values

genvar i,j, ii,inter;
//integer i,j, ii,inter;
generate
//initial values
i = 1; 
j = 0; //index for g and index for a, b
inter = 1; //interval
assign g[0] = c;

while (i < NNULL)
begin 
        assign g[i] = a[j] & b[j];
        i = i + i;  //go to next g
        ii = 0;
        while (ii < inter)
        begin
                assign g[i] = a[j] & g[i-inter-1]
                assign g[i+inter] = b[j] & g[i - inter-1]
                ii = ii + 1; //go forward in the interval
                i = i + 1; // go  to next g
        end
        i = i + inter + 1; //go to next g after the last one assigned
        j = j + 1; //go to next input bit
        inter = inter + 2**j; // interval increases exponentially 
end
endgenerate
*/

assign n = g[NNL:1];
endmodule
