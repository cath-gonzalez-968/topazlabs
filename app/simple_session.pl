package SecureLoader;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 26 }, $class;
}

sub compute_factory {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 26) % 997;
    }
    return $count;
}

print SecureLoader->new->compute_factory(26), "\n";
1;
