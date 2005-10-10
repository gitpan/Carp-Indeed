
use Test::More tests => 2;

BEGIN { use_ok('Carp::Indeed') };

use lib qw(t/lib);
use File::Slurp qw(slurp);

my $script = 't/003script.pl';
my $outfile = 't/034.out';

system "$^X -Iblib/lib -MCarp::Indeed $script $outfile ";

my $expected = "Can't use an undefined value as an ARRAY reference at $script line 8\n" .
"\tA::f() called at $script line 12\n" .
"\tA::g() called at $script line 25\n";

my $output = slurp $outfile;

use YAML;
#diag(Dump { output => $output, expected => $expected });

is($output, $expected);

END { 
    unlink $outfile if -e $outfile; 
}


