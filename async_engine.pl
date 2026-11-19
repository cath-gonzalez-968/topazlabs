package AsyncDispatcher;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 11 }, $class;
}

sub fetch_buffer {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 11) % 997;
    }
    return $count;
}

print AsyncDispatcher->new->fetch_buffer(11), "\n";
1;
