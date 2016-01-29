module generator(i,c);

input [6:0] i; // information vector
output [14:0] c; // codeword
/*
* The Generator matrix is 
G=[1  0  0  0  0  0  0  1  0  0  0  1  0  1  1;
       0  1  0  0  0  0  0  1  1  0  0  1  1  1  0;
       0  0  1  0  0  0  0  0  1  1  0  0  1  1  1;
       0  0  0  1  0  0  0  1  0  1  1  1  0  0  0;
       0  0  0  0  1  0  0  0  1  0  1  1  1  0  0;
       0  0  0  0  0  1  0  0  0  1  0  1  1  1  0;
       0  0  0  0  0  0  1  0  0  0  1  0  1  1  1]; 
*/
assign c[0]=i[0];
assign c[1]=i[1];
assign c[2]=i[2];
assign c[3]=i[3];
assign c[4]=i[4];
assign c[5]=i[5];
assign c[6]=i[6];
// parity bits
xor(c[7] , i[0], i[1], i[3]);
xor(c[8] , i[1], i[2], i[4]);
xor(c[9] , i[2], i[3], i[5]);
xor(c[10], i[3], i[4], i[6]);
xor(c[11], i[0], i[1], i[3], i[4], i[5]);
xor(c[12], i[1], i[2], i[4], i[5], i[6]);
xor(c[13], i[0], i[1], i[2], i[5], i[6]);
xor(c[14], i[0], i[2], i[6]);      
                               
endmodule
