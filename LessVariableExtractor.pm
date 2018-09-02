package LessVariableExtractor;

use LessUtils;

sub new {
    my $class = shift;

    my $self = {
        scanPath   => shift,
    };

    # $self->{URL}
    bless $self, $class;

    return $self;
}

sub extractLessVariables {
    my ($self) = @_;

    opendir (DIR, $self->{scanPath}) or die $!;

    my @variables = ();

    while (my $file = readdir(DIR)) {
        if ($file =~ /\.less$/i) {
            my $filePath = $self->{scanPath} . "/" . $file;
            my @loopVariables = $self->readFileContent($filePath);

            foreach my $variableLine (@loopVariables) {
                push (@variables, $variableLine);
            }
        }
    }

    closedir(DIR);

    return @variables;
}

sub readFileContent {
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
