#!/usr/bin/perl -w

use strict;
use warnings;

my $i = 1;
my $area = 0;
my $line;

print "Calculation of the total area of the linear part of the Adder decomposed into cones\n\n";

while (open(CONE, "./cones/lin_out/cell_reports/cell_lincone$i.rpt"))
{
#	open(CONE, "./cones/lin_out/cell_reports/cell_lincone$i.rpt");
	while($line = <CONE>)
	{
		if ($line =~ /Total/) # \d cells\s+\d+/) #\b\d+\b/)
		{
			$line =~ s/Total \d+ cells \s+//g;
			$area += $line;
			print "Area of cone $i is: $line";
		}
			#print "BAKLSFA Area of cone $i is: $line";
	}		
	++$i;
}

print "\nTOTAL AREA IS: $area\n";
