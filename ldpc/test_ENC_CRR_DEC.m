%clc, clear all, close all,

%i =  zeros(1,7);
i = [1,0,1,0,0,0,0];
%e =  zeros(1,15);
e = [1,1,0,0,0,0,0,0,0,0,0,0,0,0,0];

[syndrome code] = ENC_CRR_DEC_distribution(i , e)

