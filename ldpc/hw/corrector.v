module corrector(c,clk, error, ready, ccw);

input [14:0] c; // codeword
input clk, error; // the error flag tells the corrector to correct
output ready; // ready flag tells when corrected codeword is valid
output [14:0] ccw; // corrected codeword
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

wire [3:0] pc; //parity check output
wire majority_signal; //
reg [14:0] ct; // where to save the codeword and shift for the algorithm
reg rst; // internal rst 
reg [4:0] step; //counts number of corrected bits: has to count to 14
wire cc;

//parity check
pc[1]=xor(c[3], c[11], c[12], c[14]);
pc[2]=xor(c[1], c[5] , c[13], c[14]);
pc[3]=xor(c[0], c[2] , c[6] , c[14]);
pc[4]=xor(c[7], c[8] , c[10], c[14]);

//
majority_signal=majority(A[1], A[2], A[3], A[4]);

//correct the last codeword bit
cc=xor(majority_signal, c[14]); //initially cc = c[14]

// the shifting part
always @(posedge clk)
begin
        // synchronous reset
        if (rst)
        begin
                // initialize to the codeword
                // always remember to reset
                ct <= c;
                // at reset no bits have been corrected
                step <= 0;
        end
        else
        begin
                for (i= 14; i != 0 ; --i)
                begin
                        ct[i] <= ct[i-1];
                end
                // get the first corrected bit
                ct[0] <= cc;
                // count how many bits have been corrected
                step <= step + 1;
        end
end


// Control unit
// Simple FSM to control the functionality of the corrected

// Sequential logic, going to next state in FSM
always @(posedge clk or error)
begin
        //  if an error is detected the corrector starts
        if(error)
        begin
                state <= idle;
        end
        else
        begin
                state <= next_state;
        end
end

// decide next state
always @(state or step)
begin
        case(state)
                idle:
                begin
                        next_state = correcting;
                end

                correcting:
                begin
                        // check if all the bits have been corrected
                        if(step == 15)
                                next_state = finished;
                        else
                                // keep correcting 
                                next_state = correcting;
                end

                finished:
                        next_state = idle;
                begin
                end
        endcase
end

//output logic
always @(posedge clk)
begin
        case(state)
                idle:
                begin
                        rst <= 1'b1;
                end
                correcting:
                begin
                        rst <= 1'b0;
                        //correct codeword one bit at a time
                end
                finished:
                begin
                        // finished correcting, output corrected codeword
                        ccw <= ct;
                        ready <= 1'b1;
                end
        endcase
end

endmodule
