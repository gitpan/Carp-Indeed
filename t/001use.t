#perl -T 

use Test::More tests => 1;
BEGIN { use_ok('Carp::Indeed') };

diag( "Testing Carp::Indeed $Carp::Indeed::VERSION, Perl $], $^X" );
diag( "The warning is intentional" );


