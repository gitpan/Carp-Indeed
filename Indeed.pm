
package Carp::Indeed;

use 5.006;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(warn die);

our $VERSION = '0.03';

require Carp;
$Carp::Verbose = 1; # makes carp() cluck and croak() confess

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

makes every warn() and die() complains loudly in the calling package 
and elsewhere. More often used on the command line:

  perl -MCarp::Indeed script.pl

=head1 DESCRIPTION

This module is meant as a debugging aid. It can be 
used to make a script complain loudly with stack backtraces 
when warn()ing or die()ing.

This is no substitute for carefully written code with informative 
error messages. It may speed the development by giving fast feedback 
to the programmer to understand what Perl was doing when an error 
was found. The long mess produced does not make much sense to any 
user besides the developer (and neither to her/him after a little
lapse of time). Printing stack traces all around is usually felt 
as a lousy programming style by a programmer who did not have the time
or guts to write decent code. That's why Perl mature code 
usually employs the C<Carp> module to tell of errors from the 
perspective of the caller: if an error was found, it should belong
to the caller as the library code was made bullet-proof.
(That's a summary of what the author thinks about "the Java 
paradigm to print stack traces").

Here is how a stack backtrace produced by C<Carp::Indeed> looks for
a fictional script:

  Exception: event not implemented at workshop/events.pl line 26
          MyEvents::generic_event_handler() called at workshop/events.pl line 11
          MyEvents::__ANON__() called at workshop/events.pl line 22
          MyEvents::dispatch_event() called at workshop/events.pl line 17
          MyEvents::call_event() called at workshop/events.pl line 30

[after the example in Acme::JavaTrace]

In the implementation, the C<Carp> module was used.
C<Carp> is a Perl module as old as Perl 5 (don't believe me,
ask L<Module::CoreList>). It has
an option to print errors (from the perspective of caller) 
with stack backtrace. With a few lines of codes, this module
illustrates how to make C<warn()> and C<die()> noisy as well.

This is done by overriding the builtin functions C<warn> and C<die>
globally. Just as L<perlsub> told us B<not to> do lightly.

=head2 EXPORT

This module exports I<globally> its own versions of C<warn> and C<die>.

=head1 AN ASIDE

If you take a look at some dictionary (I have used
http://dictionary.reference.com/search for no good reason), 
you find out that I<carp> means

  To find fault in a disagreeable way; complain fretfully.

To I<croak> is no better:

  To mutter discontentedly; grumble.
  _Slang._ To die.

And then there is I<cluck> and I<confess>:

  cluck
  To utter the characteristic sound of a hen.

  confess
  To admit or acknowledge something damaging or inconvenient to oneself

These are the terminology introduced by the symbols
exportable by L<Carp>.
And then you realize you are being annoying when 
carping, croaking, warning, dying, clucking, confessing.
So don't do it all the time, nobody will tolerate and
you will be all alone writing code that makes you boring
(for others and yourself).

=head1 RANT

This is a rant on the L<Acme::JavaTrace> module where
the author (Sébastien Aperghis-Tramoni - saper) gave us some 
pearls of wisdom like

  <buzzword>This module tries to improves the Perl programmer 
  experience by porting the Java paradigm to print stack traces, 
  which is more professional than Perl's way. </buzzword>

and

  Please note that even the professionnal indentation present 
  in the Java environment is included in the trace. 

It was probably meant as a joke. He even released a new module
called L<Devel::SimpleTrace> with the same code and fewer flame
comments on docs.

The upsides of all this are:

=over 4

=item *

Could it be a good idea to support another formats for stack backtraces?
Java programmers and others could feel more comfortable in addition to
the liberating experience of a cooler programming language.

=item *

Maybe it is already time to equip C<Carp> with additional support for
alternate ways of showing and dumping arguments.

=item *

It may be time as well to add Carp support to handle exception objects.

=item *

At such occasions, one finds that more research into the core Perl
library is always worth.

=item *

Sometimes one realizes that knowing Perl is like doing maths. You
don't prove anything by showing that two cases satisfy the proposed
solution. In the same vein, just because you didn't find a Perl module
with the functionality you need, it does not mean it was not written
yet.

=item *

Documentation in stupid modules can always be too long.

=back

=head1 BLAME

Who ever writes bold statements about one's favourite programming
language.

=head1 SEE ALSO

=over 4

=item *

L<Carp>

=item *

L<Acme::JavaTrace>, by saper

=item *

L<Devel::SimpleTrace>, by saper

=back

Please report bugs via CPAN RT 
http://rt.cpan.org/NoAuth/Bugs.html?Dist=Carp-Indeed.

=head1 BUGS

Every (un)deserving module has its own pet bugs.

=over 4

=item *

When this module is in effect, the use of C<carp> and C<croak>
is verbose too. But I am not convinced this is working as it
should yet.

=item *

This module does not play well with other modules which fusses
around with C<warn>, C<die>, C<$SIG{'__WARN__'}>,
C<$SIG{'__DIE__'}>.

=item *

Test scripts are good. I should write more of these.

=item *

A hord of bugs is waiting me after the CPAN release:
almost no caution was taken to assure the code works faithfully.
And they are fond of rising in the wild. But that is not
too worrisome and complies with the Klingon Programmer's
Code of Honour
http://www.klingon.org/resources/klingon_code.html

=back

=head1 AUTHOR

Adriano Ferreira, E<lt>ferreira@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by Adriano R. Ferreira

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
