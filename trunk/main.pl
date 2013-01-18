# !perl
# main entrence
use strict;
# import method
require 'send.pl';
require 'mail.pl';
# the speed of sending, how many second send an email
my $speed = 5;
# send how many emails have to change the proxy
my $chage_proxy = 2000;
# the receiver email directory
my $receivers = 'receivers';
# log file dir
my $logs = 'logs';

my @receivers_f = glob "$receivers/*.txt";

foreach my $receiver_f(@receivers_f){
	
}




