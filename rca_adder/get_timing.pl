#!/usr/bin/perl -w
use strict;
use warnings;

my $bit = 4;
my $i = 0;
my $line;
my @dec_timing;
my @undec_timing;
my $type="timing";
my $reports="./undecomposed/reports/$type";
my $adder="adder";

while (open(TIMING, "$reports/${bit}bit_${adder}_${type}.rpt"))
{
	while($line = <TIMING>)
	{
		if ($line =~ /Data\ Path/) 
		{
			$line =~ m/(\d+\.\d+)/;
            $undec_timing[$i] = "$1";
		}
	}		
	++$bit;
	++$i;
}

$reports="./vivsyn/reports/timing";
$adder="decomposed_rca";
$i = 0;
$bit = 4;

while (open(TIMING, "$reports/${bit}bit_${adder}_${type}.rpt"))
{
	while($line = <TIMING>)
	{
		if ($line =~ /Data\ Path\ Delay/) 
		{
			$line =~ m/(\d+\.\d+)/;
            $dec_timing[$i] = "$1";
		}
	}		
	++$bit;
	++$i;
}

$bit = 4;
print "\\begin{table}[h]\n";
print "\\centering\n";
print "\\begin{tabular}{c | c | c }\n";
print "bits\t & decomposed\t & undecomposed \\\\ \n";
print "\\hline";
for ($i=0;$i<29;$i++)
{
    print "$bit\t & $dec_timing[$i]\t & $undec_timing[$i] \\\\ \n";
    $bit++;
}
print "\\end{tabular}\n";
print "\\caption{Timing (max delay path in ns)}\n";
print "\\end{table}\n";

