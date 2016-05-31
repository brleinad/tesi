#!/usr/bin/perl

use strict;
use warnings;

my $original_nl;
my @outputs;
my @inputs;

my %inv_hash;

my $VERILOG_FILE = shift @ARGV;

my $gate_pattern = "XNOR2D0|XOR2D0|CKXOR2D1|CKXOR2D1HVT|ND2D0|INVD0|OR2D0|NR2D0|AN2D0|CLKBUF_X1";

# Open the original circuit to be split
open CKT, $VERILOG_FILE or die $!;
open CKT_TEMP, "> temp.v" or die $!;
print "\n################# ckt2cones.pl\n\nThe verilog file: $VERILOG_FILE has been accepted\nProcess Begin...\n\n";
print "The netlist is:\n-------------------------------------\n";

while($original_nl = <CKT>)
{
	$original_nl =~ s/\/\/.*//;
	if($original_nl !~ /^\s*$/)
	{
		if($original_nl !~ /;$/)
		{
			$original_nl =~ s/\s+$//;
			chomp($original_nl);
			print CKT_TEMP $original_nl;
		}
		else
		{
			print CKT_TEMP "$original_nl";
		}
	}
}

close CKT;
close CKT_TEMP;

open CKT_TEMP, "temp.v" or die $!;

# while($original_nl = <CKT_TEMP>)
# {
# 	# print $original_nl;
# 	chomp($original_nl);
# 	# check if this is a gate description line
# 	# such as and2 g06(.a(n10), .b(n6), .O(e));
# 	if($original_nl =~ /INVD0/)
# 	{
# 		if($original_nl =~ /\[\d+\]/)
# 		{
# 			my @vecs = ($original_nl =~ /(\w+)\[\d+\]/g);
# 			for my $element (@vecs)
# 			{
# 				$original_nl =~ s/$element\[(\d+)\]/$element\_\_$1/;
# 			}
# 		}
		
# 		$original_nl =~ /\.\w+\s*\((\w+)\)\s*,\s*\.\w+\s*\((\w+)\)/;
# 		$inv_hash{$2} = "~$1";
# 		# print "  assign $out = ~$left;\n";
# 	}
# }

close CKT_TEMP;
open CKT_TEMP, "temp.v" or die $!;

