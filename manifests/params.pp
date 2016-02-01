# == Class: confluence::params
#
# Defines default values for confluence module
#
class confluence::params {
  case $::osfamily {
    /RedHat/: {
      if $::operatingsystemmajrelease == '7' {
        $service_file_location = '/usr/lib/systemd/system/confluence.service'
        $service_file_template = 'confluence/confluence.service.erb'
        $service_lockfile      = '/var/lock/subsys/confluence'
      } elsif $::operatingsystemmajrelease == '6' {
        $service_file_location = '/etc/init.d/confluence'
        $service_file_template = 'confluence/confluence.initscript.erb'
        $service_lockfile      = '/var/lock/subsys/confluence'
      } else {
        fail("${::operatingsystem} ${::operatingsystemmajrelease} not supported")
      }
    }
    /Debian/: {
      $service_file_location   = '/etc/init.d/confluence'
      $service_file_template   = 'confluence/confluence.initscript.erb'
      $service_lockfile        = '/var/lock/confluence'
    } default: {
      fail("${::operatingsystem} ${::operatingsystemmajrelease} not supported")
    }
  }
}
