#!/usr/bin/perl
use Data::Dumper;
use strict;
use warnings;
use LWP::UserAgent;
# use Time::ParseDate qw| parsedate |;
use List::Util qw| min max sum|;
use POSIX;
use Time::Local;
use warnings;

my @sum = ();
open my $fh,"<input.txt";

while ( my $row = <$fh>) {
	chomp $row;

	my @inner_array = calc($row);
	

	my $inner_array_sum = sum( @inner_array );
	push( @sum, $inner_array_sum );
}

my $sum = sum( @sum );
print $sum;

close $fh;


sub calc {
	my $num = @_;
	my @inner_array = ();
	$num = ( floor( $num / 3 ) - 2 );
	push( @inner_array, $num ) if $num > 3;

	if ( $num > 0 ) {
		calc( $num );
	}

	return \@inner_array;
}