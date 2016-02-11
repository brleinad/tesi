#!/usr/bin/perl

opendir DATA_DIR, ".";

my @data_files = grep(/.*\.dat/, readdir DATA_DIR);

print "@data_files\n";

closedir DATA_DIR;

my $title = "delay";
my @rows;

my $data_cnt = 0;
for my $data_file (@data_files)
{
	open RPT, "$data_file" or die $!;
	print "opened data_file: $data_file\n";

	my ($cone) = $data_file =~ /(\w+)\.dat/;
	$title .= ",pdf\_$cone";

	my @data_line;

	my $line;
	my $line_cnt = 0;
	while($line = <RPT>)
	{
		# print $line;
		chomp($line);

		my ($delay, $pdf) = $line =~ /(\d+(?:\.?\d+[eE]?[+-]?\d*)?),(\d+(?:\.?\d+[eE]?[+-]?\d*)?)/;

		if($delay =~ /[eE]/)
		{
			$delay = sprintf("%.8E", $delay);
		}

		if($pdf =~ /[eE]/)
		{
			$pdf = sprintf("%.8f", $pdf);
		}

		# print "delay = $delay, pdf = $pdf\n";

		if($data_cnt == 0)
		{
			$rows[$line_cnt][0] = $delay;
		}
		$rows[$line_cnt++][$data_cnt + 1] = $pdf;
	}

	close RPT;
	$data_cnt++;
}

open PDF_OUT, "> ./Output.txt" or die $!;
print PDF_OUT "$title\n";

for my $row (@rows)
{
	my $print_line = join(',', @{$row});
	print "$row->[0]\n";
	print PDF_OUT "$print_line\n";
}

close PDF_OUT;