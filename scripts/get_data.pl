#!/usr/bin/perl -w
use strict;
use warnings;

my $bit = 4;
my $i = 0;
my $line;
my @cla;
my @rca;
my $type =$ARGV[0];
#my $type="cell";
#my $type="timing";
my $reports="tcbn65gplus_reports";
my $adder="gen_cla_decomposed";
my $LINECOMP;

if ($type eq "timing")
{
    $LINECOMP = quotemeta "data arrival time";
}elsif ($type eq "cell")
{
    $LINECOMP = quotemeta "Total";
}
print $LINECOMP;

while (open(TIMING, "cla_adder/opt_decomposed/syn/$reports/${adder}${bit}bit.mapped.${type}.rpt"))
{
	while($line = <TIMING>)
	{
		if ($line =~ /$LINECOMP/) 
		{
			$line =~ m/(\d+\.\d+)/;
            $cla[$i] = "$1";
		}
	}		
	++$bit;
	++$i;
}

$bit = 4;
 $i = 0;
$adder="decomposed_rca";
while (open(TIMING, "rca_adder/syn/$reports/${adder}${bit}bit.mapped.${type}.rpt"))
{
	while($line = <TIMING>)
	{
		if ($line =~ /$LINECOMP/) 
		{
			$line =~ m/(\d+\.\d+)/;
            $rca[$i] = "$1";
		}
	}		
	++$bit;
	++$i;
}

$bit = 4;
print "\\begin{table}[h]\n";
print "\\centering\n";
print "\\begin{tabular}{c | c | c }\n";
print "bits\t & CLA\t & RCA\\\\ \n";
print "\\hline";
for ($i=0;$i<13;$i++)
{
    print "$bit\t & $cla[$i] & $rca[$i] \\\\ \n";
    $bit++;
}
print "\\end{tabular}\n";
print "\\caption{${type}}\n";
print "\\end{table}\n";
