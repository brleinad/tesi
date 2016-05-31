#!/usr/bin/perl 
# Description	: This script will convert verilog into a specific format
use strict; use warnings;

### Reading the netlist from command line
my $Input_Filename = $ARGV[0] 		;
my $Output_Filename = $ARGV[1] 		;
my $linking_Nodes_To_numbers_Filename = $ARGV[2] 		;
my %Hash_Table_Linking_Nodenames_To_Numbers;
my %Hash_Table_Linking_Numbers_To_Nodenames ;
my %Hash_Table_Linking_GATES_To_OUTPUT_Nodes	;
my $Gate_Count = 0;

my @dummy ;
my @dummy1 ;
my @Inputpin_array ;
my $ITEM ;
my $count_loop ;
my $No_Of_Nodes ;
my $i ;
my $Key ;
my $Value ;
my $Count_Loop ;
my $Input_Node_Status ;
my $Corresponding_Eqn ;
my $Node_Under_Consideration ;
my $Input_Pins ;
my $Output_Pins ;
my $Internal_Pins ;
my $dummy_Output ;
my $Start_Processing_Internal_Nodes ;

####################################################################
####
#### Step 1 : Count all the PI's , PO's & the list of Internal Nodes
####
####################################################################

open (INPUT_FILE, "<$Input_Filename");
open (OUTPUT_FILE, ">$Output_Filename");
open (DUMP_LINK_FILE, ">$linking_Nodes_To_numbers_Filename");

$count_loop = 0 ;
$Input_Pins = 0 ;
$Output_Pins = 0 ;
$Internal_Pins = 0 ;

