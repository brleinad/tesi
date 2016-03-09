#!/bin/perl -w
use strict;

#my $input_file  = $ARGV[0];
my $NBIT = $ARGV[0];
#my $output_file = $ARGV[1];
#
#open (INPUT_FILE,  "<$input_filename") ;
#open (OUTPUT_FILE, ">$output_file");

my $i;
my $j;
my $k;
my $l;
my $kk;
my $ll;
my $inter;
my $ii;
#my $NBIT = 4;
my $NNL = 2**($NBIT+1) - $NBIT - 3;

print "module gen_nonlinear_part(a,b,n);\n
input  [$NBIT-1:0] a, b; //adder inputs
output [$NNL-1:0] n; // non-linear outputs\n\n";

$i = 1; #index for g
$j = 0; #index for a, b
$inter = 1; #interval

print "wire [$NNL:0] g;\n\n"; 

print "assign g[0] = 0;\n"; 

while ($i < $NNL)
{
        print "//Assigning outputs for input bit $j\n";
        print "assign g[$i] = a[$j] & b[$j];\n";
        $i++;  #go to next g

        for ($ii = 0; $ii < $inter; $ii++ )
        {
                $k = $i + $ii;
                $l = $i + $ii + $inter;
                $kk = $i+$ii-$inter-1;
                $ll = $i+$ii-$inter-1;
                print "assign g[$k] = a[$j] & g[$kk];\n";
                print "assign g[$l] = b[$j] & g[$ll];\n";
        }
        $i += $inter + $ii; #go to next g after the last one assigned
        $j++;  #go to next input bit
        $inter += 2**$j; # interval increases exponentially 
}
print "assign n = g[$NNL:1]; //assign outputs\n";
print "endmodule"
