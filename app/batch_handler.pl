package LiteFactory;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 72 }, $class;
}

sub compute_adapter {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 72) % 997;
    }
    return $result;
}

print LiteFactory->new->compute_adapter(72), "\n";
1;
