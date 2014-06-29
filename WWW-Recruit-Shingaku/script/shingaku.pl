use strict;
use warnings;
use utf8;
use Encode;
use Carp;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Data::Dumper;

use WWW::Recruit::Shingaku::Subject;

my $params = {
 'pref_cd' => 12,
 'keyword' => '数学',
};

my $shingaku = WWW::Recruit::Shingaku->new($params);

my @keys = keys $shingaku->xml_parse;
my @obj = map{$shingaku->xml_parse->{$_}}@keys;

my $subject = WWW::Recruit::Shingaku::Subject->new({keyword => '数学'});

print Dumper $subject->xml_parse;


