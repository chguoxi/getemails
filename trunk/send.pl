#!perl
# 需安装 Authen::SASL模块
use Encode;
use utf8;
use Net::SMTP;

my $mailhost = "smtp.163.com"; # the smtp host

my $mailfrom = 'lunluorenadmin@163.com'; # your email address

my $mailto = '995306681@qq.com'; # the recipient list

my $subject = "测试发信";

my $text = "此为正文n第二行位于此。";

my $password = '15930561gx';	

$subject = Encode::encode("utf8", $subject);
$text = Encode::encode("utf8", $text);

send_email( $mailhost, $mailfrom, $mailto, $subject, $text);



sub send_email{
	my ($mailhost,$mailfrom,$mailto,$subject,$text) = @_;
	my $smtp = Net::SMTP->new($mailhost, Hello => 'localhost', Timeout => 120, Debug => 1);
	# anth login, type your user name and password here
	$smtp->auth($mailfrom,$password);
	$smtp->mail($mailfrom);
	$smtp->to($mailto);
	# Start the mail
	$smtp->data();
	# Send the header
	$smtp->datasend("Subject: $subject\n");
	# set mail from
	$smtp->datasend("From: $mailfrom\n");
	# the email address send to
	$smtp->datasend("To: $mailto\n");
	# line
	$smtp->datasend("\n");
	# Send the message
	$smtp->datasend("$text");
	# Send the termination string
	$smtp->dataend();
	$smtp->quit;
	
}

