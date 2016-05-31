#!/usr/bin/perl
# ===============================================
# Author   	: Satish Grandhi
# Modified by: Daniel Rodas Bautista
# Date     	: 2016-05-07
# ===============================================

use warnings; use strict;

# All the Variables
my $Count = 0;
my @Storing_Complete_Data ;
my $i ;
my $j ;
my @Matrix_Format ;
my $Number_Of_Outputs;
my $Number_Of_Inputs;
my @dummy;
my $temp ;

my $Input_Generator_Matrix_Filename = $ARGV[0];
my $Output_Dump_File  = $ARGV[1];

open (GENERATOR_MATRIX_FILE, "<$Input_Generator_Matrix_Filename") ;
open (ENCODER_FILE, ">$Output_Dump_File");

while (<GENERATOR_MATRIX_FILE>) {
 	chomp;
	my $Temp = $_;
	if($Count == 0)
	{
		@dummy = split ('\s', $_);
		$Number_Of_Outputs =  $dummy[0];
		$Number_Of_Inputs  =  $dummy[1];
		$Count = $Count + 1 ;
		
		print "$Number_Of_Outputs : $Number_Of_Inputs \n";
		print ENCODER_FILE "module Encoder_Logic(\n" ;
		my $dummy1 = $Number_Of_Inputs  - 1;
		my $dummy2 = $Number_Of_Outputs - 1;
		print ENCODER_FILE "in  [$dummy1:0] iv_data;\n" ;
		print ENCODER_FILE "out [$dummy2:0] ov_data;\n" ;
		print ENCODER_FILE ") ;										\n" ;

		my $Loop_Count = 0 ;
	}
	else
	{
		my @dummy = split ('\s', $_);
		$temp = $Count - 1 ;
		print ENCODER_FILE "\tassign ov_data($temp) = ";

	        if($dummy[0] == $#dummy)
	        {
		        for($j=1 ; $j<=$#dummy ; $j++)
		        {
			        $temp = $dummy[$j] - 1 ;
				
				if($j == 1 && $#dummy == 1)
			        {
				        print ENCODER_FILE "iv_data($temp) ;\n";
  			        }
			        elsif($j == 1)
			        {
				        print ENCODER_FILE "iv_data($temp) ";
  			        }
			        elsif($j == $#dummy)
			        {
				        print ENCODER_FILE "^ iv_data($temp) ;\n";
			        }
			        else
			        {
				        print ENCODER_FILE "^ iv_data($temp) ";
			        }
		        }
	        }
		$Count = $Count + 1 ;
	}
}
print ENCODER_FILE "endmodule;\n" ;

close(GENERATOR_MATRIX_FILE);
close(ENCODER_FILE);
