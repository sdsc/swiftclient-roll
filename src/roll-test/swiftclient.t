#!/usr/bin/perl -w
# swiftclient roll installation test.  Usage:
# swiftclient.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/swiftclient';
my $output;

my $TESTFILE = 'tmpswiftclient';

my @EXES = ('netaddr','oslo-config-generator','swift');

if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'swiftclient installed');
} else {
  ok(! $isInstalled, 'swiftclient not installed');
}
SKIP: {

  skip 'swiftclient not installed', 4 if ! $isInstalled;
  foreach $exe(@EXES) {
       $output=`module load swiftclient; /opt/swiftclient/bin/$exe  --help </dev/null 2>&1`;
       like($output, qr/usage: $exe|$exe shell/, "$exe runs");
  }
  `/bin/ls /opt/modulefiles/applications/swiftclient/[0-9]* 2>&1`;
  ok($? == 0, 'swiftclient module installed');
  `/bin/ls /opt/modulefiles/applications/swiftclient/.version.[0-9]* 2>&1`;
  ok($? == 0, 'swiftclient version module installed');
  ok(-l '/opt/modulefiles/applications/swiftclient/.version',
     'swiftclient version module link created');

}

`rm -fr $TESTFILE*`;
