module detector_15_7 (codeword, syndrome);

input [14:0] codeword;
output [8:0] syndrome;


//this is all wrong
syndrome[0] = codeword[0] ^ codeword[2] ^ codeword[3] ^ codeword[11];
syndrome[2] = codeword[0] ^ codeword[2] ^ codeword[3] ^ codeword[11];
syndrome[3] = codeword[0] ^ codeword[2] ^ codeword[3] ^ codeword[11];
syndrome[4] = codeword[0] ^ codeword[2] ^ codeword[3] ^ codeword[11];
syndrome[5] = codeword[0] ^ codeword[2] ^ codeword[3] ^ codeword[11];
syndrome[6] = codeword[0] ^ codeword[2] ^ codeword[3] ^ codeword[11];
syndrome[7] = codeword[0] ^ codeword[2] ^ codeword[3] ^ codeword[11];
syndrome[8] = codeword[0] ^ codeword[2] ^ codeword[3] ^ codeword[11];

endmodule
