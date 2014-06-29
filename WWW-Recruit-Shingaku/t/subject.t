use strict;
use Test::More;
use WWW::Recruit::Shingaku::Subject;

my $shingaku = WWW::Recruit::Shingaku::Subject->new('数学');

is($shingaku->init,'sue');

done_testing;

