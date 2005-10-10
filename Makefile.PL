

use 5.006;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Carp::Indeed',
    VERSION_FROM      => 'Indeed.pm',
    PREREQ_PM         => {
        Carp => 0,
    },
	PL_FILES          => {},
    ($] >= 5.005 ?
      (ABSTRACT_FROM  => 'Indeed.pm', 
       AUTHOR         => 'Adriano Ferreira <ferreira@cpan.org>') : (),
       NO_META        => 1
      ),
);
