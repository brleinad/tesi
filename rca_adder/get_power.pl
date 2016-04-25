#!/usr/bin/perl -w
use strict;
use warnings;

my $bit = 4;
my $i = 0;
my $line;
my @dec_power;
my @undec_power;
my $type="power";
my $reports="./undecomposed/reports/power";
my $adder="adder";

while (open(POWER, "$reports/${bit}bit_${adder}_${type}.rpt"))
{
	while($line = <POWER>)
	{
		if ($line =~ /Total\ On/) 
		{
			$line =~ m/(\d+\.\d+)/;
            $undec_power[$i] = "$1";
		}
	}		
	++$bit;
	++$i;
}

$reports="./vivsyn/reports/power";
$adder="decomposed_rca";
$i = 0;
$bit = 4;

while (open(POWER, "$reports/${bit}bit_${adder}_${type}.rpt"))
{
	while($line = <POWER>)
	{
		if ($line =~ /Total\ On/) 
		{
			$line =~ m/(\d+\.\d+)/;
            $dec_power[$i] = "$1";
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
    print "$bit\t & $dec_power[$i]\t & $undec_power[$i] \\\\ \n";
    $bit++;
}
print "\\end{tabular}\n";
print "\\caption{Power}\n";
print "\\end{table}\n";

