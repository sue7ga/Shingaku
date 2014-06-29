package WWW::Recruit::Shingaku;

use 5.008005;
use strict;
use warnings;
our $VERSION = "0.01";
use Encode;
use LWP::UserAgent;
use URI;
use URI::Escape;

use constant URL => 'http://webservice.recruit.co.jp/shingaku/school/v1/?key=ad425e84441a387a';

sub new{
  my($class,$p) = @_;
  my $ua = LWP::UserAgent->new;
  bless{p => $p,ua => $ua},$class;
}

sub _request{
  my($self) = @_;
  my $url = URI->new(URL);
  my $params = $self->{p};
  my $keyword = Encode::encode_utf8($params->{keyword});
  $keyword = uri_escape($keyword);
  my $count   = $params->{count};
  my $format  = $params->{format};
  my $code    = $params->{code};
  return $url."&keyword=$keyword";
}

sub get_base{
 my($self) = shift;
 my $url = $self->_request;
 my $response = $self->{ua}->get($url);
 return $response->{_content};
}

use XML::Simple;

sub xml_parse{
 my $self = shift;
 my $xml_data = $self->get_base;
 my $data = XMLin($xml_data);
 return $data->{school};
}

1;

__END__

=encoding utf-8

=head1 NAME

WWW::Recruit::Shingaku - It's new $module

=head1 SYNOPSIS

    use WWW::Recruit::Shingaku;

=head1 DESCRIPTION

WWW::Recruit::Shingaku is ...

=head1 LICENSE

Copyright (C) sue7ga.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

sue7ga E<lt>sue77ga@gmail.comE<gt>

=cut

