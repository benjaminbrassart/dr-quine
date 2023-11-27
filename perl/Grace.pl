#!/usr/bin/env perl

use strict;
use warnings;

my $program = 'open my $f, "<", "Grace_kid.pl" or die; printf $f ""';

eval $program;