while($original_nl = <CKT_TEMP>)
{
	# print $original_nl;
	chomp($original_nl);

	if($original_nl =~ /wire/)
	{
		if($original_nl !~ /\[\d+:\d+\]/)
		{
			print "$original_nl\n";
		}
	}

	# Get the ouputs and store into a @outputs array
	elsif($original_nl =~ /output/)
	{
		$original_nl =~ s/\s*output\s+//;

		if($original_nl =~ /\[(\d+):(\d+)\]\s+.*;/)
		{
			my $range_from = $1;
			my $range_to = $2;

			if($range_from > $range_to)
			{
				my $temp;

				$temp = $range_from;
				$range_from = $range_to;
				$range_to = $temp;
			}

			$original_nl =~ s/\[.*\]\s*//;
			$original_nl =~ s/;//;

			@outputs = split /\s*,\s*/, $original_nl;
			my $new_output = "  output";

			foreach my $output (@outputs)
			{
				for(my $i = $range_from; $i <= $range_to; $i++)
				{
					$new_output .= ", $output\_\_$i";
				}
			}
			$new_output .= ";";
			$new_output =~ s/output\s*,/output/;

			print "$new_output\n";
		}
		else
		{
			print "  output $original_nl\n";
		}
	}

	# Get the inputs
	elsif($original_nl =~ /input/)
	{
		$original_nl =~ s/\s*input\s+//;

		if($original_nl =~ /\[(\d+):(\d+)\]\s*(.*);/)
		{
			my $range_from = $1;
			my $range_to = $2;
			my $output_list = $3;

			if($range_from > $range_to)
			{
				my $temp;

				$temp = $range_from;
				$range_from = $range_to;
				$range_to = $temp;
			}

			$original_nl =~ s/\[.*\]\s*//;
			$original_nl =~ s/;//;

			@inputs = split /\s*,\s*/, $original_nl;
			my $new_input = "  input";

			foreach my $input (@inputs)
			{
				for(my $i = $range_from; $i <= $range_to; $i++)
				{
					$new_input .= ", $input\_\_$i";
				}
			}
			$new_input .= ";";
			$new_input =~ s/input\s*,/input/;

			print "$new_input\n";
		}
		else
		{
			print "  input $original_nl\n";
		}
	}

	# check if this is a gate description line
	# such as and2 g06(.a(n10), .b(n6), .O(e));
	elsif($original_nl =~ /($gate_pattern)/)
	{
		my $gate_type = $1;
		my $left;
		my $right;
		my $out;

		if($original_nl =~ /\[\d+\]/)
		{
			my @vecs = ($original_nl =~ /(\w+)\[\d+\]/g);
			for my $element (@vecs)
			{
				$original_nl =~ s/$element\[(\d+)\]/$element\_\_$1/;
			}
		}

		if($gate_type eq 'INVD0')
		{
			$original_nl =~ /\.\w+\s*\((\w+)\)\s*,\s*\.\w+\s*\((\w+)\)/;
			$left = $1;
			$out = $2;
			print "  assign $out = ~$left;\n";
		}
		
		if($gate_type eq 'CLKBUF_X1')
		{
			$original_nl =~ /\.\w+\s*\((\w+)\)\s*,\s*\.\w+\s*\((\w+)\)/;
			$left = $1;
			$out = $2;
			if(exists $inv_hash{$1})
			{
				$left = $inv_hash{$1};
			}

			print "  assign $out = $left;\n";
		}
		if($gate_type eq 'AN2D0')
		{
			$original_nl =~ /\.\w+\s*\((\w+)\)\s*,\s*\.\w+\s*\((\w+)\)\s*,\s*\.\w+\s*\((\w+)\)/;
			$left = $1;
			$right = $2;
			$out = $3;
			if(exists $inv_hash{$1})
			{
				$left = $inv_hash{$1};
			}

			if(exists $inv_hash{$2})
			{
				$right = $inv_hash{$2};
			}
			print "  assign $out = $left & $right;\n";
		}
		elsif($gate_type eq 'ND2D0')
		{
			$original_nl =~ /\.\w+\s*\((\w+)\)\s*,\s*\.\w+\s*\((\w+)\)\s*,\s*\.\w+\s*\((\w+)\)/;
			$left = $1;
			$right = $2;
			$out = $3;
			if(exists $inv_hash{$1})
			{
				$left = $inv_hash{$1};
			}

			if(exists $inv_hash{$2})
			{
				$right = $inv_hash{$2};
			}
			print "  assign $out = ~($left & $right);\n";
		}
		elsif($gate_type eq 'OR2D0')
		{
			$original_nl =~ /\.\w+\s*\((\w+)\)\s*,\s*\.\w+\s*\((\w+)\)\s*,\s*\.\w+\s*\((\w+)\)/;
			$left = $1;
			$right = $2;
			$out = $3;
			if(exists $inv_hash{$1})
			{
				$left = $inv_hash{$1};
			}

			if(exists $inv_hash{$2})
			{
				$right = $inv_hash{$2};
			}
			print "  assign $out = $left | $right;\n";
		}
		elsif($gate_type eq 'NR2D0')
		{
			$original_nl =~ /\.\w+\s*\((\w+)\)\s*,\s*\.\w+\s*\((\w+)\)\s*,\s*\.\w+\s*\((\w+)\)/;
			$left = $1;
			$right = $2;
			$out = $3;
			if(exists $inv_hash{$1})
			{
				$left = $inv_hash{$1};
			}

			if(exists $inv_hash{$2})
			{
				$right = $inv_hash{$2};
			}
			print "  assign $out = ~($left | $right);\n";
		}
		elsif($gate_type eq 'XOR2D0' or $gate_type eq 'CKXOR2D1'or $gate_type eq 'CKXOR2D1HVT')
		{
			$original_nl =~ /\.\w+\s*\((\w+)\)\s*,\s*\.\w+\s*\((\w+)\)\s*,\s*\.\w+\s*\((\w+)\)/;
			$left = $1;
			$right = $2;
			$out = $3;
			if(exists $inv_hash{$1})
			{
				$left = $inv_hash{$1};
			}

			if(exists $inv_hash{$2})
			{
				$right = $inv_hash{$2};
			}
			print "  assign $out = $left ^ $right;\n";
		}
		elsif($gate_type eq 'XNOR2D0' )
		{
			$original_nl =~ /\.\w+\s*\((\w+)\)\s*,\s*\.\w+\s*\((\w+)\)\s*,\s*\.\w+\s*\((\w+)\)/;
			$left = $1;
			$right = $2;
			$out = $3;
			if(exists $inv_hash{$1})
			{
				$left = $inv_hash{$1};
			}

			if(exists $inv_hash{$2})
			{
				$right = $inv_hash{$2};
			}
			print "  assign $out = ~($left ^ $right);\n";
		}
	}
}

# we have got all information of the whole circuit
# close it
close CKT_TEMP;
unlink "temp.v";
