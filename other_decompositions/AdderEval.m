function [final_assign]= AdderEval (N)

input_value= 2^N - 1;

input_range= (0:1:input_value);

output_matrix= [];

for i=1:length(input_range)
    for j=1:length(input_range)
        output_matrix((i-1)*length(input_range) + j)= input_range(i) + input_range(j);
    end;
end;

bin_matrix= [];
for i=1:length(output_matrix)
    bin_matrix(i,:)= dec2bin (output_matrix(i), N+1);
end;
bin_matrix= bin_matrix - 48;

global_ones_no= 0;
for i=1:size(bin_matrix,1)
    for j=1:size(bin_matrix,2)
        if bin_matrix(i,j)==1
            global_ones_no= global_ones_no + 1;
        end;
    end;
end;

partial_ones_no= zeros(size(bin_matrix,1),1);
for i=1:size(bin_matrix,1)
    for j=1:size(bin_matrix,2)
        if bin_matrix(i,j)==1
            partial_ones_no(i)= partial_ones_no(i) + 1;
        end;
    end;
end;

max_output= max (output_matrix);
output_range= (0:1:max_output);

bin_output= [];
for i=1:length(output_range)
    bin_output(i,:)= dec2bin (output_range(i), N+1);
end;
bin_output= bin_output - 48;

partial_ones_no= zeros(size(bin_output,1),1);
for i=1:size(bin_output,1)
    for j=1:size(bin_output,2)
        if bin_output(i,j)==1
            partial_ones_no(i)= partial_ones_no(i) + 1;
        end;
    end;
end;

partial_ones_no_bis= partial_ones_no;

final_assign= zeros (1, max_output+1);

for i=1:length(final_assign)
    for j=length(final_assign):-1:1
        if i~=j
            if partial_ones_no(i)==partial_ones_no_bis(j)
                final_assign(i)= j-1;
                partial_ones_no_bis(j)= -1;
                break;
            end;
        end;
    end;
end;

