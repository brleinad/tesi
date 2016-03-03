#!/usr/bin/perl

my $max = 0;

my $design = shift @ARGV;

opendir REPORTS, $design or die $!;

my @reports = grep(/.*\.rpt/, readdir REPORTS);

print "@reports\n";

closedir REPORTS;

for my $report (@reports)
{
	open RPT, "$design/$report" or die $!;
	print "opened report: $design/$report\n";

	my $line;
	while($line = <RPT>)
	{
		print $line;
		my $temp;

		if($line =~ /data arrival time\s*(\d*.?\d*)/)
		{
			# print "$1\n";
			$temp = $1;
			if($temp > $max)
			{
				$max = $temp;
			}
		}
	}
	
	close RPT;
}

print "The maximum delay of the cones is: $max\n";