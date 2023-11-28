#!/usr/bin/env perl

use strict;
use warnings;

#
#	perl!
#

my $PROGRAM = 'open my $f, ">", "Grace_kid.pl" or die; printf $f "$FORMAT", 10, 9, 39, "$FORMAT";';
my $FORMAT = '#!/usr/bin/env perl%1$c%1$cuse strict;%1$cuse warnings;%1$c%1$c#%1$c#%2$cperl!%1$c#%1$c%1$cmy $PROGRAM = %3$copen my $f, ">", "Grace_kid.pl" or die; printf $f "$FORMAT", 10, 9, 39, "$FORMAT";%3$c;%1$cmy $FORMAT = %3$c%4$s%3$c;%1$c%1$ceval $PROGRAM;%1$c';

eval $PROGRAM;
