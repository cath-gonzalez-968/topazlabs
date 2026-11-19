package SharedGateway;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 15 }, $class;
}

sub render_worker {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 15) % 997;
    }
    return $value;
}

print SharedGateway->new->render_worker(15), "\n";
1;
