package StringUtils;

sub trim {
    my ($self, my $s) = @_;

    $s =~ s/^\s+|\s+$//g;

    return $s;
}

1;
