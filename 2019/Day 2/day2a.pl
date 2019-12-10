#!/usr/bin/perl
use Data::Dumper;
use strict;
use warnings;
use LWP::UserAgent;
# use Time::ParseDate qw| parsedate |;
use List::Util qw| min max sum|;
use POSIX;
use Time::Local;

my @sum = ();
open my $fh,"<input.txt";


# 1 add
# 2 multiply
# 99 end

my $string_array = '';
my $current_position = 0;

while ( my $row = <$fh>) {
	chomp $row;
	$string_array = $row;
}
close $fh;

my @array1 = split(',', $string_array);

my $results = calc($array1[0], $current_position, \@array1);
print join(',', @$results);

sub calc {
	my ($num, $current_position, $array1) = @_;
	my $value = 0;
	my $num1 = 0;
	my $num2 = 0;
	my $save_to_position = 0;

	if ($num == 1) {
		$num1 = $array1->[$current_position + 1];
		$num2 = $array1->[$current_position + 2 ];
		$value = $array1->[$num1] + $array1->[$num2];
		$save_to_position = $array1->[$current_position + 3];
		$array1->[$save_to_position] = $value;
		$current_position = $current_position + 4;
		calc($array1->[$current_position], $current_position, \@array1 );
	} elsif ($num == 2) {
		$num1 = $array1->[$current_position + 1];
		$num2 = $array1->[$current_position + 2 ];
		$value = $array1->[$num1] * $array1->[$num2];
		$save_to_position = $array1->[$current_position + 3];
		$array1->[$save_to_position] = $value;
		$current_position = $current_position + 4;
		calc($array1->[$current_position], $current_position, \@array1 );
	} elsif ($num == 99) {
		return \@array1;
	} else {
		print "This isnt a 1, 2, or 99\n";
	}
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


# # 1 add
# # 2 multiples
# # 99 ends

# my $string_array = '';
# my $current_position = 0;

# while ( my $row = <$fh>) {
# 	chomp $row;
# 	$string_array = $row;
# }
# close $fh;

# my @array1 = split(',', $string_array);

# my $results = calc($array1[0], $current_position, \@array1);
# print join(',', @$results);

# sub calc {
# 	my ($num, $current_position, $array1) = @_;
# 	my $value = 0;
# 	my $num1 = 0;
# 	my $num2 = 0;
# 	my $save_to_position = 0;

# 	if ($num == 1) {
# 		$num1 = $array1->[$current_position + 1];
# 		$num2 = $array1->[$current_position + 2 ];
# 		$value = $array1->[$num1] + $array1->[$num2];
# 		$save_to_position = $array1->[$current_position + 3];
# 		$array1->[$save_to_position] = $value;
# 		$current_position = $current_position + 4;
# 		calc($array1->[$current_position], $current_position, \@array1 );
# 	} elsif ($num == 2) {
# 		$num1 = $array1->[$current_position + 1];
# 		$num2 = $array1->[$current_position + 2 ];
# 		$value = $array1->[$num1] * $array1->[$num2];
# 		$save_to_position = $array1->[$current_position + 3];
# 		$array1->[$save_to_position] = $value;
# 		$current_position = $current_position + 4;
# 		calc($array1->[$current_position], $current_position, \@array1 );
# 	} elsif ($num == 99) {
# 		return \@array1;
# 	} else {
# 		print "This isnt a 1, 2, or 99\n";
# 	}
# }



