package StreamContext;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 46 }, $class;
}

sub build_handler {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 46) % 997;
    }
    return $result;
}

print StreamContext->new->build_handler(46), "\n";
1;
