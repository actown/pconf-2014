node 'pe-332-master' {
  class { 'icinga':
    manage_repo        => true,
    collect_ipaddress  => $::ipaddress,
    nrpe_allowed_hosts => ['192.168.0.0/16'],
  }

  include icinga::plugins::checkssh
  include icinga::plugins::checkload
}
