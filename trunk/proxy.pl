use Net::Proxy;
use constant REMOVE_HOST=>'59.188.28.105';
use constant REMOVE_PORT=>'22';
use constant REMOVE_USER=>'admin';
use constant REMOVE_PASSWORD=>'bwebs123';

# proxy connections from localhost:6789 to remotehost:9876
# using standard TCP connections
my $proxy = Net::Proxy->new(
	{   in  => { type => 'tcp', host=>'localhost', port => '8085' },
		out => { type => 'tcp', host => REMOVE_HOST, port => REMOVE_PORT, username=>REMOVE_USER, password=>REMOVE_PASSWORD },
	}
);

# register the proxy object
$proxy->register();

# and you can setup multiple proxies

# and now proxy connections indefinitely
Net::Proxy->mainloop();