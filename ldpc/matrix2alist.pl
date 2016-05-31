#!/usr/bin/perl
use warnings; use strict;

my ($num_rows, $num_cols);
#read the input matrix
my @input_mat=();
my $r = 0;
while (<>) {
    chomp;
    my @row = split / +/, $_;
    $num_cols = length join "",@row;
    foreach my $col (@row)
    {
        push @{$input_mat[$r]}, $col;
    }
    $num_rows++;
    $r++;
}
#get references to the output matrices and arrays
my ($alist_rows,$row_degs) = &get_alist(@input_mat);
my ($alist_cols,$col_degs) = &get_alist(&traspose(@input_mat));


#give results
print "nb_rows $num_rows\n";
print "nb_cols $num_cols\n";
print "max_row_deg " . &max(@$row_degs) ."\n";
#print "max_col_deg " . &max(@$col_degs) ."\n";
print "nb_nzentries " . &total(@$row_degs) . "\n";

print "all_row_deg\n @$row_degs\n\n";
print "nzentries_per_row\n";
#print "column degrees\n";
#print "@$col_degs\n";
#print "-" x $num_cols , "\n";
&print_matrix(@$alist_rows);
print "nzentries_per_column\n";
&print_matrix(@$alist_cols);

sub get_alist {
    #gives matrix with indeces of 1's
    my @matrix = @_;
    my @alist =();
    my @degrees = ();
    my $i= 0;
    for (@matrix){
        my @alist_r = ();
        for my $j (0..$#{$_}){
            if ($matrix[$i][$j] == 1) {
                push @alist_r, ($j);
            }
        }
        push @degrees , $#alist_r + 1;
        push @alist, [@alist_r];
        $i++;
    }
    #return references to matrices
    return (\@alist, \@degrees);
}

sub print_matrix {
    my @matrix = @_;
    foreach my $i (0..@matrix-1){
        if (!@{$matrix[$i]}){
            next;
        }else{
            foreach my $j (0..@{$matrix[$i]}-1){
                print "$matrix[$i][$j] ";
            }
            print "\n";
        }
    }
}

sub traspose{
    #gives traspose of a matrix
    my @matrix = @_;
    my @xirtam = ();
    my $i= 0;
    for my $row (@matrix){
        for my $j (0..$#{$row}){
            #referencing the column from the row
            push @{$xirtam[$j]}, $row->[$j];
        }
        $i++;
    }
    @xirtam;
}

sub max {
    my $max = shift @_;
    foreach (@_){
        if ($_ > $max){
            $max = $_;
        }
    }
    $max;
}

sub total 
{
    my $tot = shift @_;
    foreach (@_)
    {
        $tot += $_;
    }

    $tot;
}
