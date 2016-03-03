#!/usr/bin/perl

my %gate_type_map;

$gate_type_map{"INV"} = 0;
$gate_type_map{"AN2"} = 1;
$gate_type_map{"OR2"} = 2;
$gate_type_map{"XOR2"} = 3;
$gate_type_map{"ND2"} = 4;
$gate_type_map{"NR2"} = 5;
$gate_type_map{"XNR2"} = 6;

# gate type list, if more gates added, just modify here
# then the gate keywords will be able to be detected by the script
# Notice: use '?:' to force the parentheses grouping without populating the backreference variables.
my $gate_pattern = "(?:AN2|INV|OR2|XOR2|ND2|NR2|XNR2)";

opendir REPORTS, "./reports/timing";

my @reports = grep(/.*\.rpt/, readdir REPORTS);

print "@reports\n";

closedir REPORTS;

mkdir "runpdf", 0775;


for my $report (@reports)
{
	open RPT, "./reports/timing/$report" or die $!;
	print "opened report: $report\n";

	open CONVER_CRITICAL, "> ./runpdf/$report" or die $!;

	my $line;
	my $netcnt;
	my @critical_list;
	while($line = <RPT>)
	{
		print $line;
		my $gate_type;

		if($line =~ /U\d*\/\w+\s*\((\w+)\)/)
		{
			$netcnt++;
			print "$netcnt\n";
			($gate_type) = $1 =~ /($gate_pattern)/;
			print "$gate_type -> $gate_type_map{$gate_type}\n";
			push @critical_list, "n$netcnt\_$gate_type_map{$gate_type}\n";
		}
	}
	
	print CONVER_CRITICAL @critical_list;

	close CONVER_CRITICAL;
	close RPT;

	if(@critical_list == 0)
	{
		print "no path in file: $report\n";
		system("rm runpdf/$report");
	}
}