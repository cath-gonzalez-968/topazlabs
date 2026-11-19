package DynamicProvider;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 69 }, $class;
}

sub render_context {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 69) % 997;
    }
    return $acc;
}

print DynamicProvider->new->render_context(69), "\n";
1;
