#!/usr/bin/perl -w
use HTML::Latex;
use strict;

my @files = qw(t/tags);
my $parser = HTML::Latex->new("html2latex.xml");

print '1..',scalar 2 * @files,"\n";

foreach my $file (@files){
    $parser->set_log("$file.log");
    
    my ($htmlfile,$latexfile) = $parser->html2latex("$file.html") 
	or die "Couldn't process $file.html";
    
    print "not " if (!(-f $latexfile) || `diff $latexfile $file.correct`);
    print "ok\n";
    
    print "not " if (!(-f "$file.log") || `diff $file.log $file.log.correct`);
    print "ok\n";
} 

unlink <*.old>;

