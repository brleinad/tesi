#!/usr/bin/perl
use warnings; use strict;

my $N = 2;
my $input_value = 2**$N -1;
my @input_range = (0..$input_value);
my @output_matrix;

for (my $i = 1; $i <= $input_value; $i++)
{
    for (my $j = 1; $j <= $input_value; $j++)
    {
        $output_matrix[($i-1)*$input_value+$j] = $input_range[$i] + $input_range[$j];
    }
}

my @bin_matrix;
for (my $i = 1; $i <= $#output_matrix; $i++)
{
    @bin_matrix[$i] = &dec2bin($output_matrix[$i], $N+1);
}
@bin_matrix = @bin_matrix -48;

my $global_ones_no = 0;

#my @partial_ones_no= &zeros(&size(@bin_matrix,1),1);
for (my $i = 1; $i <= &size(@bin_matrix,1); $i++)
{
    for (my $j = 1; $j <= &size(@bin_matrix,2); $j++)
    {
        if ($bin_matrix[$i][$j] == 1)
        {
            $partial_ones_no[$i]++;
        }
    }
}

my $max_output = &max(@output_matrix);
my @output_range = (0..$max_output);

my @bin_output;
for (my $i = 1; $i <= $max_output; $i++)
{
    $bin_output[$i][:] = &dec2bin($output_range($i), $N+1);
}
@bin_output -= 48;

#@partial_ones_no= &zeros(&size(@bin_matrix,1),1);
for (my $i = 1; $i <= &size(@bin_output,2); $i++)
{
    for (my $j= 1; $j <= &size(@bin_output,2); $j++)
    {
        if ($bin_output[$i][$j] == 1)
        {
            $partial_ones_no[$i]++;
        }
    }
}

my @partial_ones_no_bis = @partial_ones_no;

my @final_assign;

for (my $i = 1; $i <= $max_output + 1; $i++)
{
    for (my $j = $max_output + 1 $j >= 0; $j--)
    {
        if ($i ~= $j)
        {
            if ($partial_ones_no[$i] == $partial_ones_no_bis[$j])
            {
                $final_assign[$i] = $j -1;
                $partial_ones_no_bis[$j] = -1;
                break;
            }
        }
    }
}
