clc, clear all, close all,
N = 8;
final_assign= AdderEval(N);
disp ('Assigment table');
num = [0:1:2^N];
bit = dec2bin(num,N);
out = dec2bin(final_assign,N+1);
for i=1:length(final_assign)
    s= sprintf ('Input: %d; \t Output: %d', i-1, final_assign(i));
    %s= sprintf ('Input: %d; \t Output: %d', bit(i), out(i));
    disp (s);
end;

fid=fopen('./results.dat','w');
%fprintf(fid,'%5d %5d\n', num, final_assign);
fprintf(fid,'%d\n', final_assign);
fclose(fid);

%exit
