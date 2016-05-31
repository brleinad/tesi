#!/usr/bin/perl
use warnings; use strict;

my $N = 8; #$ARGV[0];
my $NN = 2**$N-1;
my $s;
my $i;
my $j;
my @hs;

if (!($N > 0 && $N <= 64) )
{
    print "N value not valid\n";
    exit;
}

open(DAT,'<','results.dat');

open(ADD,'>','normal_adder.v');
print  ADD <<END;
module normal_adder (a,b,s);
parameter NBIT = $N;
input [NBIT-1:0] a,b;
output reg [NBIT:0] s;
//assign s = a + b;
always @(*)
begin
    casex({a,b})
END
foreach  $i ( 0..$NN )
{
    foreach  $j (0..$NN)
    {
        $s = $i + $j;
        print ADD "\t{${N}'d$i,${N}'d$j} : s = $s;\n"
    }
}

print ADD <<END;
        default : s = 0;
    endcase
end
endmodule
END


open(DAT,'<','results.dat');
open(HADD,'>','h_adder.v');
print HADD <<END;
module h_adder (a,b,s);
parameter NBIT = $N;
input [NBIT-1:0] a,b;
output reg [NBIT:0] s;
//assign s = a + b;
always @(*)
begin
    casex({a,b})
END
while (<DAT>)
{
    chomp;
    push @hs, $_;
}

foreach  $i ( 0..$NN )
{
    foreach  $j (0..$NN)
    {
        print HADD "\t{${N}'d$i,${N}'d$j} : s = $hs[$i+$j];\n";
    }
}

print HADD <<END;
        default : s = 0;
    endcase
end
endmodule
END

print "Finished generating adders\n";

