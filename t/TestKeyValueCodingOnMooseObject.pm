package TestKeyValueCodingOnMooseObject;

use strict;
use warnings;

use strict;
use base qw(
    TestKeyValueCodingOnObject
);

use Test::More;

sub obj { return $_[0]->{obj} ||= _MooseTestThing->new() }

package _MooseTestThing;

use strict;
use warnings;

use Moose;
use Object::KeyValueCoding additions => 1;

has bacon           => ( is => "rw", isa => "Str", );
has shakespeare     => ( is => "rw", isa => "Str", );
has foo             => ( is => "rw", isa => "_MooseTestThing" );

sub marlowe { return "christopher" }
sub chaucer {
    my ( $self, $value ) = @_;
    if ( $value eq "geoffrey" ) { return "canterbury" }
    return "tales";
}
sub taylorColeridge { return [ "samuel", "xanadu", "kublai khan" ] }

sub _s {
    my ( $self, $value ) = @_;
    return uc($value);
}

sub donne {
    return {
        "john" => 'jonny',
        "bruce" => 'brucey'
    };
}

1;