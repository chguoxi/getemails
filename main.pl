# !perl
# main entrence
use strict;
# import method
require 'get_smtp.pl';
require 'send.pl';
# the speed of sending, how many second send an email
my $speed = 5;
# send how many emails have to change the proxy
my $chage_proxy = 2000;
# the receiver email directory
my $receivers = 'receivers';
# log file dir
my $logs = 'logs';

my @receivers_f = glob "$receivers/*.txt";
#mail title
my $subject = '测试发送邮件5';
#mail content
my $text    = '这是邮件内容，随机函数测试 tttt';

foreach my $receiver_f(@receivers_f){
	open RECEIVER,$receiver_f;
	while ( my $mailto = <RECEIVER> ){
		chomp $mailto;
		my ($mailfrom,$password,$mailhost,$serverport) = &get_smpt();
		send_email($mailhost,$mailfrom,$password,$mailto,$subject,$text);
	}
}




