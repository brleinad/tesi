#!/bin/perl -w
use strict;

my $NBIT = $ARGV[0];

my $i;
my $j;
my $inter;
my $ii;
my $NNL = 2**($NBIT+1) - $NBIT - 3;

print "module gen_linear_part(a,b,n,s);\n\n";
printf("input  [%d:0] a, b; //adder inputs\n",$NBIT-1);
printf("input [%d:0] n; // non-linear outputs\n", $NNL-1);
printf("output [%d:0] s;\n\n",$NBIT-1);
printf("input [%d:0] t; // non-linear outputs\n", $NNL-1);

$i = 1; #index for g
$j = 0; #index for a, b
$inter = 3; #interval

print "//asigning bit 0\n";
print "assign s[0] = (a[0] ^ b[0]);\n";

for ($i = 1; $i != $NBIT; $i++)
{
        if (~$i % 50)
        {
                print "always @(*)\n";
        }

        print "//assigning bit $i\n";
        printf("t[%d] = n[%d];\n",$inter-$i-2,$inter-$i-2);

        for ($ii = 0; $ii < $inter - 1; $ii++)
        {
                printf("t[%d] = t[%d] ^ n[%d];\n",$inter-$i-1+$ii,$inter-$i-2+$ii,$inter-$i-1+$ii);

        }
        printf("\ns[%d] = ( a[%d] ^ b [%d] ) ^ t[%d];\n\n",$i,$i,$i,$inter-$i-2+$ii);
        $inter += 2**($i+1);
}

print "endmodule";
