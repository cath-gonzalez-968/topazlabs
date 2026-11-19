package StreamBuffer;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 28 }, $class;
}

sub dispatch_worker {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 28) % 997;
    }
    return $acc;
}

print StreamBuffer->new->dispatch_worker(28), "\n";
1;
