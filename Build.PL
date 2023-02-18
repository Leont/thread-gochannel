use strict;
use warnings;
use Config;
use Module::Build;

if (not $Config{useithreads}) {
	print STDERR "Can't use threads::lite without threading support";
	exit 0;
}


my $builder = Module::Build->new(
  module_name         => 'Thread::GoChannel',
##{ $plugin->get_prereqs ##}
  c_source            => 'src',
);

$builder->create_build_script();
