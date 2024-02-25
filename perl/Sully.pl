#!/usr/bin/env perl

use strict;
use warnings;

use File::Basename;

my $FORMAT = '#!/usr/bin/env perl%1$c%1$cuse strict;%1$cuse warnings;%1$c%1$cuse File::Basename;%1$c%1$cmy $FORMAT = %3$c%4$s%3$c;%1$c%1$csub duplicate {%1$c%2$cmy ($i) = @_;%1$c%1$c%2$copen my $f, ">", "Sully_$i.pl" or die;%1$c%2$cprintf $f "$FORMAT", 10, 9, 39, "$FORMAT", $i;%1$c}%1$c%1$csub run {%1$c%2$cmy ($i) = @_;%1$c%1$c%2$csystem "/usr/bin/env perl Sully_$i.pl";%1$c}%1$c%1$csub main {%1$c%2$cmy $i = %5$d;%1$c%1$c%2$cif (basename(__FILE__) ne "Sully.pl") {%1$c%2$c%2$c$i -= 1;%1$c%2$c}%1$c%1$c%2$cduplicate $i;%1$c%1$c%2$cif ($i > 0) {%1$c%1$c%2$c%2$crun $i;%1$c%2$c}%1$c}%1$c%1$cmain();%1$c';

sub duplicate {
	my ($i) = @_;

	open my $f, ">", "Sully_$i.pl" or die;
	printf $f "$FORMAT", 10, 9, 39, "$FORMAT", $i;
}

sub run {
	my ($i) = @_;

	system "/usr/bin/env perl Sully_$i.pl";
}

sub main {
	my $i = 5;

	if (basename(__FILE__) ne "Sully.pl") {
		$i -= 1;
	}

	duplicate $i;

	if ($i > 0) {
		run $i;
	}
}

main();
