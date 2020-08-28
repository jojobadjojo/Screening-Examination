class packages {
	package { 'vim':
		ensure => 'installed'
	}
	package { 'curl':
		ensure => 'installed'
	}
	package { 'git':
		ensure => 'installed'
	}
	package { 'wget':
		ensure => 'installed'
	}
}
clas add_user {
	user { 'monitor':
		ensure => 'present',
		managehome => true,
	}
	exec { 'shell':
		path => '#!/bin/bash',
	}
}
class directories {
	file { '/home/monitor/scripts/':
		ensure => 'directory',
		owner => 'monitor'
		mode => '0750',
	}
	exec { 'Memory Check Script':
		command => "/usr/bin/wget -q"
	}
}	