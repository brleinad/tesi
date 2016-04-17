#!/bin/perl -w
use strict;

my $NBIT = $ARGV[0];
my $NNL = 2**($NBIT) - $NBIT - 2;

`perl ./linear_generator.pl $NBIT > gen_linear_part.v`;
`perl ./nonlinear_generator.pl $NBIT > gen_nonlinear_part.v`;

print "module gen_cla_decomposed(a,b,s);\n\n";
 
printf("input [%d:0]  a,b;\n",$NBIT-1);
printf("output [%d:0] s;\n",$NBIT-1);
printf("wire [%d:0] n;\n",$NNL);

print "gen_nonlinear_part
NLIN(
        .a (a),
        .b (b),
        .n (n)
);

gen_linear_part
LIN(
        .a (a),
        .b (b),
        .n (n),
        .s (s)
);

endmodule";