while (<INPUT_FILE>) {
 	chomp;
	
	if($_ =~ m/module/i)
	{
	}
	elsif($_ =~ m/\binput\b/i)
	{
		$_ =~ s/\binput\b//g;
		$_ =~ s/\s//g;
		$_ =~ s/;//g;
		$_ =~ s/\[//g;
		
		if($_ =~ m/\,/i)
		{
			@dummy = split(/\,/, $_);
			
			foreach (@dummy) 
			{
				$Key   = $dummy[$Input_Pins];
				$Value = $count_loop;
				$Hash_Table_Linking_Nodenames_To_Numbers{$Key} = $Value;
				$Hash_Table_Linking_Numbers_To_Nodenames{$Value} = $Key;
				$count_loop = $count_loop + 1 ;
			
				$Input_Pins = $Input_Pins + 1 ;
				push(@Inputpin_array , $Key);
			} 
		}
		else
		{

			@dummy = split(/\]/, $_);
			@dummy1 = split(/:/, $dummy[0]);
		
			for ($i = $dummy1[1]; $i <= $dummy1[0]; $i++) 
			{
				$Key   = $dummy[1] . '[' . $i . ']';
				$Value = $count_loop;
				$Hash_Table_Linking_Nodenames_To_Numbers{$Key} = $Value;
				$Hash_Table_Linking_Numbers_To_Nodenames{$Value} = $Key;
				$count_loop = $count_loop + 1 ;
			
				$Input_Pins = $Input_Pins + 1 ;
			}
		}
	}
	
	elsif($_ =~ m/\boutput\b/i )
	{
		$_ =~ s/\boutput\b//g;
		$_ =~ s/\s//g;
		$_ =~ s/;//g;
		$_ =~ s/\[//g;
		
		if($_ =~ m/\,/i)
		{
			@dummy = split(/\,/, $_);
			
			foreach (@dummy) 
			{
				$Key   = $dummy[$Output_Pins];
				$Value = $count_loop;
				$Hash_Table_Linking_Nodenames_To_Numbers{$Key} = $Value;
				$Hash_Table_Linking_Numbers_To_Nodenames{$Value} = $Key;
				$count_loop = $count_loop + 1 ;
			
				$Output_Pins = $Output_Pins + 1 ;
			} 
		}
		else
		{
			$dummy_Output = $_ ;

			@dummy = split(/\]/, $dummy_Output);
			@dummy1 = split(/:/, $dummy[0]);
		
			for ($i = $dummy1[1]; $i <= $dummy1[0]; $i++) 
			{
				$Key   = $dummy[1] . '[' . $i . ']';
				$Value = $count_loop;
				$Hash_Table_Linking_Nodenames_To_Numbers{$Key} = $Value;
				$Hash_Table_Linking_Numbers_To_Nodenames{$Value} = $Key;
				$count_loop = $count_loop + 1 ;
			
				$Output_Pins = $Output_Pins + 1 ;
			}
		}
	}
	
	if($_ =~ m/\bwire\b/i )
	{
		$_ =~ s/\bwire\b//g;
		$_ =~ s/\s//g;
		$_ =~ s/;//g;

		@dummy = split(/,/, $_);
		
		foreach (@dummy) {

			$Key   = $_;
			$Value = $count_loop;
			$Hash_Table_Linking_Nodenames_To_Numbers{$Key} = $Value;
			$Hash_Table_Linking_Numbers_To_Nodenames{$Value} = $Key;
			$count_loop = $count_loop + 1 ;
			
			$Internal_Pins = $Internal_Pins + 1 ;
		}
	}
	
	

	if($_ =~ m/\bXOR2D0\b/i || $_ =~ m/\bXOR3D0\b/i || $_ =~ m/\bXOR4D0\b/i)
	{
		$Start_Processing_Internal_Nodes = 0 ;
		$_ =~ s/\bXOR2D0\b//;
		$_ =~ s/\bXOR3D0\b//;
		$_ =~ s/\bXOR4D0\b//;
		$_ =~ s/\s//g;
		$_ =~ s/.A1//;
		$_ =~ s/.A2//;
		$_ =~ s/.A3//;
		$_ =~ s/.A4//;
		$_ =~ s/.ZN//;
		$_ =~ s/.Z//;
		$_ =~ s/\)//g;
		$_ =~ s/\(\(/,/;
		$_ =~ s/;//;
		$_ =~ s/\(//g;
		
		@dummy = split(/,/, $_);
		
		$Key   = $dummy[$#dummy];
		
		if($#dummy == 3)
		{
			$Value =  'GATE_XOR' .  '-' . $dummy[1] . ',' . $dummy[2] ;
		}		
		
		if($#dummy == 4)
		{
			$Value =  'GATE_XOR' .  '-' . $dummy[1] .  ',' . $dummy[2]  .  ',' . $dummy[3] ;
		}		
		

		if($#dummy == 5)
		{
			$Value =  'GATE_XOR' .  '-' . $dummy[1] .  ',' . $dummy[2]  .  ',' . $dummy[3]  .  ',' . $dummy[4] ;
		}		
		
		$Hash_Table_Linking_GATES_To_OUTPUT_Nodes{$Key} = $Value;
		#print DUMP_LINK_FILE "XOR : $Key $Value \n";
	}

	if($_ =~ m/\bXNR2D0\b/i || $_ =~ m/\bXNR3D0\b/i || $_ =~ m/\bXNR4D0\b/i)
	{
		$Start_Processing_Internal_Nodes = 0 ;
		$_ =~ s/\bXNR2D0\b//;
		$_ =~ s/\bXNR3D0\b//;
		$_ =~ s/\bXNR4D0\b//;
		$_ =~ s/\s//g;
		$_ =~ s/.A1//;
		$_ =~ s/.A2//;
		$_ =~ s/.A3//;
		$_ =~ s/.A4//;
		$_ =~ s/.ZN//;
		$_ =~ s/.Z//;
		$_ =~ s/\)//g;
		$_ =~ s/\(\(/,/;
		$_ =~ s/;//;
		$_ =~ s/\(//g;
		
		@dummy = split(/,/, $_);
		
		$Key   = $dummy[$#dummy];
		
		if($#dummy == 3)
		{
			$Value =  'GATE_XNR' .  '-' . $dummy[1] . ',' . $dummy[2] ;
		}		
		
		if($#dummy == 4)
		{
			$Value =  'GATE_XNR' .  '-' . $dummy[1] .  ',' . $dummy[2]  .  ',' . $dummy[3] ;
		}		
		

		if($#dummy == 5)
		{
			$Value =  'GATE_XNR' .  '-' . $dummy[1] .  ',' . $dummy[2]  .  ',' . $dummy[3]  .  ',' . $dummy[4] ;
		}		
		
		$Hash_Table_Linking_GATES_To_OUTPUT_Nodes{$Key} = $Value;
		#print DUMP_LINK_FILE "XNR : $Key $Value \n";
	}

	if($_ =~ m/\bAN2D0\b/i || $_ =~ m/\bAN3D0\b/i || $_ =~ m/\bAN4D0\b/i )
	{
		$Start_Processing_Internal_Nodes = 0 ;
		$_ =~ s/\bAN2D0\b//;
		$_ =~ s/\bAN3D0\b//;
		$_ =~ s/\bAN4D0\b//;
		$_ =~ s/\s//g;
		$_ =~ s/.A1//;
		$_ =~ s/.A2//;
		$_ =~ s/.A3//;
		$_ =~ s/.A4//;
		$_ =~ s/.ZN//;
		$_ =~ s/.Z//;
		$_ =~ s/\)//g;
		$_ =~ s/\(\(/,/;
		$_ =~ s/;//;
		$_ =~ s/\(//g;
		
		@dummy = split(/,/, $_);
		
		$Key   = $dummy[$#dummy];
		
		if($#dummy == 3)
		{
			$Value =  'GATE_AND' .  '-' . $dummy[1] . ',' . $dummy[2] ;
		}		
		
		if($#dummy == 4)
		{
			$Value =  'GATE_AND' .  '-' . $dummy[1] .  ',' . $dummy[2]  .  ',' . $dummy[3] ;
		}		
		

		if($#dummy == 5)
		{
			$Value =  'GATE_AND' .  '-' . $dummy[1] .  ',' . $dummy[2]  .  ',' . $dummy[3]  .  ',' . $dummy[4] ;
		}		
		
		$Hash_Table_Linking_GATES_To_OUTPUT_Nodes{$Key} = $Value;
		#print DUMP_LINK_FILE "AND : $Key $Value \n";
	}

	if($_ =~ m/\bND2D0\b/i || $_ =~ m/\bND3D0\b/i || $_ =~ m/\bND4D0\b/i )
	{
		$Start_Processing_Internal_Nodes = 0 ;
		$_ =~ s/\bND2D0\b//;
		$_ =~ s/\bND3D0\b//;
		$_ =~ s/\bND4D0\b//;
		$_ =~ s/\s//g;
		$_ =~ s/.A1//;
		$_ =~ s/.A2//;
		$_ =~ s/.A3//;
		$_ =~ s/.A4//;
		$_ =~ s/.ZN//;
		$_ =~ s/.Z//;
		$_ =~ s/\)//g;
		$_ =~ s/\(\(/,/;
		$_ =~ s/;//;
		$_ =~ s/\(//g;
		
		@dummy = split(/,/, $_);
		
		$Key   = $dummy[$#dummy];
		
		if($#dummy == 3)
		{
			$Value =  'GATE_NAND' .  '-' . $dummy[1] . ',' . $dummy[2] ;
		}		
		
		if($#dummy == 4)
		{
			$Value =  'GATE_NAND' .  '-' . $dummy[1] .  ',' . $dummy[2]  .  ',' . $dummy[3] ;
		}		
		

		if($#dummy == 5)
		{
			$Value =  'GATE_NAND' .  '-' . $dummy[1] .  ',' . $dummy[2]  .  ',' . $dummy[3]  .  ',' . $dummy[4] ;
		}		
		
		$Hash_Table_Linking_GATES_To_OUTPUT_Nodes{$Key} = $Value;
		#print DUMP_LINK_FILE "AND : $Key $Value \n";
	}

	if($_ =~ m/\bNR2D0\b/i || $_ =~ m/\bNR3D0\b/i || $_ =~ m/\bNR4D0\b/i )
	{
		$Start_Processing_Internal_Nodes = 0 ;
		$_ =~ s/\bNR2D0\b//;
		$_ =~ s/\bNR3D0\b//;
		$_ =~ s/\bNR4D0\b//;
		$_ =~ s/\s//g;
		$_ =~ s/.A1//;
		$_ =~ s/.A2//;
		$_ =~ s/.A3//;
		$_ =~ s/.A4//;
		$_ =~ s/.ZN//;
		$_ =~ s/.Z//;
		$_ =~ s/\)//g;
		$_ =~ s/\(\(/,/;
		$_ =~ s/;//;
		$_ =~ s/\(//g;
		
		@dummy = split(/,/, $_);
		
		$Key   = $dummy[$#dummy];
		
		if($#dummy == 3)
		{
			$Value =  'GATE_NOR' .  '-' . $dummy[1] . ',' . $dummy[2] ;
		}		
		
		if($#dummy == 4)
		{
			$Value =  'GATE_NOR' .  '-' . $dummy[1] .  ',' . $dummy[2]  .  ',' . $dummy[3] ;
		}		
		

		if($#dummy == 5)
		{
			$Value =  'GATE_NOR' .  '-' . $dummy[1] .  ',' . $dummy[2]  .  ',' . $dummy[3]  .  ',' . $dummy[4] ;
		}		
		
		$Hash_Table_Linking_GATES_To_OUTPUT_Nodes{$Key} = $Value;
		#print DUMP_LINK_FILE "NOR :$Key  $Value \n";
	}

	if($_ =~ m/\bOR2D0\b/i || $_ =~ m/\bOR2D1\b/i || $_ =~ m/\bOR3D0\b/i || $_ =~ m/\bOR4D0\b/i )
	{
		$Start_Processing_Internal_Nodes = 0 ;
		$_ =~ s/\bOR2D0\b//;
		$_ =~ s/\bOR2D1\b//;
		$_ =~ s/\bOR3D0\b//;
		$_ =~ s/\bOR4D0\b//;
		$_ =~ s/\s//g;
		$_ =~ s/.A1//;
		$_ =~ s/.A2//;
		$_ =~ s/.A3//;
		$_ =~ s/.A4//;
		$_ =~ s/.ZN//;
		$_ =~ s/.Z//;
		$_ =~ s/\)//g;
		$_ =~ s/\(\(/,/;
		$_ =~ s/;//;
		$_ =~ s/\(//g;
		
		@dummy = split(/,/, $_);
		
		$Key   = $dummy[$#dummy];
		
		if($#dummy == 3)
		{
			$Value =  'GATE_OR' .  '-' . $dummy[1] . ',' . $dummy[2] ;
		}		
		
		if($#dummy == 4)
		{
			$Value =  'GATE_OR' .  '-' . $dummy[1] .  ',' . $dummy[2]  .  ',' . $dummy[3] ;
		}		
		

		if($#dummy == 5)
		{
			$Value =  'GATE_OR' .  '-' . $dummy[1] .  ',' . $dummy[2]  .  ',' . $dummy[3]  .  ',' . $dummy[4] ;
		}		
		
		$Hash_Table_Linking_GATES_To_OUTPUT_Nodes{$Key} = $Value;
		#print DUMP_LINK_FILE "OR : $Key  $Value \n";
	}

	if($_ =~ m/\bINVD0\b/i || $_ =~ m/\bINVD1\b/i  || $_ =~ m/\bINVD2\b/i )
	{
		$Start_Processing_Internal_Nodes = 0 ;
		$_ =~ s/\bINVD0\b//;
		$_ =~ s/\bINVD1\b//;
		$_ =~ s/\bINVD2\b//;
		$_ =~ s/\s//g;
		$_ =~ s/.I//;
		$_ =~ s/.ZN//;
		$_ =~ s/.Z//;
		$_ =~ s/\)//g;
		$_ =~ s/\(\(/,/;
		$_ =~ s/;//;
		$_ =~ s/\(//g;
		
		@dummy = split(/,/, $_);
		
		$Key   = $dummy[$#dummy];
		
		$Value = 'GATE_INV' .  '-' . $dummy[1];
		
		$Hash_Table_Linking_GATES_To_OUTPUT_Nodes{$Key} = $Value;
		#print DUMP_LINK_FILE "INVERTER : $Key $Hash_Table_Linking_GATES_To_OUTPUT_Nodes{$Key}\n";
	}
}

print OUTPUT_FILE "$Input_Pins $Output_Pins $Internal_Pins\n";
my $First_Loop = 0;

for ($i = 0 ; $i < $count_loop ; $i++)
{
	print DUMP_LINK_FILE "$i $Hash_Table_Linking_Numbers_To_Nodenames{$i} \n";
	$Node_Under_Consideration = $Hash_Table_Linking_Numbers_To_Nodenames{$i} ;
	$Input_Node_Status = 0 ;
	
	foreach $ITEM (@Inputpin_array)
	{
		if($Node_Under_Consideration =~ m/\b$ITEM\b/)
		{
			$Input_Node_Status = 1 ;
			
		}
	}
	
	if($Input_Node_Status != 1 )
	{
		$First_Loop = $First_Loop + 1 ;
		$Corresponding_Eqn = $Hash_Table_Linking_GATES_To_OUTPUT_Nodes{$Node_Under_Consideration};
		@dummy = split(/,/, $Corresponding_Eqn);
		$No_Of_Nodes = $#dummy+1 ;
		if($i == $count_loop - 1)
		{
			print OUTPUT_FILE "$No_Of_Nodes ";
		}
		else
		{
			print OUTPUT_FILE "$No_Of_Nodes ";
		}
	}
}
print OUTPUT_FILE "\n";

my $second_loop = 0 ;
for ($i = 0 ; $i < $count_loop ; $i++)
{
	$Input_Node_Status = 0 ;

	$Node_Under_Consideration = $Hash_Table_Linking_Numbers_To_Nodenames{$i} ;
	foreach $ITEM (@Inputpin_array)
	{
		if($Node_Under_Consideration =~ m/\b$ITEM\b/)
		{
			$Input_Node_Status = 1 ;
		}
	}
	
	if($Input_Node_Status != 1 )
	{
		$second_loop = $second_loop + 1 ;
		$Corresponding_Eqn = $Hash_Table_Linking_GATES_To_OUTPUT_Nodes{$Node_Under_Consideration};
	
		@dummy1 = split(/-/, $Corresponding_Eqn);
        print "@dummy1\n";
		
		#print OUTPUT_FILE "Inside the loop\n ";

		if($dummy1[0] =~ m/\bGATE_INV\b/)
		{
			print OUTPUT_FILE "0 "
		}

		if($dummy1[0] =~ m/\bGATE_AND\b/)
		{
			print OUTPUT_FILE "1 "
		}

		if($dummy1[0] =~ m/\bGATE_OR\b/)
		{
			print OUTPUT_FILE "2 "
		}

		if($dummy1[0] =~ m/\bGATE_XOR\b/)
		{
			print OUTPUT_FILE "3 "
		}

		if($dummy1[0] =~ m/\bGATE_NAND\b/)
		{
			print OUTPUT_FILE "4 "
		}

		if($dummy1[0] =~ m/\bGATE_NOR\b/)
		{
			print OUTPUT_FILE "5 "
		}

		if($dummy1[0] =~ m/\bGATE_XNR\b/)
		{
			print OUTPUT_FILE "6 "
		}

		@dummy = split(/,/, $dummy1[1]);
		
		$Count_Loop = 0 ;
		
		#print OUTPUT_FILE "Printing";
		
		foreach (@dummy) 
		{
			if($Count_Loop == $#dummy)
			{
				print OUTPUT_FILE "$Hash_Table_Linking_Nodenames_To_Numbers{$_}\n";
			}
			else
			{
				print OUTPUT_FILE "$Hash_Table_Linking_Nodenames_To_Numbers{$_} ";
			}
			$Count_Loop = $Count_Loop + 1 ;
		}
	}
}

close (INPUT_FILE);
close (OUTPUT_FILE);
close (DUMP_LINK_FILE);

print "$First_Loop $second_loop \n";
