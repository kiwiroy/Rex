use strict;
use warnings;

use Test::More tests => 167;

my %have_mods = (
  'Net::SSH2' => 1,
  'DBI'       => 1,
  'IPC::Shareable' => 1,
);

for my $m (keys %have_mods) {
  my $have_mod = 1;
  eval "use $m;";
  if($@) {
    $have_mods{$m} = 0;
  }
}

use_ok 'Rex::Batch';
use_ok 'Rex::Interface::Cache';
use_ok 'Rex::Interface::Cache::Base';
use_ok 'Rex::CLI';
use_ok 'Rex::Commands::Box';
use_ok 'Rex::Commands::Cloud';
use_ok 'Rex::Commands::Cron';

SKIP: {
  skip "DBI module not installed. Database Access won't be available.", 3 unless $have_mods{'DBI'};
  use_ok 'Rex::Commands::DB';
  use_ok 'Rex::Group::Lookup::DBI';
  use_ok 'Rex::Helper::DBI';
}

SKIP: {
  skip "Net::SSH2 module not installed. You need Net::SSH2 or Net::OpenSSH Module to make ssh connection.", 1 unless $have_mods{'Net::SSH2'};
  use_ok 'Rex::Interface::Connection::SSH';
}

SKIP: {
  skip "You need IPC::Shareable module to use Rex::Ouput modules.", 2 unless $have_mods{'IPC::Shareable'};
  use_ok 'Rex::Output::JUnit';
  use_ok 'Rex::Output';
}

SKIP: {
  skip "You need Paralle::ForkManager to use Parallel_ForkManager distribution method.", 1 unless $have_mods{'Parallel::ForkManager'};
  use_ok 'Rex::TaskList::Parallel_ForkManager';
}


use_ok 'Rex::Commands::Download';
use_ok 'Rex::Commands::File';
use_ok 'Rex::Commands::Fs';
use_ok 'Rex::Commands::Gather';
use_ok 'Rex::Commands::Host';
use_ok 'Rex::Commands::Iptables';
use_ok 'Rex::Commands::Kernel';
use_ok 'Rex::Commands::LVM';
use_ok 'Rex::Commands::MD5';
use_ok 'Rex::Commands::Network';
use_ok 'Rex::Commands::Partition';
use_ok 'Rex::Commands::Pkg';
use_ok 'Rex::Commands::Process';
use_ok 'Rex::Commands::Run';
use_ok 'Rex::Commands::SCM';

use_ok 'Rex::Commands::Service';
use_ok 'Rex::Commands::SimpleCheck';
use_ok 'Rex::Commands::Sysctl';
use_ok 'Rex::Commands::Tail';
use_ok 'Rex::Commands::Upload';
use_ok 'Rex::Commands::User';
use_ok 'Rex::Commands::Sync';
use_ok 'Rex::Commands';
use_ok 'Rex::Config';
use_ok 'Rex::Exporter';

use_ok 'Rex::File::Parser::Data';
use_ok 'Rex::File::Parser::Ini';

use_ok 'Rex::Fork::Manager';
use_ok 'Rex::Fork::Task';
use_ok 'Rex::FS::File';
use_ok 'Rex::Group::Entry::Server';
use_ok 'Rex::Group::Lookup::File';
use_ok 'Rex::Group::Lookup::YAML';
use_ok 'Rex::Group';
use_ok 'Rex::Hardware::Host';
use_ok 'Rex::Hardware::Kernel';
use_ok 'Rex::Hardware::Memory';
use_ok 'Rex::Hardware::Network::FreeBSD';
use_ok 'Rex::Hardware::Network::Linux';
use_ok 'Rex::Hardware::Network::NetBSD';
use_ok 'Rex::Hardware::Network::OpenBSD';
use_ok 'Rex::Hardware::Network::Solaris';
use_ok 'Rex::Hardware::Network';
use_ok 'Rex::Hardware::Swap';
use_ok 'Rex::Hardware';
use_ok 'Rex::Helper::Array';
use_ok 'Rex::Helper::Hash';
use_ok 'Rex::Helper::SSH2::Expect';
use_ok 'Rex::Helper::SSH2';
use_ok 'Rex::Helper::System';
use_ok 'Rex::Helper::UserAgent';
use_ok 'Rex::Interface::Connection::Base';
use_ok 'Rex::Interface::Connection::Fake';
use_ok 'Rex::Interface::Connection::HTTP';
use_ok 'Rex::Interface::Connection::HTTPS';
use_ok 'Rex::Interface::Connection::Local';

