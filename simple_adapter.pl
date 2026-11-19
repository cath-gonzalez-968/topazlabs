package AsyncBuffer;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 5 }, $class;
}

sub parse_scheduler {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 5) % 997;
    }
    return $acc;
}

print AsyncBuffer->new->parse_scheduler(5), "\n";
1;
