module corrector(c,clk, rst, cc);

input [14:0] c; // codeword
input clk, rst;
output  cc; // corrected codeword bit
/*
* This is part of the One-step Majority Logic corrector
H_715 is the parity check matrix used
H715=[1 0 0 0 0 0 0 0 1 1 0 1 0 0 0;
      0 1 0 0 0 0 0 0 0 1 1 0 1 0 0;
      0 0 1 0 0 0 0 0 0 0 1 1 0 1 0;
      0 0 0 1 0 0 0 0 0 0 0 1 1 0 1;
      0 0 0 0 1 0 0 0 1 1 0 1 1 1 0;
      0 0 0 0 0 1 0 0 0 1 1 0 1 1 1;
      0 0 0 0 0 0 1 0 1 1 1 0 0 1 1;
      0 0 0 0 0 0 0 1 1 0 1 0 0 0 1];
*/

wire [3:0] A; //parity check output
wire majority_signal; //
reg [14:0] ct; // where to save the codeword and shift for the algorithm
wire cc;

//parity check
A[1]=xor(c[3], c[11], c[12], c[14]);
A[2]=xor(c[1], c[5] , c[13], c[14]);
A[3]=xor(c[0], c[2] , c[6] , c[14]);
A[4]=xor(c[7], c[8] , c[10], c[14]);

//
majority_signal=majority(A[1], A[2], A[3], A[4]);

//correct the last codeword bit
cc=xor(majority_signal, c[14]); //initially cc = c[14]

// the shifting part
always @(posedge clk)
begin
        if (rst)
        begin
                // initialize to the codeword
                // always remember to reset
                ct <= c; //15'b0;
        end
        else
        begin
                for (i= 14; i != 0 ; --i)
                begin
                        ct[i] <= ct[i-1];
                end
                ct[0] <= cc;
        end
end

endmodule
