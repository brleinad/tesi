#!/usr/bin/perl -w
use strict;
use warnings;

my $bit = 4;
my $i = 0;
my $line;
my @dec_area;
my @undec_area;
#my $reports="./vivsyn/reports/area";
my $reports="./undecomposed/reports/area";
#my $adder="decomposed_rca";
my $adder="adder";

while (open(AREA, "$reports/${bit}bit_${adder}_util.rpt"))
{
	while($line = <AREA>)
	{
		if ($line =~ /Slice\ LUTs/) 
		{
			$line =~ m/(\d+)/;
            $undec_area[$i] = "$1";
            #print "$bit &\t";
            #print "$1 \\\\ \n";
		}
	}		
	++$bit;
	++$i;
}

$reports="./vivsyn/reports/area";
$adder="decomposed_rca";
$i = 0;
$bit = 4;

print "decomposed rca \n";
print "bits\t & LUTs used \\\\ \n";
while (open(AREA, "$reports/${bit}bit_${adder}_util.rpt"))
{
	while($line = <AREA>)
	{
		if ($line =~ /Slice\ LUTs/) 
		{
			$line =~ m/(\d+)/;
            $dec_area[$i] = "$1";
            #print "$bit &\t";
            #print "$1 \\\\ \n";
		}
	}		
	++$bit;
	++$i;
}

$bit = 4;
print "bits\t & LUTs used & LUTs used \\\\ \n";
print "bits\t decomposed\t undecomposed \n";
for ($i=0;$i<29;$i++)
{
    print "$bit\t $dec_area[$i]\t $undec_area[$i]\n";
    $bit++;
}

