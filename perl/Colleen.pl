#!/usr/bin/env perl

use strict;
use warnings;

#
#	what the hell kinda language is this
#

sub colleen {
	#
	#	fancy some unicode? 🫠
	#
	my $s = '#!/usr/bin/env perl%1$c%1$cuse strict;%1$cuse warnings;%1$c%1$c#%1$c#%2$cwhat the hell kinda language is this%1$c#%1$c%1$csub colleen {%1$c%2$c#%1$c%2$c#%2$cfancy some unicode? 🫠%1$c%2$c#%1$c%2$cmy $s = %3$c%4$s%3$c;%1$c%1$c%2$cprintf "$s", 10, 9, 39, "$s";%1$c}%1$c%1$csub main {%1$c%2$ccolleen;%1$c}%1$c%1$cmain();%1$c';

	printf "$s", 10, 9, 39, "$s";
}

sub main {
	colleen;
}

main();
