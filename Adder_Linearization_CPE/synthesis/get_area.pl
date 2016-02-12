#!/usr/bin/perl

use strict;
use warnings;

my $i = 1;
my $area = 0;
my $line;

print "Calculation of the total area of the Nonlinear Adder decomposed into cones\n\n";

while (open(CONE, "./cones/cell_reports/cell_cone$i.rpt"))
{
	while($line = <CONE>)
	{
		#if (/Total/)
		if ($line =~ /Total \d cells\s+\d+/) #\b\d+\b/)
		{
			#print "$line\n";#if /Total/;
			$line =~ s/Total \d cells \s+//g;
			#print "$line\n";#if /Total/;
			$area += $line;
			print "Area of cone $i is: $line\n";
		}
	}		
	++$i;
}

print "\nTOTAL AREA IS: $area\n";
