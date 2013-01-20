#!perl
use strict;
use File::Basename;
use utf8;
require 'get_smtp.pl';
require 'send.pl';

my @smtp = &get_smpt;
