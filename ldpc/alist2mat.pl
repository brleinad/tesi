#!/usr/bin/perl
use warnings; use strict;


my ($num_rows, $num_cols);
my @out_mat=();
#read input matrix
my @in_mat=();
my $r = 0;
while (<>) {
    chomp;
    if (!$num_rows) {
        m/([0-9]+) ([0-9]+).*/;
        $num_rows = $1;
        $num_cols = $2;
    }else{
    #my @row = split /^[0-9]+/, $_;
    my @row = split / +/, $_;
    #push @in_mat, [@row];
    foreach my $col (@row)
      {
        push @{$in_mat[$r]}, $col;
      }
      $r++;
    }
}

#generate output matrix
for (my $i = 0; $i != $num_rows; ++$i)
{
    my $k = 0;
    my @row = @{$in_mat[$i]};

    for (my $j = 0; $j != $num_cols; ++$j)
    {
        if($k > $#row){
            $out_mat[$i][$j] = 0;
        }
        elsif ($j == $row[$k])#-1)
        {
            $k++;
            $out_mat[$i][$j] = 1;
        }
        else{
            $out_mat[$i][$j] = 0;

        }
    }
}

&print_matrix(@out_mat);

sub print_matrix {
    my @matrix = @_;
    for my $i (0..@matrix-1){
        for my $j (0..@{$matrix[$i]}-1){
            print "$matrix[$i][$j] ";
            }
        print "\n";
    }

}
