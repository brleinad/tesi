#!/usr/bin/perl
use warnings; use strict;

my $s;
my $i = 0;

open(DAT,'<','results.dat');
open(ENC,'>','enc_lut.v');
print ENC <<END;
module enc_lut(s,enc_s);
`include "constants.v"

input [NBIT:0] s;
output reg [NBIT:0] enc_s;
always @(*)
begin
    case(s)
END
while (<DAT>)
{
    chomp;
    print ENC "\t$i : enc_s = $_;\n";
    $i++;
}
print ENC "\tdefault : enc_s = 0;\n";
print ENC <<END;
    endcase
end
endmodule
END

open(DAT,'<','results.dat');
open(DEC,'>','dec_lut.v');
print DEC <<END;
module dec_lut (enc_s,dec_s);
`include "constants.v"

input [NBIT:0]  enc_s;
output reg [NBIT:0]  dec_s;
always @(*)
begin
    case(enc_s)
END
$i = 0;
while (<DAT>)
{
    chomp;
    print DEC "\t$_ : dec_s = $i;\n";
    $i++;
}
print DEC "\tdefault : dec_s = 0;\n";
print DEC <<END;
    endcase
end
endmodule
END
