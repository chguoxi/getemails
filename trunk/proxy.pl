use Net::Proxy;
use constant REMOVE_HOST=>'59.188.28.105';
use constant REMOVE_PORT=>'22';

# proxy connections from localhost:6789 to remotehost:9876
# using standard TCP connections
my $proxy = Net::Proxy->new(
	{   in  => { type => 'tcp', host=>'localhost', port => '8085' },
		out => { type => 'tcp', host => REMOVE_HOST, port => '22' },
	}
);

# register the proxy object
$proxy->register();

# connect
$proxy->connet( host=>REMOVE_HOST,port=>REMOVE_PORT,);

# and you can setup multiple proxies

# and now proxy connections indefinitely
Net::Proxy->mainloop();