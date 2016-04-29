#!/usr/bin/perl -w
use strict;
use warnings;

my $bit = 4;
my $i = 0;
my $line;
my @dec_area;
my @undec_area;
#my $reports="./undecomposed/normal_reports/area";
#my $adder="normal_adder";
my $reports="./undecomposed/adder_reports/area";
my $adder="adder";

while (open(AREA, "$reports/${bit}bit_${adder}_util.rpt"))
{
	while($line = <AREA>)
	{
		if ($line =~ /Slice\ LUTs/) 
		{
			$line =~ m/(\d+)/;
            $undec_area[$i] = "$1";
		}
	}		
	++$bit;
	++$i;
}

$reports="./vivsyn/reports/area";
$adder="decomposed_rca";
$i = 0;
$bit = 4;

while (open(AREA, "$reports/${bit}bit_${adder}_util.rpt"))
{
	while($line = <AREA>)
	{
		if ($line =~ /Slice\ LUTs/) 
		{
			$line =~ m/(\d+)/;
            $dec_area[$i] = "$1";
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
    print "$bit\t & $dec_area[$i]\t & $undec_area[$i] \\\\ \n";
    $bit++;
}
print "\\end{tabular}\n";
print "\\caption{Number of LUTs used}\n";
print "\\end{table}\n";

