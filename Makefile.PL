use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

WriteMakefile(
	      'NAME'		=> 'HTML::Latex',
	      'VERSION_FROM'	=> 'Latex.pm', # finds $VERSION
	      'PREREQ_PM'		=> { 
		XML::Simple => 1.04,
		HTML::TreeBuilder => 2.97
		},
	      );