use_ok 'Rex::Interface::Connection';
use_ok 'Rex::Interface::Exec::Base';
use_ok 'Rex::Interface::Exec::HTTP';
use_ok 'Rex::Interface::Exec::Local';
use_ok 'Rex::Interface::Exec::SSH';
use_ok 'Rex::Interface::Exec::Sudo';
use_ok 'Rex::Interface::Exec';
use_ok 'Rex::Interface::Executor::Base';
use_ok 'Rex::Interface::Executor::Default';
use_ok 'Rex::Interface::Executor';
use_ok 'Rex::Interface::File::Base';
use_ok 'Rex::Interface::File::HTTP';
use_ok 'Rex::Interface::File::Local';
use_ok 'Rex::Interface::File::SSH';
use_ok 'Rex::Interface::File::Sudo';
use_ok 'Rex::Interface::File';
use_ok 'Rex::Interface::Fs::Base';
use_ok 'Rex::Interface::Fs::HTTP';
use_ok 'Rex::Interface::Fs::Local';
use_ok 'Rex::Interface::Fs::SSH';
use_ok 'Rex::Interface::Fs::Sudo';
use_ok 'Rex::Interface::Fs';
use_ok 'Rex::Logger';
use_ok 'Rex::Pkg::ALT';
use_ok 'Rex::Pkg::Debian';
use_ok 'Rex::Pkg::FreeBSD';
use_ok 'Rex::Pkg::Gentoo';
use_ok 'Rex::Pkg::Mageia';
use_ok 'Rex::Pkg::NetBSD';
use_ok 'Rex::Pkg::OpenBSD';
use_ok 'Rex::Pkg::Redhat';
use_ok 'Rex::Pkg::SunOS::OpenCSW';
use_ok 'Rex::Pkg::SunOS::pkg';
use_ok 'Rex::Pkg::SunOS';
use_ok 'Rex::Pkg::SuSE';
use_ok 'Rex::Pkg::Ubuntu';
use_ok 'Rex::Pkg';
use_ok 'Rex::Profiler';
use_ok 'Rex::Report::Base';
use_ok 'Rex::Report';
use_ok 'Rex::SCM::Git';
use_ok 'Rex::SCM::Subversion';
use_ok 'Rex::Service::Redhat::systemd';
use_ok 'Rex::Service::Gentoo::systemd';
use_ok 'Rex::Service::ALT::systemd';
use_ok 'Rex::Service::ALT';
use_ok 'Rex::Service::Debian';
use_ok 'Rex::Service::FreeBSD';
use_ok 'Rex::Service::Gentoo';
use_ok 'Rex::Service::Mageia';
use_ok 'Rex::Service::Mageia::systemd';
use_ok 'Rex::Service::NetBSD';
use_ok 'Rex::Service::OpenBSD';
use_ok 'Rex::Service::Redhat::systemd';
use_ok 'Rex::Service::Redhat';
use_ok 'Rex::Service::SunOS::svcadm';
use_ok 'Rex::Service::SunOS';
use_ok 'Rex::Service::SuSE::systemd';
use_ok 'Rex::Service::SuSE';
use_ok 'Rex::Service::Ubuntu';
use_ok 'Rex::Service';
use_ok 'Rex::Shared::Var::Array';
use_ok 'Rex::Shared::Var::Hash';
use_ok 'Rex::Shared::Var::Scalar';
use_ok 'Rex::Shared::Var';
use_ok 'Rex::Sudo::File';
use_ok 'Rex::Task';
use_ok 'Rex::TaskList::Base';
use_ok 'Rex::TaskList';
use_ok 'Rex::Template';
use_ok 'Rex::Transaction';
use_ok 'Rex::User::FreeBSD';
use_ok 'Rex::User::Linux';
use_ok 'Rex::User::NetBSD';
use_ok 'Rex::User::OpenBSD';
use_ok 'Rex::User::SunOS';
use_ok 'Rex::User::OpenWrt';
use_ok 'Rex::User';
use_ok 'Rex::Interface::Shell';
use_ok 'Rex::Interface::Shell::Csh';
use_ok 'Rex::Interface::Shell::Tcsh';
use_ok 'Rex::Interface::Shell::Default';
use_ok 'Rex::Interface::Shell::Bash';
use_ok 'Rex::Interface::Shell::Base';
use_ok 'Rex::Interface::Shell::Sh';
use_ok 'Rex::Interface::Shell::Zsh';
use_ok 'Rex';
use_ok 'Rex::CMDB::Base';
use_ok 'Rex::Test';
use_ok 'Rex::Test::Base';
use_ok 'Rex::Test::Base::has_content';
use_ok 'Rex::Test::Base::has_file';
use_ok 'Rex::Test::Base::has_package';
use_ok 'Rex::Test::Base::has_service_running';
use_ok 'Rex::Test::Base::has_service_stopped';

use Data::Dumper;
my @hosts = Rex::Commands::evaluate_hostname("web[01..10]");
ok(
  join( ",", @hosts ) eq
    "web01,web02,web03,web04,web05,web06,web07,web08,web09,web10",
  "host evaluation 1"
);

@hosts = Rex::Commands::evaluate_hostname("web[01..10]:5000");
ok(
  join( ",", @hosts ) eq
    "web01:5000,web02:5000,web03:5000,web04:5000,web05:5000,web06:5000,web07:5000,web08:5000,web09:5000,web10:5000",
  "host evaluation 2"
);
