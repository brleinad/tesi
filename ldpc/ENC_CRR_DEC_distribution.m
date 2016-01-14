%Copyright (c) 2010, Intel Corporation
%All rights reserved.
%Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
%    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
%    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
%    * Neither the name of Intel Corporation nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
%THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
%IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

function [syndrom code]= ENC_CRR_DEC_distribution(i , error_vec)
%i is 7-bit information vector and e is 15-bit error vector. 
%In vector e, the bits that you want to inject fault in the codeword, 
%enter 1 and the rest of the bits enter 0. 
%For example e=[1 0 1 0 0 0 0 0 0 0 0 0 0 0 0], enters error in codebit c0
%and c2.

     %Generator Circuit
%G_cyclic: This is the linear generator matrix. i*G_lin gives the 15-bit codeword.
%Based on this matrix, the generator polynomial is 1+x^(7)+x^(11)+x^(13)+x^(14)%
% According to this matrix the generator circuit is:
%c0=i0;
%c1=i1;
%c2=i2;
%c3=i3;
%c4=i4;
%c5=i5;
%c6=i6;
%c7=xor(i0, i1, i3);
%c8=xor(i1, i2, i4);
%c9=xor(i2, i3, i5);
%c10=xor(i3, i4, ,i6);
%c11=xor(i0, i1, i3, i4, i5);
%c12=xor(i1, i2, i4, i5, i6);
%c13=xor(i0, i1, i2, i5, i6);
%c14=xor(i0, i2, i6);
G_lin=[1  0  0  0  0  0  0  1  0  0  0  1  0  1  1;
       0  1  0  0  0  0  0  1  1  0  0  1  1  1  0;
       0  0  1  0  0  0  0  0  1  1  0  0  1  1  1;
       0  0  0  1  0  0  0  1  0  1  1  1  0  0  0;
       0  0  0  0  1  0  0  0  1  0  1  1  1  0  0;
       0  0  0  0  0  1  0  0  0  1  0  1  1  1  0;
       0  0  0  0  0  0  1  0  0  0  1  0  1  1  1]; 

   %Corrector Circuit
%H715 is the parity check matrix
%and the xor terms of the majority logic corrector is          
%A1=xor(c3, c11, c12, c14);
%A2=xor(c1, c5, c13,c14);
%A3=xor(c0,c2,c6,c14);
%A4=xor(c7,c8,c10,c14);
%majority_signal=majority(A1, A2, A3, A4);
%c14=xor(majority_signal, c14);
H715=[1 0 0 0 0 0 0 0 1 1 0 1 0 0 0;
      0 1 0 0 0 0 0 0 0 1 1 0 1 0 0;
      0 0 1 0 0 0 0 0 0 0 1 1 0 1 0;
      0 0 0 1 0 0 0 0 0 0 0 1 1 0 1;
      0 0 0 0 1 0 0 0 1 1 0 1 1 1 0;
      0 0 0 0 0 1 0 0 0 1 1 0 1 1 1;
      0 0 0 0 0 0 1 0 1 1 1 0 0 1 1;
      0 0 0 0 0 0 0 1 1 0 1 0 0 0 1];


  %Detector Circuit
%The detector circuit is implementation of this matrix  multiplication:
%H*code'
H=[ 1   0   0   0   0   0   0   0   1   1   0   1   0   0   0;   
    0   1   0   0   0   0   0   0   0   1   1   0   1   0   0;
    0   0   1   0   0   0   0   0   0   0   1   1   0   1   0;
    0   0   0   1   0   0   0   0   0   0   0   1   1   0   1;
    1   0   0   0   1   0   0   0   0   0   0   0   1   1   0;
    0   1   0   0   0   1   0   0   0   0   0   0   0   1   1;
    1   0   1   0   0   0   1   0   0   0   0   0   0   0   1;
    1   1   0   1   0   0   0   1   0   0   0   0   0   0   0;
    0   1   1   0   1   0   0   0   1   0   0   0   0   0   0;
    0   0   1   1   0   1   0   0   0   1   0   0   0   0   0;
    0   0   0   1   1   0   1   0   0   0   1   0   0   0   0;
    0   0   0   0   1   1   0   1   0   0   0   1   0   0   0;
    0   0   0   0   0   1   1   0   1   0   0   0   1   0   0;
    0   0   0   0   0   0   1   1   0   1   0   0   0   1   0;
    0   0   0   0   0   0   0   1   1   0   1   0   0   0   1];  
  %Generate the 15-bit codeword
code=mod(i*G_lin,2);
  %Injject the errors to the codeword
code=code+error_vec;
  %corrector circuit: it's left for you to implement :-)
  %....
  
  %Checking if the correction operation. The syndrome must be zero if the
  %code is corrected.
syndrom=mod(H*code',2);
%syndrom=H*code';
