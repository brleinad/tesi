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
c[0]=i[0];
c[1]=i[1];
c[2]=i[2];
c[3]=i[3];
c[4]=i[4];
c[5]=i[5];
c[6]=i[6];
// parity bits
c[7]=xor(i[0], i[1], i[3]);
c[8]=xor(i[1], i[2], i[4]);
c[9]=xor(i[2], i[3], i[5]);
c[10]=xor(i[3], i[4]], ,i[6]);
c[11]=xor(i[0], i[1], i[3], i[4], i[5]);
c[12]=xor(i[1], i[2], i[4], i[5], i[6]);
c[13]=xor(i[0], i[1], i[2], i[5], i[6]);
c[14]=xor(i[0], i[2], i[6]);      
                               
endmodule
