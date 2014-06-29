package WWW::Recruit::Shingaku::Subject;

use WWW::Recruit::Shingaku;
use strict;
use warnings;
use utf8;
use URI::Escape;

sub new{
 my($class,$opt) = @_;
 my $ua = LWP::UserAgent->new;
 my $self = {
   keyword => $opt->{keyword},
   ua => $ua,
 };
 bless $self,$class;
 return $self;
}

sub get_subject_url{
 my($self) = @_;
 my $baseurl = WWW::Recruit::Shingaku::URL;
 my $keyword  = Encode::encode_utf8($self->{keyword});
 $keyword = uri_escape($keyword);
 my $url = $baseurl."&keyword=$keyword";
 return $url;
}

sub get_subject{
 my $self = shift;
 my $url = $self->get_subject_url;
 my $response = $self->{ua}->get($url);
 return $response;
}

use XML::Simple;

sub xml_parse{
 my $self = shift;
 my $xml_data = $self->get_subject;
 my $data = XMLin($xml_data);
 return $data;
}


1;

