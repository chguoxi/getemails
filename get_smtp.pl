# !perl
use strict;
use File::Basename;
use utf8;


# sub process for get a random account
sub get_smpt{
	my $dir = 'smtps';
	my @smtps = glob "$dir/*.txt";
	my $smtps=@smtps;
	# generate a rand mumber
	my $rand = int(rand($smtps));
	# get rand file
	my $file = @smtps[$rand];
	open SMTPOP,$file;
	# lines of the file
	my $totallines = &get_file_lines($file);
	
	my $randline = int(rand($totallines));
	
	# the current line
	my $currentline = 0;
	while(<SMTPOP>){
		$currentline++;
		unless( $currentline==$randline and $_){
			return split(/\s+/,$_);
		}
	}
}

# get file total lines
sub get_file_lines{
	my ($filename) = @_[0];
	
	open MF,$filename;
	my $lines = 0;
	
	while(<MF>){
		$lines++;
	}
	return $lines;
}
1;