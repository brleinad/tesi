#!/usr/bin/perl -w
use strict;
use warnings;

my $bit = 4;
my $i = 0;
my $line;
my @dec;
my $type="timing";
my $reports="./tcbn65gplus_reports";
my $adder="gen_cla_decomposed";

while (open(TIMING, "$reports/${adder}${bit}bit.mapped.${type}.rpt"))
{
	while($line = <TIMING>)
	{
		if ($line =~ /data arrival time\s+\d/) 
		{
			$line =~ m/(\d+\.\d+)/;
            $dec[$i] = "$1";
		}
	}		
	++$bit;
	++$i;
}

$bit = 4;
#print "\\begin{table}[h]\n";
#print "\\centering\n";
#print "\\begin{tabular}{c | c | c }\n";
print "bits\t & decomposed\t & undecomposed \\\\ \n";
#print "\\hline";
for ($i=0;$i<13;$i++)
{
    print "$bit\t & $dec[$i]\\\\ \n";
    $bit++;
}
#print "\\end{tabular}\n";
#print "\\caption{Power}\n";
#print "\\end{table}\n";
