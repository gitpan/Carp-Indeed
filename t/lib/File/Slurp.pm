
package File::Slurp;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(slurp);

use IO::Handle;

sub slurp {
    local *F;
    local $/;
    open F, shift or die $!;
    my $slurp = <F>;
    close F;
    return $slurp;
}

1;

