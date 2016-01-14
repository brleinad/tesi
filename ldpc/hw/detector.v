module detector(c, s, error);

input [14:0] c; // codeword
output [14:0] s; // syndrome
output error;

/*
  Detector Circuit
The detector circuit is implementation of this matrix  multiplication:
H*code'%
    0   1   2   3   4   5   6   7   8   9   10  11  12  13  14 
-------------------------------------------------------------- |
H=[ 1   0   0   0   0   0   0   0   1   1   0   1   0   0   0; | 0   
    0   1   0   0   0   0   0   0   0   1   1   0   1   0   0; | 1
  . 0   0   1   0   0   0   0   0   0   0   1   1   0   1   0; | 2
    0   0   0   1   0   0   0   0   0   0   0   1   1   0   1; | 3
    1   0   0   0   1   0   0   0   0   0   0   0   1   1   0; | 4
    0   1   0   0   0   1   0   0   0   0   0   0   0   1   1; | 5
    1   0   1   0   0   0   1   0   0   0   0   0   0   0   1; | 6
    1   1   0   1   0   0   0   1   0   0   0   0   0   0   0; | 7
    0   1   1   0   1   0   0   0   1   0   0   0   0   0   0; | 8
    0   0   1   1   0   1   0   0   0   1   0   0   0   0   0; | 9
    0   0   0   1   1   0   1   0   0   0   1   0   0   0   0; | 10
    0   0   0   0   1   1   0   1   0   0   0   1   0   0   0; | 11
    0   0   0   0   0   1   1   0   1   0   0   0   1   0   0; | 12
    0   0   0   0   0   0   1   1   0   1   0   0   0   1   0; | 13
    0   0   0   0   0   0   0   1   1   0   1   0   0   0   1];| 14  
*/
wire [14:0] s;

// syndrome vector is given by the H matrix
s[0]  = xor ( c[0] , c[8]  , c[9]  , c[11] );
s[1]  = xor ( c[1] , c[9]  , c[10] , c[12] );
s[2]  = xor ( c[2] , c[10] , c[11] , c[13] );
s[3]  = xor ( c[3] , c[11] , c[12] , c[14] );
s[4]  = xor ( c[0] , c[4]  , c[12] , c[13] );
s[5]  = xor ( c[1] , c[5]  , c[13] , c[14] );
s[6]  = xor ( c[0] , c[2]  , c[6]  , c[14] );
s[7]  = xor ( c[0] , c[1]  , c[3]  , c[7]  );
s[8]  = xor ( c[1] , c[2]  , c[4]  , c[8]  );
s[9]  = xor ( c[2] , c[3]  , c[5]  , c[9]  );
s[10] = xor ( c[3] , c[4]  , c[6]  , c[10] );
s[11] = xor ( c[4] , c[5]  , c[7]  , c[11] );
s[12] = xor ( c[5] , c[6]  , c[8]  , c[12] );
s[13] = xor ( c[6] , c[7]  , c[9]  , c[13] );
s[14] = xor ( c[7] , c[8]  , c[10] , c[14] );

// If the syndrome is non zero then we have an error
error = or ( s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7], s[8], s[9], s[10], s[11], s[12], s[13], s[14]);

endmodule
