parameter NBIT = 7; // number of bits of the adder
//parameter NNL=2**(NBIT+2)-NBIT-4; //Number of bits of the non-linear outputs
parameter NNL=(2**(NBIT+2)-NBIT-4)-2**NBIT; //Number of bits of the non-linear outputs
