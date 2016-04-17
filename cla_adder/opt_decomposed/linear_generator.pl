#!/bin/perl -w
use strict;

my $NBIT = $ARGV[0];

my $i;
my $j;
my $inter;
my $ii;
my $NNL = 2**($NBIT) - $NBIT - 2;

print "module gen_linear_part(a,b,n,s);\n\n";
printf("input  [%d:0] a, b; //adder inputs\n",$NBIT-1);
printf("input [%d:0] n; // non-linear outputs\n", $NNL);
printf("output [%d:0] s;\n\n",$NBIT-1);

printf("wire [%d:0] t; // non-linear outputs\n", $NNL);
$i = 1; #index for g
$ii = 0; #index for g
$j = 0; #index for a, b
$inter = 3; #interval

print "//asigning bit 0\n";
print "assign s[0] = a[0] ^ b[0];\n";

printf("assign t[%d] = n[%d];\n",$inter-$i-2,$inter-$i-2);
for ($i = 1; $i != $NBIT; $i++)
{
    print "\n//asigning bit $i\n";
    printf("assign s[%d] = ( a[%d] ^ b [%d] ) ^ t[%d];\n\n",$i,$i,$i,$j);

    if ($i == $NBIT -1)
    {
        last;
    }else
    {
        printf("assign t[%d] = n[%d];\n",$inter-$i-1,$inter-$i-1);
        for ($ii = 0; $ii != $inter-1; $ii++)
        {
            $j = $inter-$i+$ii;
            printf("assign t[%d] = t[%d] ^ n[%d];\n",$j,$j-1,$j);

        }
        $inter += 2**($i+1);
    }
    
}

print "endmodule";
