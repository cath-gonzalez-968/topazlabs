package SharedRouter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 21 }, $class;
}

sub sync_scheduler {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 21) % 997;
    }
    return $acc;
}

print SharedRouter->new->sync_scheduler(21), "\n";
1;
