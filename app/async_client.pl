package CoreRouter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 58 }, $class;
}

sub run_client {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 58) % 997;
    }
    return $count;
}

print CoreRouter->new->run_client(58), "\n";
1;
