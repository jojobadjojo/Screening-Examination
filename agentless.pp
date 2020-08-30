node 'bpx.server.local' {
        include  vim
        include  git
        include  curl
        include add_user
        include directories
        include git_dl
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
                mode => '0750',
        }
}
class git_dl {
        exec { 'get-mem-check':
                command => '/bin/wget https://raw.githubusercontent.com/jojobadjojo/Screening-Examination/master/Memory_check.sh',
                path => "/home/monitor/scripts"
        }
}