#!/usr/bin/perl
use warnings; use strict;

my ($num_rows, $num_cols);
my $i= 0;
my $start;
my @row;

#my $parity_circuit = $ARGV[0];
#$parity_circuit =~ s/\.G//;
my $parity_circuit = "adder7bit_P";

print "module $parity_circuit( c, s);\n";
while(<>){
    chomp;
    if (!$num_rows) {
        m/([0-9]+) ([0-9]+).*/;
        $num_rows = $1;
        $num_cols = $2;
        printf "input [%d:0] c;\noutput [%d:0] s;\n\n", $1-1, $2-1;
    }else{
        if($start) {
            @row = split / +/ , $_;
            print "assign s[$i] = ";
            $i++;
            for (0..$#row-1){
                print "c[$row[$_]] ^ ";
            }
            print "c[$row[$#row]];\n";
        }
        if(/nzentries_per_column/){
            $start = "ok";
        }
    }
}
print "\nendmodule\n";
