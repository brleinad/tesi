module encoder_15_7 (enc_in, enc_out);

parameter NIN = 7; // number of bits for the input info 
parameter NOUT = 15; // number of bits for the output codeword

input [NBIT-1:0] enc_in;
output [NOUT-1:0] enc_out;


enc_out[NBIT-1:0] = enc_in; //the first part of the G matrix is I

//The rest of the bits are parity bits
enc_out[NBIT]   = enc_in[0] ^ enc_in[4] ^ enc_in[6];
enc_out[NBIT+1] = enc_in[0] ^ enc_in[1] ^ enc_in[4] ^ enc_in[5] ^ enc_in[6];
enc_out[NBIT+2] = enc_in[0] ^ enc_in[1] ^ enc_in[2] ^ enc_in[4] ^ enc_in[5];
enc_out[NBIT+3] = enc_in[1] ^ enc_in[2] ^ enc_in[3] ^ enc_in[5] ^ enc_in[6];
enc_out[NBIT+4] = enc_in[0] ^ enc_in[2] ^ enc_in[3];
enc_out[NBIT+5] = enc_in[1] ^ enc_in[3] ^ enc_in[4];
enc_out[NBIT+6] = enc_in[2] ^ enc_in[4] ^ enc_in[5];
enc_out[NBIT+7] = enc_in[3] ^ enc_in[5] ^ enc_in[6];

endmodule
