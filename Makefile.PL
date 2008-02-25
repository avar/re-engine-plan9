use 5.009005;
use ExtUtils::MakeMaker;

our @DIR = qw(libutf libfmt libregexp);
our @OBJ = map  { s/\.c$/.o/; $_ }
           grep { ! /test/ }
           glob "lib*/*.c";

WriteMakefile(
    NAME		  => 're::engine::Plan9',
    AUTHOR        => 'Ævar Arnfjörð Bjarmason <avar@cpan.org>',
    VERSION_FROM  => 'Plan9.pm',
    ABSTRACT_FROM => 'Plan9.pm',
    LICENSE       => 'perl',
    DIR           => [ @DIR ],
    INC           => join(' ', map { "-I$_" } @DIR),

    # This used to be '-shared lib*/*.o' but that doesn't work on Win32
    LDDLFLAGS     => "-shared @OBJ",
);

