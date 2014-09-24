node 'pe-332-agent' {
  # Apparently the icinga module I decided to use needs a few things to work correctly. While not ideal I've moved them into here so they don't get in the way of the demo.
  package { 'httpd':
    ensure => 'present',
  }

  service { 'httpd':
    ensure  => 'running',
    require => Package['httpd'],
  }

  nagios_contactgroup {'prod':
    contactgroup_name => 'production',
    target            => '/etc/icinga/objects/contactgroup.cfg',
    owner             => 'icinga',
    group             => 'icinga',
    notify            => Service['icinga'],
    require           => Package['icinga'],
  }

  class { 'icinga':
    manage_repo   => true,
    server        => true,
    use_auth      => false,
    icinga_vhost  => '/etc/httpd/conf.d/icinga.conf',
  }
}
