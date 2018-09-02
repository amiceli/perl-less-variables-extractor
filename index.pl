#!/usr/bin/perl

use LessVariableExtractor;

$pathToScan = @ARGV[0];

my $extractor = new LessVariableExtractor($pathToScan);

my @variables = $extractor->extractLessVariables();

writeFileLineByLine('variables.less', @variables);

sub writeFileLineByLine {
    my ($filename, @content) = @_;

    open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";

    foreach my $line (@content ){
        print $fh $line;
    }

    close $fh;
}
