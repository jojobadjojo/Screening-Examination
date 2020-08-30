node 'bpx.server.local' {
        include  vim
        include  git
        include  curl
        include add_user
        include directories
        include src_link
}

class  vim{
package { 'vim':
    ensure => installed,
 }
}
class  git{
package { 'git':
    ensure => installed,
 }
}
class  curl{
package { 'curl':
    ensure => installed,
 }
}
class add_user {
        user { 'monitor':
                ensure => 'present',
                managehome => true,
                shell => "/bin/bash",
        }
}
class directories {
        file { '/home/monitor/scripts/':
                ensure => 'directory',
                owner => 'monitor',
                mode => '0755',
        }
        exec { 'get-mem-check':
                command => '/bin/wget https://raw.githubusercontent.com/jojobadjojo/Screening-Examination/master/memory_check',
                path => "/home/monitor/scripts"
                owner => 'monitor',
                mode => '0755',
        }
}
class src_link {
        file { '/home/monitor/src/':
                ensure => 'directory',
                owner => 'monitor',
                mode => '0755',
        }
        file { '/home/scripts/memory_check'
        	ensure => 'link'
        	target =>  '/home/monitor/src/my_memory_check'

        }
}