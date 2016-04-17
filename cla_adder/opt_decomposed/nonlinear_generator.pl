#!/bin/perl -w
use strict;

my $NBIT = $ARGV[0];

my $i;
my $j;
my $inter;
my $ii;
my $NNL = 2**($NBIT) - $NBIT - 2;

print "module gen_nonlinear_part(a,b,n);\n";
printf("input  [%d:0] a, b; //adder inputs\n", $NBIT-1);
printf("output [%d:0] n; // non-linear outputs\n\n", $NNL);

$i = 0; #index for g
$j = 0; #index for a, b
$inter = 1; #interval

printf("wire [%d:0] g; \n\n", $NNL);
print "assign n = g; //assign outputs\n\n";

while ($i < $NNL)
{
    printf("//Assigning outputs for input bit %d\n", $j+1);
    if ($i==0)
    {
        print "assign g[$i] = a[$j] & b[$j];\n";
        $i++;
        $j++;
    }else
    {
        print "assign g[$i] = a[$j] & b[$j];\n";
        $i++;  #go to next g

        for ($ii = 0; $ii < $inter; $ii++ )
        {
            printf("assign g[%d] = a[%d] & g[%d];\n", $i+$ii, $j, $i+$ii-$inter-1 );
            printf("assign g[%d] = b[%d] & g[%d];\n", $i+$ii+$inter, $j, $i+$ii-$inter-1);
        }
        $i += $inter + $ii; #go to next g after the last one assigned
        $inter += 2**$j; # interval increases exponentially 
        $j++;  #go to next input bit
    }
}
print "endmodule"
