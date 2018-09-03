package LessVariableExtractor;

use LessUtils;

sub extractVariableFromFile {
    my ($self, $file) = @_;
    
    my @variablesLines = ();

    open(my $fh, '<:encoding(UTF-8)', $file) or die "Could not open file '$file' $!";

    while( my $line = <$fh>)  {
        if (LessUtils->lineIsVariableDeclaration($line)) {
            push @variablesLines, $line;
        }
    }

    return @variablesLines
}

1;
