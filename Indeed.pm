
package Carp::Indeed;

use 5.006;
use strict;
use warnings;

#require Exporter;
#our @ISA = qw(Exporter);
#our @EXPORT_OK = qw(warn die);

our $VERSION = '0.05';

use Carp qw(verbose); # makes carp() cluck and croak() confess

sub _warn {
  if ($_[-1] =~ /\n$/s) {
    my $arg = pop @_;
    $arg =~ s/ at .*? line .*?\n$//s;
    push @_, $arg;
  }
  warn &Carp::longmess;
}

sub _die {
  if ($_[-1] =~ /\n$/s) {
    my $arg = pop @_;
    $arg =~ s/ at .*? line .*?\n$//s;
    push @_, $arg;
  }
  die &Carp::longmess;
}

BEGIN {
  $SIG{__DIE__} = \&_die;
  $SIG{__WARN__} = \&_warn;
}

1;
__END__

=head1 NAME

Carp::Indeed - Warns and dies noisily with stack backtraces

=head1 SYNOPSIS

  use Carp::Indeed;

makes every C<warn()> and C<die()> complains loudly in the calling package 
and elsewhere. More often used on the command line:

  perl -MCarp::Indeed script.pl

=head1 DESCRIPTION

This module is meant as a debugging aid. It can be 
used to make a script complain loudly with stack backtraces 
when warn()ing or die()ing.

Here are how stack backtraces produced by this module
looks:

  # it works for explicit die's and warn's
  $ perl -MCarp::Indeed -e 'sub f { die "arghh" }; sub g { f }; g'
  arghh at -e line 1
          main::f() called at -e line 1
          main::g() called at -e line 1

  # it works for interpreter-thrown failures
  $ perl -MCarp::Indeed -w -e 'sub f { $a = shift; @a = @$a };' \
                           -e 'sub g { f(undef) }; g'
  Use of uninitialized value in array dereference at -e line 1
          main::f('undef') called at -e line 2
          main::g() called at -e line 2

In the implementation, the C<Carp> module does
the heavy work, through C<longmess()>. The
actual implementation sets the signal hooks
C<$SIG{__WARN__}> and C<$SIG{__DIE__}> to
emit the stack backtraces.

Oh, by the way, C<carp> and C<croak> when requiring/using
the C<Carp> module are also made verbose, behaving
like C<cloak> and C<confess>, respectively.

=head2 EXPORT

Nothing at all is exported.

=head1 ACKNOWLEDGMENTS

This module was born as a reaction to a release
of L<Acme::JavaTrace> by Sébastien Aperghis-Tramoni.
Sébastien also has a newer module called
L<Devel::SimpleTrace> with the same code and fewer flame
comments on docs. The pruning of the uselessly long
docs of this module were prodded by Michael Schwern.

=head1 SEE ALSO

=over 4

=item *

L<Carp>

=item *

L<Acme::JavaTrace> and L<Devel::SimpleTrace>

=back

Please report bugs via CPAN RT 
http://rt.cpan.org/NoAuth/Bugs.html?Dist=Carp-Indeed.

=head1 BUGS

Every (un)deserving module has its own pet bugs.

=over 4

=item *

This module does not play well with other modules which fusses
around with C<warn>, C<die>, C<$SIG{'__WARN__'}>,
C<$SIG{'__DIE__'}>.

=item *

Test scripts are good. I should write more of these.

=item *

"The module name stinks." Suggestions are welcome.
I have been thinking in C<Carp::ForReal>, C<Carp::ForFree>,
C<Carp::LikeCrazy> (jdavidb's suggestion), etc.
I would prefer something simpler with a single English
work like "Indeed", but which sounds better for
a native English speaker (which I am not).

=back

=head1 AUTHOR

Adriano Ferreira, E<lt>ferreira@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by Adriano R. Ferreira

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
