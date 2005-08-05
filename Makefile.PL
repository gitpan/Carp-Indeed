

use 5.006;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Carp::Indeed',
    VERSION_FROM      => 'lib/Carp/Indeed.pm', # finds $VERSION
    PREREQ_PM         => {
        Carp => 0,
    },
    ($] >= 5.005 ?
      (ABSTRACT_FROM  => 'lib/Carp/Indeed.pm', 
       AUTHOR         => 'Adriano Ferreira <ferreira@cpan.org>') : (),
       NO_META        => 0
      ),
);
