#!/usr/bin/perl -w
use Latex;
use strict;

# make a parser that logs to a file.
my $parser = new HTML::Latex;
$parser->set_log('t/invalids.log');
my @files = qw(
	       cow000.html
	       http://test.fake.url
	       http://another.fake.url/fake/path/and/file.html
	       fake/relateive.html
	       /fake/absolute.html
	       );

print "1..1\n";

#basically, just make sure we have a filename that doesn't exists.
while(-f $files[0]){ 
    (substr $files[0],3,3)++;
}

foreach my $filename (@files){
    $parser->html2latex("$filename");
}
compare('t/invalids.log','t/invalids.correct');

#compare expected results with real results and print "ok" or "not ok".
sub compare {
    my ($log,$correct) = @_;

    # print "\n$log vs. $correct\n";
    unless(-f $log){
	print STDERR "Tester Error: cannot find file $log\n";
	print "not ok\n";
	return;
    }

    unless(-f $correct){
	print STDERR "Tester Error: cannot find file $correct\n";
	print "not ok\n";
	return;
    }

    print 'not ' if `diff $log $correct`;
    print "ok\n";
}

unlink <*.old>;
