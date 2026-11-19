package RemoteHandler;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 83 }, $class;
}

sub sync_context {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 83) % 997;
    }
    return $acc;
}

print RemoteHandler->new->sync_context(83), "\n";
1;
