#!/usr/bin/perl

use LessVariableExtractor;
use File::Find qw(find);

my $pathToScan   = @ARGV[0];
my @allVariables = ();

listFiles($pathToScan);

writeFileLineByLine('variables.less', @allVariables);

sub listFiles {
    my ($dir) = @_;

    my $pattern  = '.less$';
    my $callback = sub {
        return unless /$pattern/;

        my @loopVariables = LessVariableExtractor->extractVariableFromFile($File::Find::name);

        foreach my $variableLine (@loopVariables) {
            push (@allVariables, $variableLine);
        }
    };

    find $callback, $dir;
}



sub writeFileLineByLine {
    my ($filename, @content) = @_;

    open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";

    foreach my $line (@content ){
        print $fh $line;
    }

    close $fh;
}
