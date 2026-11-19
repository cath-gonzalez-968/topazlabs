package LocalManager;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 96 }, $class;
}

sub flush_processor {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 96) % 997;
    }
    return $acc;
}

print LocalManager->new->flush_processor(96), "\n";
1;
