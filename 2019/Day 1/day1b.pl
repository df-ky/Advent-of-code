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

# my $guess = calc(100756, \@sum );
# my $total = sum( @$guess );
# print $total;

while ( my $row = <$fh>) {
	chomp $row;
	my @inner_array;
	my $inner_array_sum = calc($row, \@inner_array);
	
	$inner_array_sum = sum( @$inner_array_sum );
	push( @sum, $inner_array_sum );
}

my $sum = sum( @sum );
print $sum;

close $fh;


sub calc {
	my ( $num, $inner_array ) = @_;
	# print "$num\n";
	# my @inner_array = ();
	# print Dumper \@inner_array;
	# print "\n";
	$num = ( floor( $num / 3 ) - 2 );
	push( @$inner_array, $num ) if $num > 0;
	if ( $num > 0 ) {
		# push( @inner_array, $num ) if $num > 0;
		calc( $num, $inner_array )
	}
	return $inner_array;
	# return;
}




# #!/usr/bin/perl
# use Data::Dumper;
# use strict;
# use warnings;
# use LWP::UserAgent;
# # use Time::ParseDate qw| parsedate |;
# use List::Util qw| min max sum|;
# use POSIX;
# use Time::Local;
# use warnings;

# my @sum = ();
# open my $fh,"<input.txt";

# # my $guess = calc(100756);
# # print @$guess;

# while ( my $row = <$fh>) {
# 	chomp $row;

# 	my @inner_array = calc($row);
	

# 	my $inner_array_sum = sum( @inner_array );
# 	push( @sum, $inner_array_sum );
# }

# my $sum = sum( @sum );
# print $sum;

# close $fh;


# sub calc {
# 	my $num = @_;
# 	my @inner_array = ();
# 	$num = ( floor( $num / 3 ) - 2 );
# 	push( @inner_array, $num ) if $num > 3;
# 	# print "$num\n";
# 	# if ( ( ( $num / 3 ) - 2 ) ) {
# 	if ( $num > 0 ) {
# 		calc( $num );
# 	}
# 	# print @inner_array;
# 	return \@inner_array;
# }