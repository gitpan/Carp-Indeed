
use Test::More tests => 2;

BEGIN { use_ok('Carp::Indeed') };

use lib qw(t/lib);
use File::Slurp qw(slurp);

my $script = 't/002script.pl';
my $outfile = 't/002.out';

system "$^X -Iblib/lib -MCarp::Indeed $script $outfile ";

my $expected = "Beware! at $script line 6\n" .
"\tA::f() called at $script line 10\n" .
"\tA::g() called at $script line 23\n";

my $output = slurp $outfile;

is($output, $expected);

END { 
    unlink $outfile if -e $outfile; 
}


