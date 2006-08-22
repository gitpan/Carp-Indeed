
use 5.006;
use ExtUtils::MakeMaker;

my $EUMM_VERSION = eval $ExtUtils::MakeMaker::VERSION;

WriteMakefile(
    NAME              => 'Carp::Indeed',
    VERSION           => '0.06',
    PREREQ_PM         => {
        'Carp::Always' => 0,
    },
    PL_FILES          => {},
    ($] >= 5.005 ? (
        'ABSTRACT' => 'Deprecate - Warns and dies noisily with stack backtraces',
        'AUTHOR'        => 'Adriano R. Ferreira <ferreira@cpan.org>'
    ) : ()),
    ($EUMM_VERSION >= 6.30_01 ? (
        LICENSE => 'perl', 
    ) :())

);
