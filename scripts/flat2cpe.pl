#!/usr/bin/perl 
# Description	: This script will convert verilog into a specific format
# Original Author : Satish Grandhi
# Modified by : Daniel Rodas Bautista
use strict; use warnings;

### Reading the netlist from command line
my $input_file= $ARGV[0] ;
my $output_file= $ARGV[1];
my $nodes2numbers_file= "dumpfile";#$ARGV[2];
my %nodes2numbers;
my %numbers2nodes ;
my %gates2outputs	;
my $gate_count = 0;
my @dummy ;
my @dummy1 ;
my @inputpins ;
my $count_loop1 = 0;
my $count_loop2 ;
my $no_of_nodes ;
my $key ;
my $value ;
my $input_node_status ;
my $corresponding_eqn ;
my $node_under_consideration ;
my $input_pins = 0;
my $output_pins = 0;
my $internal_pins = 0;
my $dummy_output ;
my $start_processing_internal_nodes ;

open (INPUT_FILE, '<', "$input_file");
open (OUTPUT_FILE, '>', "$output_file");
open (DUMP_LINK_FILE, '>', "$nodes2numbers_file");

# Step 1 : Count all the PI's , PO's & the list of Internal Nodes
while (<INPUT_FILE>) {
    chomp;

    if (m#//|endmodule#i )
    {
        #If there is a comment just skip it
        next;
    }
    if(/\binput\b/i)
    {
        s/\binput\b//g; s/\s//g; s/;//g; s/\[//g;
        if(/\,/)
        {
            @dummy = split(/\,/, $_);
            foreach (@dummy) 
            {
                $key   = $dummy[$input_pins];
                $value = $count_loop1;
                $nodes2numbers{$key} = $value;
                $numbers2nodes{$value} = $key;
                $count_loop1++;
                $input_pins++;
                push(@inputpins , $key);
            } 
        }else
        {
            @dummy = split(/\]/, $_);
            @dummy1 = split(/:/, $dummy[0]);

            for (my $i = $dummy1[1]; $i <= $dummy1[0]; $i++) 
            {
                $key   = $dummy[1] . '[' . $i . ']';
                $value = $count_loop1;
                $nodes2numbers{$key} = $value;
                $numbers2nodes{$value} = $key;
                $count_loop1++;
                $input_pins++; 
            }
        }
    }elsif(/\boutput\b/i )
    {
        s/\boutput\b//g; s/\s//g; s/;//g; s/\[//g;
        if(/\,/i)
        {
            @dummy = split(/\,/, $_);
            foreach (@dummy) 
            {
                $key   = $dummy[$output_pins];
                $value = $count_loop1;
                $nodes2numbers{$key} = $value;
                $numbers2nodes{$value} = $key;
                $count_loop1++;
                $output_pins++;
            } 
        }else
        {
            $dummy_output = $_ ;
            @dummy = split(/\]/, $dummy_output);
            @dummy1 = split(/:/, $dummy[0]);
            for (my $i = $dummy1[1]; $i <= $dummy1[0]; $i++) 
            {
                $key   = $dummy[1] . '[' . $i . ']';
                $value = $count_loop1;
                $nodes2numbers{$key} = $value;
                $numbers2nodes{$value} = $key;
                $count_loop1++;
                $output_pins++;
            }
        }
    }elsif(/\bwire +[a-zA-Z0-9_]+,/ || /[a-zA-Z0-9_]+(,|;)\z/) #to be improved
    {
        s/\bwire\b//g; s/\s//g; s/;//g;
        @dummy = split(/,/, $_);
        foreach my $key (@dummy) {
            $value = $count_loop1;
            $nodes2numbers{$key} = $value;
            $numbers2nodes{$value} = $key;
            $count_loop1++;
            $internal_pins++;
        }
    }elsif(/\b(XOR2D0|XOR3D0|XOR4D0)\b/ ){
        s/\b$1\b//;
        $start_processing_internal_nodes = 0 ;
        ($key,$value) = &get_output_key_value($_,'GATE_XOR');
        $gates2outputs{$key} = $value;
    }elsif(/\b(XNR2D0|XNR3D0|XNR4D0)\b/){
        s/\b$1\b//;
        $start_processing_internal_nodes = 0 ;
        ($key,$value) = &get_output_key_value($_,'GATE_XNOR');
        $gates2outputs{$key} = $value;
    }elsif(/\b(AN2D0|AN3D0|AN4D0)\b/){
        s/\b$1\b//;
        $start_processing_internal_nodes = 0 ;
        ($key,$value) = &get_output_key_value($_,'GATE_AND');
        $gates2outputs{$key} = $value;
    }elsif((/\bND2D0|ND3D0|ND4D0\b/)){
        s/\b$1\b//;
        $start_processing_internal_nodes = 0 ;
        ($key,$value) = &get_output_key_value($_,'GATE_NAND');
        $gates2outputs{$key} = $value;
    }elsif(/\b(NR2D0|NR3D0|NR4D0)\b/){
        s/\b$1\b//;
        $start_processing_internal_nodes = 0 ;
        ($key,$value) = &get_output_key_value($_,'GATE_NOR');
        $gates2outputs{$key} = $value;
    }elsif(m/\b(OR2D0|OR2D1|OR3D0|OR4D0)\b/){
        s/\b$1\b//;
        $start_processing_internal_nodes = 0 ;
        ($key,$value) = &get_output_key_value($_,'GATE_OR');
        $gates2outputs{$key} = $value;
    }elsif(/\b(INVD0|INVD1|INVD2)\b/){
        s/\b$1\b//;
        $start_processing_internal_nodes = 0 ;
        ($key,$value) = &get_output_key_value($_,'GATE_INV');
        $gates2outputs{$key} = $value;
        }
}
print OUTPUT_FILE "$input_pins $output_pins $internal_pins\n";

