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

print "module gen_linear_part(a,b,n,s);\n
input  [$NBIT-1:0] a, b; //adder inputs
input [$NNL-1:0] n; // non-linear outputs
output [$NBIT-1:0] s;\n\n";

$i = 1; #index for g
$j = 0; #index for a, b
$inter = 3; #interval

print "assign s[0] = (a[0] ^ b[0]);\n";

for ($i = 1; $i != $NBIT; $i++)
{
        $l = $inter-$i-2;
        print "assign t[$l] = n[$l];\n";

        for ($ii = 0; $ii < $inter - 1; $ii++)
        {
                $k = $inter-$i-1+$ii;
                $l = $inter-$i-2+$ii;
                print "assign t[$k] = t[$l] ^ n[$k];\n";

        }
        $l = $inter-$i-2+$ii;
        print "\nassign s[$i] = ( a[$i] ^ b [$i] ) ^ t[$l];\n\n";
        $inter += 2**($i+1);
}

print "endmodule";
