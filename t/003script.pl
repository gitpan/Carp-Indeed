

package A;

sub f {
	use strict;
	my $a;
	my @a = @$a;
}

sub g {
	f();
}

package main;

# usage: perl t.pl <output file>

my $out = shift 
	or die "expected an argument";

close STDERR;
open STDERR, ">$out";

A::g();

close STDERR;