for (my $i = 0 ; $i < $count_loop1 ; $i++)
{
    print DUMP_LINK_FILE "$i $numbers2nodes{$i} \n" if $nodes2numbers_file;
    $node_under_consideration = $numbers2nodes{$i} ;
    $input_node_status = 0 ;
    foreach my $item (@inputpins)
    {
        $input_node_status = 1 if $node_under_consideration =~ m/\b$item\b/ ;
    }
    if(!$input_node_status && (defined $gates2outputs{$node_under_consideration}))
    {
        $corresponding_eqn = $gates2outputs{$node_under_consideration};
        @dummy = split(/,/, $corresponding_eqn);
        $no_of_nodes = $#dummy+1 ;
        $corresponding_eqn = $gates2outputs{$node_under_consideration} // "" ;
        print OUTPUT_FILE "$no_of_nodes ";
    }
}
print OUTPUT_FILE "\n";

for (my $i = 0 ; $i < $count_loop1 ; $i++)
{
    $input_node_status = 0 ;
    $node_under_consideration = $numbers2nodes{$i} ;
    foreach my $item (@inputpins)
    {
        $input_node_status = 1 if ($node_under_consideration =~ m/\b$item\b/);
    }
    if($input_node_status != 1 && (defined $gates2outputs{$node_under_consideration}))
    {
        $corresponding_eqn = $gates2outputs{$node_under_consideration};
        @dummy1 = split(/-/, $corresponding_eqn);
        if($dummy1[0] =~ m/\bGATE_INV\b/)
        {
            print OUTPUT_FILE "0 ";
        }elsif($dummy1[0] =~ m/\bGATE_AND\b/)
        {
            print OUTPUT_FILE "1 ";
        }elsif($dummy1[0] =~ m/\bGATE_OR\b/)
        {
            print OUTPUT_FILE "2 ";
        }elsif($dummy1[0] =~ m/\bGATE_XOR\b/)
        {
            print OUTPUT_FILE "3 ";
        }elsif($dummy1[0] =~ m/\bGATE_NAND\b/)
        {
            print OUTPUT_FILE "4 ";
        }elsif($dummy1[0] =~ m/\bGATE_NOR\b/)
        {
            print OUTPUT_FILE "5 ";
        }elsif($dummy1[0] =~ m/\bGATE_XNOR\b/)
        {
            print OUTPUT_FILE "6 ";
        }
        @dummy = split(/,/, $dummy1[1]);
        $count_loop2 = 0 ;
        foreach (@dummy) 
        {
            #print "$_ => $nodes2numbers{$_}\n";
            print OUTPUT_FILE "$nodes2numbers{$_}";
            $count_loop2 == $#dummy ? print OUTPUT_FILE  "\n" : print OUTPUT_FILE  " " ;
            $count_loop2++;
        }
    }
}

close (INPUT_FILE);
close (OUTPUT_FILE);
close (DUMP_LINK_FILE);

sub get_output_key_value
{
    $_ = shift @_;
    my $gate_type = shift @_;
    my ($key, $value);
    my @dummy;
    if($gate_type eq 'GATE_INV')
    {
        s/\s//g;
        s/.I//;
        s/.ZN//;
        s/.Z//;
        s/\)//g;
        s/\(\(/,/;
        s/;//;
        s/\(//g;
        @dummy = split(/,/, $_);
        $key   = $dummy[$#dummy];
        $value = 'GATE_INV' .  '-' . $dummy[1];
    }elsif($gate_type eq 'GATE_AND' || $gate_type eq 'GATE_NOR' || $gate_type eq 'GATE_OR' || $gate_type eq 'GATE_NAND' || $gate_type eq 'GATE_XOR' || $gate_type eq 'GATE_XNOR') 
    {
        s/\s//g; 
        s/.A1//; 
        s/.A2//; 
        s/.A3//; 
        s/.A4//; 
        s/.ZN//; 
        s/.Z//; 
        s/\)//g; 
        s/\(\(/,/; 
        s/;//; 
        s/\(//g;
        @dummy = split(/,/, $_);
        $key   = $dummy[$#dummy];
        if($#dummy == 3)
        {
            $value =  $gate_type .  '-' . $dummy[1] . ',' . $dummy[2] ;
        }		
        if($#dummy == 4)
        {
            $value =   $gate_type .  '-' . $dummy[1] .  ',' . $dummy[2]  .  ',' . $dummy[3] ;
        }		
        if($#dummy == 5)
        {
            $value =   $gate_type .  '-' . $dummy[1] .  ',' . $dummy[2]  .  ',' . $dummy[3]  .  ',' . $dummy[4] ;
        }		
    }else
    {
        print "Wrong GATE-TYPE in sub get_output_key_value\n";
    }
    ($key, $value);
}
