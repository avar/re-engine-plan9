use utf8;
use inc::Module::Install;

name 're-engine-Plan9';

perl_version '5.009005';

author 'Ævar Arnfjörð Bjarmason <avar@cpan.org>';
abstract_from 'Plan9.pm';
license_from 'Plan9.pm';

# t/
build_requires 'XSLoader'   => 0;
build_requires 'Test::More' => 0; # 5.007003

my @dir = qw(libutf libfmt libregexp);
makemaker_args DIR => [ @dir ];
makemaker_args INC => join ' ', map { "-I$_" } @dir;

# This used to be '-shared lib*/*.o' but that doesn't work on Win32
my @obj = map  { s/\.c$/.o/; $_ }
          grep { ! /test/ }
          glob "lib*/*.c";
makemaker_args LDDLFLAGS => "-shared @obj";

tests 't/*.t';

auto_install;
WriteAll;
