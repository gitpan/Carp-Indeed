
use 5.006;
use ExtUtils::MakeMaker;

my $EUMM_VERSION = eval $ExtUtils::MakeMaker::VERSION;

WriteMakefile(
    NAME              => 'Carp::Indeed',
    VERSION_FROM      => 'Indeed.pm',
    PREREQ_PM         => {
        Carp => 0,
        Test::More => 0,
    },
    PL_FILES          => {},
    ($] >= 5.005 ? (
        'ABSTRACT_FROM' => 'Indeed.pm',
        'AUTHOR'        => 'Adriano R. Ferreira <ferreira@cpan.org>'
    ) : ()),
    ($EUMM_VERSION >= 6.30_01 ? (
        LICENSE => 'perl', 
        EXTRA_META => "recommends:\n    Test::Pod:                     1.18\n    Test::Base:                    0\n",
#        NO_META => 1,
    ) :())

);
