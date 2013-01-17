#!perl

use Net::SMTP;

my $mailhost = "smtp.163.com"; # the smtp host

my $mailfrom = 'lunluorenadmin@163.com'; # your email address

my $mailto = '995306681@qq.com'; # the recipient list

my $subject = "此为标题";
my $text = "此为正文n第二行位于此。";

my $smtp = Net::SMTP->new($mailhost, Hello => 'localhost', Timeout => 120, Debug => 1);

# anth login, type your user name and password here

$smtp->auth('lunluorenadmin@163.com','15930561gx'); #用户名和密码确定没错

$smtp->mail($mailfrom);
$smtp->to($mailto);

# Start the mail

$smtp->data();

# Send the header

$smtp->datasend("To: $mailto");
$smtp->datasend("From: $mailfrom");
$smtp->datasend("Subject: $subject");
$smtp->datasend("n");

# Send the message

$smtp->datasend("$text");

# Send the termination string

$smtp->dataend();
$smtp->quit;
