package LessUtils;

use StringUtils;

sub getFirstCaracter {
    return substr(StringUtils->trim($_[0]), 0, 1);
}

sub lineIsVariableDeclaration {
    my ($self, $line) = @_;

    $firstCaracter = getFirstCaracter($line);

    my $hasDeclarationSymbol         = $firstCaracter eq '@';
    my $containsDeclarationSeparator = index($line, ':') != -1;
    my $hasEndOfLineSymbol           = index($line, ';') != -1;
    my $isAnImport                   = index($line, 'import') > -1;

    return $hasDeclarationSymbol && $containsDeclarationSeparator && $hasEndOfLineSymbol && !$isAnImport;

}

1;
