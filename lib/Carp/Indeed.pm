
package Carp::Indeed;

use strict;

our $VERSION = '0.10';

use Carp::Always;

BEGIN { 
  print STDERR "Carp::Indeed was deprecated - use Carp::Always\n";
}

1;
__END__

=head1 NAME

Carp::Indeed - DEPRECATE Warns and dies noisily with stack backtraces

=head1 SYNOPSIS

  use Carp::Always; # instead

=head1 DESCRIPTION

This module was superseded by C<Carp::Always>. So read about it
in C<Carp::Always> man page. It should work the same as
C<Carp::Always> but with a deprecation warning to annoy you 
until you switch to use the new module.

=head1 SEE ALSO

  Carp::Always

Please report bugs via CPAN RT 
http://rt.cpan.org/NoAuth/Bugs.html?Dist=Carp-Always.

=head1 AUTHOR

Adriano Ferreira, E<lt>ferreira@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005-2007 by Adriano R. Ferreira

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
