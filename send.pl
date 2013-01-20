#!perl
# To run the program, must install Authen::SASL Module
use Encode;
use utf8;
use Net::SMTP;
# define sender name
use constant SENDE_NAME=>'沦落人社区';

sub send_email{
	($mailhost,$mailfrom,$password,$port,$mailto,$subject,$text) = @_;
	my $smtp = Net::SMTP->new($mailhost, Hello => 'localhost', Timeout => 3, Port=>$port, Debug => 0);
	# anth login, type your user name and password here
	$smtp->auth($mailfrom,$password);
	$smtp->mail($mailfrom);
	$smtp->to($mailto);
	# Start the mail
	$smtp->data();
	# Send the header
	$smtp->datasend("Subject: $subject\n");
	# set mail from
	$smtp->datasend("From: ".SENDE_NAME."<$mailfrom>\n");
	# the email address send to
	$smtp->datasend("To: $mailto\n");
	# line
	$smtp->datasend("\n");
	# Send the message
	$smtp->datasend("$text");
	# Send the termination string
	$smtp->dataend();
	$smtp->quit;
	#return send email status
}
1;
